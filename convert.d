module convert;

import std.algorithm;
import std.array;
import std.stdio;
import std.range : repeat;
import std.conv;

// for import type Tree
// defined there as:
//  alias Tree = DynamicParseTree!(Location, LocationRangeStartLength);
import cpptod;

import dparsergen.core.dynamictree;
import dparsergen.core.nodetype;

import dparse.ast;
import dparse.astprinter;
import dparse.lexer;

import dsourceprinter;

IdType[string] typeTokenMap = [
    "int": tok!"int",
    "void": tok!"void",
    "float": tok!"float",
    "double": tok!"double",
    "short": tok!"short",
    "long": tok!"long",
    "bool": tok!"bool",
];

void showTree(Tree root, int depth = 1000, string prefix = "",) {

    showTreeRec(root, 0, depth, prefix);

}

void showTreeRec(Tree root, int index, int depth = 1000, string prefix = "") {
    if (depth == 0) {
        return;
    }
    if (root is null) {
        writeln(prefix, "«null»");
        return;
    }
    string text = root.asText;
    writeln(prefix, "[", index.to!int, "] ", text, " → ", root.nodeType);
    prefix ~= root.childs.length > 1 ? "│  " : "   ";

    index = 0;
    foreach (child; root.childs) {
        showTreeRec(child, index++, depth - 1, prefix);
    }
}

string asText(Tree node) {
    return node.nodeType == NodeType.token ? node.content : node.name;
}

Token createIdentifier(string text) {
    return Token(tok!"identifier", text, 0, 0, 0);
}

void transpileFile(Tree root) {

    writeln(root.start());
    showTree(root);

    ASTNode destinationTree = convertTranslationUnit(root);

    // auto xmlprinter = new XMLPrinter();
    // xmlprinter.output = std.stdio.stdout;
    // destinationTree.accept(xmlprinter);

    // print the tree. 
    // TODO: replace with a dfmt printer
    File output = File("test.d", "w");
    DSourcePrinter printer = new DSourcePrinter(output);
    destinationTree.accept(printer);
    output.close();
}

ASTNode convertTranslationUnit(Tree tree) {

    if (tree.nodeType != NodeType.nonterminal
        || tree.name != "TranslationUnit")
        throw new Exception("File does not contain a TranslationUnit");

    Module m = new Module();
    m.moduleDeclaration = new ModuleDeclaration();
    m.moduleDeclaration.tokens ~= Token(tok!"module", "module", 0, 0, 0);
    m.moduleDeclaration.moduleName = new IdentifierChain();
    m.moduleDeclaration.moduleName.identifiers ~= Token(tok!"identifier", "mymodule", 0, 0, 0);
    int line = 0;
    int column = 5;
    int index = 5; // count of characters in the file

    // TranslationUnit contains one an array containing the declarations of the unit
    auto root = tree.childs[0];

    // Inside a translation unit can only be:
    // Functions, and declarations such as variables, structs, enums, etc.
    // showTree(root, 2);
    foreach (child; root.childs) {
        // writeln("Processing: ", child.name);

        switch (child.name) {
        case "SimpleDeclaration1":
            Declaration decl = new Declaration();
            convertSimpleDeclaration1(child, decl);
            m.declarations ~= decl;
            m.tokens ~= decl.tokens;
            // TODO: fill tokens from m.declaration
            break;
        case "FunctionDefinitionGlobal":
            Declaration decl_d = new Declaration();
            convertFunctionDefinitionGlobal(child, decl_d);
            m.declarations ~= decl_d;
            m.tokens ~= decl_d.tokens;
            // TODO: fill tokens from m.declaration
            break;
        case "Directive":
            Declaration decl = new Declaration();
            convertDirective(child, decl);
            m.declarations ~= decl;
            m.tokens ~= decl.tokens;
            break;
        case "LineComment":
            // append it to the last declaration
            if (m.declarations.length == 0) {
                // TODO: find the last declaration and append it there
                // writeln("No declaration to attach comment to");
                break;
            }
            if (m.declarations[$ - 1].variableDeclaration !is null) {
                // writeln("Setting comment for variable declaration");
                (cast(VariableDeclaration) m.declarations[$ - 1].variableDeclaration).comment ~= "\n" ~ child
                    .childs[0].content;
            }
            else if (m.declarations[$ - 1].functionDeclaration !is null) {
                // writeln("Setting comment for function declaration");
                (cast(FunctionDeclaration) m.declarations[$ - 1].functionDeclaration).comment ~= "\n" ~ child
                    .childs[0].content;
            }
            else {
                writeln("Unknown declaration type for comment: ", m.declarations[$ - 1].toString());
            }
            break;
        default:
            stderr.writeln("Encountered an unknown node in TranslationUnit: ", child.nodeType, ":", child.name, "\"", child
                    .toString(), "\"");
        }
    }

    return m;

}

void convertDirective(Tree root, Declaration decl_d) {

    if (root.nodeType != NodeType.nonterminal
        || root.name != "Directive")
        throw new Exception("Expected Directive");

    auto child = root.childs[0];
    switch (child.name) {
    case "Include":
        // showTree(child);
        ImportDeclaration importDecl = new ImportDeclaration();
        importDecl.singleImports ~= new SingleImport();
        importDecl.singleImports[0].identifierChain = new IdentifierChain();
        importDecl.singleImports[0].identifierChain.identifiers ~= createIdentifier(
            child.childs[2].childs[0].content);
        decl_d.importDeclaration = importDecl;
        break;
    case "Define":
        if (child.childs[3].name == "DefineValue") {
            // simple variable define
            auto varDecl = new VariableDeclaration();
            varDecl.storageClasses ~= new StorageClass();
            varDecl.storageClasses[0].token = Token(tok!"enum", "enum", 0, 0, 0);
            varDecl.declarators ~= new Declarator();
            // showTree(child, 3);
            varDecl.declarators[0].name = createIdentifier(child.childs[2].content);
            varDecl.declarators[0].initializer = new Initializer();
            varDecl.declarators[0].initializer.nonVoidInitializer = new NonVoidInitializer();
            auto assignExpr = new AssignExpression();
            assignExpr.operator = tok!"=";
            auto unaryExpr = new UnaryExpression();
            unaryExpr.primaryExpression = new PrimaryExpression();
            // TODO: check what it is by parsing the token value.
            unaryExpr.primaryExpression.primary = Token(tok!"int", child.childs[3].childs[0].content, 0, 0, 0);
            assignExpr.expression = unaryExpr;
            varDecl.declarators[0].initializer.nonVoidInitializer.assignExpression = assignExpr;
            decl_d.variableDeclaration = varDecl;
        }
        else {
            // showTree(child, 3);
            writeln("Unknown define type: ", child.childs[3].name);
        }
        break;
    default:
        throw new Exception("Unknown directive: ", child.name);
    }

}

void convertType(Tree root, Type type_d) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "DeclSpecifierSeq") {
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);
    }

    // get the type
    // types are either TypeKeyword(native c type) or NameIdentifier(custom type)
    auto typeDecl_c = root.childs[0].childs[0]; // two levels deep because there is an array in between

    // it doesn't really matter if it's native or custom,
    // we just need the name which is the first child
    string name = typeDecl_c.childs[0].content;
    auto type2_d = new Type2();
    if (name in typeTokenMap) {
        type2_d.builtinType = typeTokenMap[name];
        type2_d.tokens ~= Token(typeTokenMap[name], name, 0, 0, 0);
    }
    else {
        // writeln("Unknown type: ", name, " at: ", typeDecl_c.start());
        type2_d.typeIdentifierPart = new TypeIdentifierPart();
        type2_d.typeIdentifierPart.identifierOrTemplateInstance = new IdentifierOrTemplateInstance();
        type2_d.typeIdentifierPart.identifierOrTemplateInstance.identifier = Token(
            tok!"identifier", name, 0, 0, 0);
    }
    type_d.type2 = type2_d;

}

void convertNoptrDeclarator(Tree root, Declarator declarator_d) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "NoptrDeclarator")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    if (root.childs[0].childs.length == 0) {
        // no declarator
        return;
    }
    string declName_c = root.childs[0].childs[1].childs[0].content;
    auto declToken = Token(tok!"identifier", declName_c, 0, 0, 0);
    declarator_d.name = declToken;
    declarator_d.tokens ~= declToken;
}

ExpressionNode convertTernaryExpression(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "ConditionalExpression")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    // showTree(root, 5);

    TernaryExpression ternaryExpr_d = new TernaryExpression();

    ternaryExpr_d.orOrExpression = convertExpression(root.childs[0]);
    ternaryExpr_d.expression = convertExpression(root.childs[2]);
    ternaryExpr_d.ternaryExpression = convertExpression(root.childs[4]);

    return ternaryExpr_d;

}

ExpressionNode convertExpression(Tree root) {
    if (root.nodeType != NodeType.nonterminal)
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    ExpressionNode result;

    if (root.name == "PostfixExpression") {
        // check for the following is a token (operator)
        if (root.childs[1].nodeType == NodeType.token) {
            string operator = root.childs[1].content;
            if (operator == "(") {
                // function call
                FunctionCallExpression funcCall_d = new FunctionCallExpression();

                funcCall_d.unaryExpression = cast(UnaryExpression) convertExpression(root.childs[0]);
                result = funcCall_d;
            }
            else if (operator == "->") {
                // member access
                showTree(root, 3);
                // TODO: use IdentifierOrTemplateChain instead?
                UnaryExpression unaryExpr_d = cast(UnaryExpression)convertExpression(root.childs[3]);
                unaryExpr_d.unaryExpression = cast(UnaryExpression)convertExpression(root.childs[0]);
                result = unaryExpr_d;
            }
        }
    }
    else if (root.name == "Literal") {
        PrimaryExpression primaryExpr_d = new PrimaryExpression();
        primaryExpr_d.primary = Token(tok!"intLiteral", root.childs[0].content, 0, 0, 0);
        result = primaryExpr_d;
    }
    else if (root.name == "NameIdentifier") {
        string name = root.childs[0].content;
        UnaryExpression unaryExpr_d = new UnaryExpression();
        unaryExpr_d.identifierOrTemplateInstance = new IdentifierOrTemplateInstance();
        unaryExpr_d.identifierOrTemplateInstance.identifier = Token(tok!"identifier", name, 0, 0, 0);
        result = unaryExpr_d;
    }
    else if (root.name == "InitializerClause") {
        result = convertExpression(root.childs[0]);
    }
    else if (root.name == "ConditionalExpression") {
        result = convertTernaryExpression(root);
    }
    else {
        writeln("Unknown expression type: ", root.name);
        // showTree(root, 3);

    }

    return result;
}

void convertInitializer(Tree root, Initializer init_d) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "BraceOrEqualInitializer")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    NonVoidInitializer nonVoidInit_d = new NonVoidInitializer();
    if (root.childs[0].content == "=") {
        auto expr_c = root.childs[1].childs[0];
        nonVoidInit_d.assignExpression = convertExpression(expr_c);
        init_d.nonVoidInitializer = nonVoidInit_d;
    }
}

void convertDeclarator(Tree root, Declarator declarator_d) {

    if (root.name == "NoptrDeclarator") {
        convertNoptrDeclarator(root, declarator_d);
    }
    else if (root.name == "PtrDeclarator") {
        TypeSuffix ts = new TypeSuffix();
        ts.star = Token(tok!"*", "*", 0, 0, 0);
        declarator_d.cstyle ~= ts;
        convertDeclarator(root.childs[1], declarator_d);
    }
    else if (root.name == "InitDeclarator") {
        foreach (initDeclItem_c; root.childs) {
            convertDeclarator(initDeclItem_c, declarator_d);
        }
    }
    else if (root.name == "BraceOrEqualInitializer") {
        Initializer init_d = new Initializer();
        convertInitializer(root, init_d);
        declarator_d.initializer = init_d;
    }
    else {
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.name);
    }

}

void convertSimpleDeclaration1(Tree root, Declaration decl_d) {

    if (root.nodeType != NodeType.nonterminal
        || root.name != "SimpleDeclaration1")
        throw new Exception("Expected SimpleDeclaration1");

    if (!root.hasChildWithName("declSeq")) {
        writeln("first child: ", root.childName(0));
        throw new Exception("Expected DeclSpecifierSeq in SimpleDeclaration1");
    }

    auto declspec_c = root.childs[0];

    // get the type
    auto varDecl_d = new VariableDeclaration();
    Type type_d = new Type();
    convertType(declspec_c, type_d);
    varDecl_d.type = type_d;

    // in C the pointer is attached to the variable name
    // in D it's attached to the type
    // now we check all the declarators
    // if any have pointers we need to emit two lines with the same base type
    // one with the pointer and one without
    // e.g. int* a, b, *c; -> int* a, c; int b;

    // walk through all the declarators
    foreach (declItem_c; root.childs[1].childs) {
        Declarator declarator_d = new Declarator();

        convertDeclarator(declItem_c, declarator_d);

        varDecl_d.declarators ~= declarator_d;
        varDecl_d.tokens ~= declarator_d.tokens;
    }
    decl_d.variableDeclaration = varDecl_d;

}

void convertFunctionDefinitionGlobal(Tree root, Declaration decl_d) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "FunctionDefinitionGlobal")
        throw new Exception("Expected FunctionDefinitionGlobal");

    auto funcdecl_d = new FunctionDeclaration();

    auto funcdefhead_c = root.childs[0];
    auto funcbody_c = root.childs[1];

    // If the type == null it must be a constructor
    if (auto declSpecSeq = funcdefhead_c.childs[0]) {
        Type type_d = new Type();
        convertType(declSpecSeq, type_d);
        funcdecl_d.returnType = type_d;
    }
    if (funcdecl_d.returnType is null) {
        // constructor
        funcdecl_d.name = Token(tok!"", "this", 0, 0, 0);
        funcdecl_d.tokens ~= Token(tok!"identifier", "this", 0, 0, 0);
    }
    else {
        // normal function
        auto funcdecltor_c = funcdefhead_c.childs[1];
        string funcname = funcdecltor_c.childs[0].childs[0].childs[1].childs[0].content;
        funcdecl_d.name = Token(tok!"", funcname, 0, 0, 0);
        funcdecl_d.tokens ~= Token(tok!"identifier", funcname, 0, 0, 0);
    }

    funcdecl_d.functionBody = new FunctionBody();
    funcdecl_d.functionBody.specifiedFunctionBody = new SpecifiedFunctionBody();

    BlockStatement blockStmt_d = new BlockStatement();
    DeclarationsAndStatements declStmts_d = new DeclarationsAndStatements();
    convertCompoundStatement(funcbody_c.childs[1], declStmts_d);
    blockStmt_d.declarationsAndStatements = declStmts_d;
    funcdecl_d.functionBody.specifiedFunctionBody.blockStatement = blockStmt_d;

    decl_d.functionDeclaration = funcdecl_d;
    decl_d.tokens ~= funcdecl_d.tokens;
}

void convertAssignmentExpression(Tree root, AssignExpression assignExpr_d) {
    if (root.nodeType == NodeType.token
        || root.name != "AssignmentExpression")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.name);

    assignExpr_d.operator = tok!"=";

    // showTree(root, 5);

    Expression expr_d = new Expression();
    if (auto left = convertExpression(root.childs[0])) {
        // left side of the assignment
        expr_d.items ~= left;
    }
    if (auto right = convertExpression(root.childs[2])) {
        // right side of the assignment
        expr_d.items ~= right;
    }

    assignExpr_d.expression = expr_d;

}

void convertExpressionStatement(Tree root, ExpressionStatement exprStmt_d) {

    if (root.nodeType == NodeType.token
        || root.name != "ExpressionStatement")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.name);

    foreach (child; root.childs) {
        if (child.nodeType == NodeType.nonterminal && child.name == "AssignmentExpression") {
            // TODO: move this to expression handler
            AssignExpression assignExpr_d = new AssignExpression();
            convertAssignmentExpression(child, assignExpr_d);
            Expression expr_d = new Expression();
            expr_d.items ~= assignExpr_d;
            exprStmt_d.expression = expr_d;
        }
    }
}

void convertStatement(Tree root, DeclarationsAndStatements declStmts_d) {
    if (root.nodeType == NodeType.token
        || root.name != "Statement")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.name);

    // go through the children

    foreach (child; root.childs) {
        if (child.name == "SimpleDeclaration1") {
            auto declorstmt = new DeclarationOrStatement();
            Declaration l_decl_d = new Declaration();
            convertSimpleDeclaration1(child, l_decl_d);
            declorstmt.declaration = l_decl_d;
            declStmts_d.declarationsAndStatements ~= declorstmt;
        }
        else if (child.name == "Statement") {
            // substatement such as expressionstatement
            convertStatement(child, declStmts_d);
        }
        else if (child.name == "CompoundStatement") {
            // substatement such as expressionstatement
            convertCompoundStatement(child, declStmts_d);
        }
        else if (child.name == "ExpressionStatement") {
            ExpressionStatement exprStmt_d = new ExpressionStatement();
            convertExpressionStatement(child, exprStmt_d);
            StatementNoCaseNoDefault stmtNoCaseNoDefault_d = new StatementNoCaseNoDefault();
            stmtNoCaseNoDefault_d.expressionStatement = exprStmt_d;
            Statement stmt_d = new Statement();
            stmt_d.statementNoCaseNoDefault = stmtNoCaseNoDefault_d;
            DeclarationOrStatement declorstmt = new DeclarationOrStatement();
            declorstmt.statement = stmt_d;
            declStmts_d.declarationsAndStatements ~= declorstmt;
        }
        else {
            // writeln("Unknown statement type: ", child.name);
        }
    }
}

void convertCompoundStatement(Tree root, DeclarationsAndStatements declStmts_d) {

    if (root.nodeType == NodeType.token)
        throw new Exception("Unexpected non-terminal: " ~ root.asText);

    foreach (stmt_c; root.childs) {
        if (stmt_c.nodeType == NodeType.array) {
            convertCompoundStatement(stmt_c, declStmts_d);
            continue;
        }
        if (stmt_c.nodeType == NodeType.token) // Skip tokens such as '{' and '}'
            continue;
        if (stmt_c.name == "SimpleDeclaration1") {
            auto declorstmt = new DeclarationOrStatement();
            Declaration l_decl_d = new Declaration();
            convertSimpleDeclaration1(stmt_c, l_decl_d);
            declorstmt.declaration = l_decl_d;
            declStmts_d.declarationsAndStatements ~= declorstmt;
        }
        else if (stmt_c.name == "Statement") { // merged
            convertStatement(stmt_c, declStmts_d);
        }
        else {
            writeln("Unknown statement type: ", stmt_c.name);
        }
    }

}
/+

// DeclarationOrStatement -> Statement -> StatementNoCaseNoDefault

StatementNoCaseNoDefault simpleStmt_d = new StatementNoCaseNoDefault();

auto jumpStmt_c = root.childs[1];
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
    ident_d.identifier = Token(tok!"identifier", expr_c, 0, 0, 0);
    returnStmt_d.expression = expr_d;
    simpleStmt_d.returnStatement = returnStmt_d;
}
else {
    writeln("Unknown statement type: ", jumpStmt_c.name);

}

Statement stmt_d = new Statement();
stmt_d.statementNoCaseNoDefault = simpleStmt_d;

declOrStmt_d.statement = stmt_d;
}
+/
