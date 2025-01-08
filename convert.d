module convert;

import std.algorithm;
import std.array;
import std.stdio;

import cpptod; // for Tree

import dparsergen.core.dynamictree;
import dparsergen.core.nodetype;

import dparse.ast;
import dparse.astprinter;
import dparse.lexer; 

import dsourceprinter;

void printd(Tree tree, string prefix = "") {
    import std.range : repeat;
    import std.array;
    if (tree is null) {
        writeln(prefix, "null");
        return;
    }
    string text = tree.asText;
    writeln(prefix, text, " → ", tree.nodeType  );
    // prefix ~= tree.childs.length > 1 ? " | " : "  ";
    foreach (child; tree.childs) {
        printd(child, prefix ~ "  ");
    }
}

string asText(Tree node) {
    return node.nodeType == NodeType.token ? node.content : node.name;
}

void transpileFile(Tree sourceTree) {

    ASTNode destinationTree = convertTranslationUnit(sourceTree);

    // print the tree. 
    // TODO: replace with a dfmt printer
    File output = File("test.d", "w");
    DSourcePrinter printer = new DSourcePrinter(output);
    destinationTree.accept(printer);
}

ASTNode convertTranslationUnit(Tree tree) {

    if (tree.nodeType != NodeType.nonterminal
        || tree.name != "TranslationUnit")
        throw new Exception("File does not contain a TranslationUnit");

    Module m = new Module();
    m.moduleDeclaration = new ModuleDeclaration();
    m.moduleDeclaration.tokens ~= Token(tok!"module","module",0,0,0);
    m.moduleDeclaration.moduleName = new IdentifierChain();
    m.moduleDeclaration.moduleName.identifiers ~= Token(tok!"identifier","mymodule",0,0,0);
    int line = 0;
    int column = 5;
    int index = 5; // count of characters in the file

    auto root = tree.childs[0]; // TranslationUnit has only one child which is an array
    
    // return m;
    foreach (child; root.childs) {
        writeln("\nProcessing: ", child.name);

        switch(child.name) {
            case "SimpleDeclaration1":
                auto decl = convertSimpleDeclaration1(child);
                m.declarations ~= decl;
                m.tokens ~= decl.tokens;
                // TODO: fill tokens from m.declaration
                break;
            case "FunctionDefinitionGlobal":
                auto funcs = convertFunctionDefinitionGlobal(child);
                m.declarations ~= funcs;
                m.tokens ~= funcs.tokens;
                // TODO: fill tokens from m.declaration
                break;
            default:
                stderr.writeln("Encountered an unknown node in TranslationUnit: ", child.nodeType, ":", child.name,"\"", child.toString() ,"\"");
        }
    }

    return m;

}

Declaration convertSimpleDeclaration1(Tree tree) {

    if (tree.nodeType != NodeType.nonterminal
        || tree.name != "SimpleDeclaration1")
        throw new Exception("Expected SimpleDeclaration1");


    if (!tree.hasChildWithName("declSeq")) {
        writeln("first child: ",tree.childName(0));
        throw new Exception("Expected DeclSpecifierSeq in SimpleDeclaration1");
    }
    
    auto declspec_c = tree.childs[0].childs[0];

    // get the type for this declspec
    string typename_c;

    // todo: maybe no type keyword, but a custom type
    auto typekeyword = declspec_c.childs[0];
    // TODO: deal with custom types
    if (typekeyword.name == "TypeKeyword") {
        typename_c = typekeyword.childs[0].content;
    }

    // fill the type
    auto varDecl = new VariableDeclaration();
    varDecl.type = new Type();
    varDecl.type.type2 = new Type2();
    varDecl.type.type2.builtinType = tok!"int";
    varDecl.type.type2.tokens ~= Token(tok!"int","",0,0,0);

    printd(tree);
    foreach(noptrdecl; tree.childs[1].childs) {
        if (noptrdecl.nodeType != NodeType.nonterminal
            || noptrdecl.name != "NoptrDeclarator")
        {
            continue; // skip the commas
        }

        // fill the name
        string varname_c = noptrdecl.childs[0].childs[1].childs[0].content;

        writeln("name: ", typename_c, " ", varname_c);
        Declarator declarator = new Declarator();
        auto declToken = Token(tok!"identifier",varname_c,0,0,0);
        declarator.name = declToken;
        declarator.tokens ~= declToken;           
        varDecl.declarators ~= declarator;
        varDecl.tokens ~= declarator.tokens;

    }

    Declaration decl = new Declaration();
    decl.variableDeclaration = varDecl;
    return decl;
}

Declaration convertFunctionDefinitionGlobal(Tree tree) {
    if (tree.nodeType != NodeType.nonterminal
        || tree.name != "FunctionDefinitionGlobal")
        throw new Exception("Expected FunctionDefinitionGlobal");


/+
    /** */ bool hasAuto;
    /** */ bool hasRef;
    /** */ Type returnType;
    /** */ Token name;
    /** */ TemplateParameters templateParameters;
    /** */ Parameters parameters;
    /** */ Constraint constraint;
    /** */ FunctionBody functionBody;
    /** */ MemberFunctionAttribute[] memberFunctionAttributes;
    /** */ string comment;
    /** */ Attribute[] attributes;
    /** */ StorageClass[] storageClasses;
+/
    auto funcdecl_d = new FunctionDeclaration();

    auto funcdefhead_c = tree.childs[0];
    auto funcbodysrc_c = tree.childs[1];

    funcdecl_d.returnType = new Type();


    auto child_c = funcdefhead_c.childs[0].childs[0].childs[0];
    // TODO: deal with custom types
    if (child_c.name == "TypeKeyword") {
        string name = child_c.childs[0].content;
        // TODO: use a type map
        if (name == "int") {
            auto funcToken = Token(tok!"int",name,0,0,0);
            auto type2 = new Type2();
            type2.builtinType = tok!"int";
            type2.tokens ~= funcToken;
            funcdecl_d.returnType.type2 = type2;
        }
    }

    auto funcdecltor_c = funcdefhead_c.childs[1];
    string funcname = funcdecltor_c.childs[0].childs[0].childs[1].childs[0].content;
    funcdecl_d.name = Token(tok!"",funcname,0,0,0);
    funcdecl_d.tokens ~= Token(tok!"identifier",funcname,0,0,0);

    funcdecl_d.functionBody = new FunctionBody();
    funcdecl_d.functionBody.specifiedFunctionBody = new SpecifiedFunctionBody();
    funcdecl_d.functionBody.specifiedFunctionBody.blockStatement = new BlockStatement();

    auto declStmts_d = new DeclarationsAndStatements();
    funcdecl_d.functionBody.specifiedFunctionBody.blockStatement.declarationsAndStatements = declStmts_d;

    auto stmtList_c = funcbodysrc_c;
    // printd(stmtList_c);
    foreach(stmt_c; stmtList_c.childs[1].childs[1].childs) {
        writeln("stmt: ", stmt_c.name);
        if (stmt_c.name == "SimpleDeclaration1") {
            auto declorstmt = new DeclarationOrStatement();
            declorstmt.declaration = convertSimpleDeclaration1(stmt_c);
            declStmts_d.declarationsAndStatements ~= declorstmt;
        }
        else if (stmt_c.name == "Statement") {
            declStmts_d.declarationsAndStatements ~= convertStatement(stmt_c);
        }
    }

    Declaration decl_d = new Declaration();
    decl_d.functionDeclaration = funcdecl_d;
    decl_d.tokens ~= funcdecl_d.tokens;
    return decl_d;

}

DeclarationOrStatement convertStatement(Tree tree) {

// DeclarationOrStatement -> Statement -> StatementNoCaseNoDefault

    StatementNoCaseNoDefault simpleStmt_d = new StatementNoCaseNoDefault();

    auto jumpStmt_c = tree.childs[1];
    // printd(jumpStmt_c);
    if (jumpStmt_c.name == "JumpStatement") { // TODO: check token
        ReturnStatement returnStmt_d = new ReturnStatement();
        string expr_c = jumpStmt_c.childs[0].childs[1].childs[0].content;
        // TODO: user convertExpression
        auto expr_d = new Expression();
        auto uniExpr_d = new UnaryExpression();       
        expr_d.items ~= uniExpr_d;
        auto primaryExpr_d = new PrimaryExpression();
        uniExpr_d.primaryExpression = primaryExpr_d;
        auto ident_d = new IdentifierOrTemplateInstance();
        primaryExpr_d.identifierOrTemplateInstance = ident_d;
        ident_d.identifier = Token(tok!"identifier",expr_c,0,0,0);
        returnStmt_d.expression = expr_d;
        simpleStmt_d.returnStatement = returnStmt_d;
    }



    Statement stmt_d = new Statement();
    stmt_d.statementNoCaseNoDefault = simpleStmt_d;

    DeclarationOrStatement declOrStmt_d = new DeclarationOrStatement();
    declOrStmt_d.statement = stmt_d;
    return declOrStmt_d;
}
 
