module translate;

import std.algorithm;
import std.array;
import std.stdio;
import std.range : repeat;
import std.conv;
import std.typecons;

import dparsergen.core.dynamictree;
import dparsergen.core.nodetype;

import dparse.ast;
import dparse.lexer;

// for import type Tree
// defined there as:
//  alias Tree = DynamicParseTree!(Location, LocationRangeStartLength);
import parser;

// For deconstructing a DeclSpecifierSeq
// TODO: consider using a struct instead of a tuple
alias DeclSpecifierSeq = Tuple!(string, "typeName", string[], "qualifiers");

IdType[string] typeConversionMap = [
    "int": tok!"int",
    "void": tok!"void",
    "float": tok!"float",
    "double": tok!"double",
    "short": tok!"short",
    "long": tok!"long",
    "bool": tok!"bool",
    "char": tok!"char",
    "unsigned": tok!"uint",
    "unsigned int": tok!"uint",
    "unsigned long": tok!"ulong",
    "unsigned short": tok!"ushort",
    "unsigned char": tok!"ubyte",
    "signed char": tok!"byte",

];

//********************************
// Tree printing functions
//********************************

void showTree(Tree root, int depth = 15, string prefix = "",) {

    showTreeRec(root, 0, depth, prefix);

}

void showTreeRec(Tree root, int index, int depth = 1000, string prefix = "", bool isLastChild = true) {
    if (depth == 0) {
        writeln("\x1b[7;31m... (depth limit reached)\x1b[0m");
        return;
    }

    write(prefix ~ (isLastChild ? " └─" : " ├─"), "[", index.to!int, "] ");
    prefix ~= (isLastChild ? "   " : " │ ");
    if (root is null) {
        writeln("\x1b[1;31m«null»\x1b[0m");
        return;
    }
    string text = root.asText;
    if (root.nodeType == NodeType.token)
        text = "\x1b[1;34m" ~ text ~ "\x1b[0m";
    else if (root.nodeType == NodeType.merged)
        text = "\x1b[1;35m" ~ text ~ "\x1b[0m";
    // else if (root.nodeType == NodeType.array) 
    //     text = "\x1b[1;33m" ~ text ~ "\x1b[0m";
    else if (root.nodeType == NodeType.nonterminal)
        text = "\x1b[0;32m" ~ text ~ "\x1b[0m";

    writeln(text, " → ", root.nodeType);

    index = 0;
    foreach (i, child; root.childs) {
        bool isLast = i == root.childs.length - 1;

        showTreeRec(child, index++, depth - 1, prefix, isLast);
    }
}

//********************************
// Helper functions
//********************************

string asText(Tree node) {
    return node.nodeType == NodeType.token ? node.content : node.name;
}

Type2 toType2(string identifier) {
    Type2 type2_d = new Type2();
    type2_d.typeIdentifierPart = new TypeIdentifierPart();
    type2_d.typeIdentifierPart.identifierOrTemplateInstance = new IdentifierOrTemplateInstance();
    type2_d.typeIdentifierPart.identifierOrTemplateInstance.identifier = Token(
        tok!"identifier", identifier, 0, 0, 0);
    return type2_d;
}

Token toIdentifierToken(string identifier) {
    return Token(tok!"identifier", identifier, 0, 0, 0);
}

IdentifierOrTemplateInstance toIdentifierOrTemplateInstance(string identifier) {
    IdentifierOrTemplateInstance id = new IdentifierOrTemplateInstance();
    id.identifier = identifier.toIdentifierToken();
    return id;
}

Type getType(DeclSpecifierSeq decl) {

    Type2 type2_d = new Type2();
    // Check if the type needs to be converted
    if (auto newType = decl.typeName in typeConversionMap) {
        // It is also a native type
        type2_d.builtinType = *newType;
    }
    else {
        type2_d.typeIdentifierPart = new TypeIdentifierPart();
        type2_d.typeIdentifierPart.identifierOrTemplateInstance =
            decl.typeName.toIdentifierOrTemplateInstance();
    }
    Type type_d = new Type();
    type_d.type2 = type2_d;
    return type_d;
}

Attribute[] getAttributes(DeclSpecifierSeq decl) {
    Attribute[] attributes;
    foreach (qualifier; decl.qualifiers) {
        if (qualifier == "const") {
            Attribute attribute = new Attribute();
            attribute.attribute = Token(tok!"const", "const", 0, 0, 0);
            attributes ~= attribute;
        }
    }
    return attributes;
}

ParameterAttribute[] getParamAttributes(DeclSpecifierSeq decl) {
    ParameterAttribute[] attributes;
    foreach (qualifier; decl.qualifiers) {
        if (qualifier == "const") {
            ParameterAttribute attribute = new ParameterAttribute();
            attribute.idType = tok!"const";
            attributes ~= attribute;
        }
    }
    return attributes;
}

StorageClass[] getStorageClasses(DeclSpecifierSeq decl) {
    StorageClass[] storageClasses;
    foreach (qualifier; decl.qualifiers) {
        if (qualifier == "static") {
            StorageClass storageClass = new StorageClass();
            storageClass.token = Token(tok!"static", "static", 0, 0, 0);
            storageClasses ~= storageClass;
        }
        else if (qualifier == "extern") {
            StorageClass storageClass = new StorageClass();
            storageClass.token = Token(tok!"extern", "extern", 0, 0, 0);
            storageClasses ~= storageClass;
        }
    }
    return storageClasses;
}

//**************************
// Begin main transpiler functions
//**************************

Module transpileFile(Tree root) {

    writeln(root.start());
    showTree(root, 50);

    return convertTranslationUnit(root);

}

Module convertTranslationUnit(Tree tree) {

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
            // declarators + initializers
            m.declarations ~= convertSimpleDeclaration1(child);
            break;
        case "SimpleDeclaration3":
            // only declarators
            m.declarations ~= convertSimpleDeclaration3(child);
            break;
        case "FunctionDefinitionGlobal":
            m.declarations ~= convertFunctionDefinitionGlobal(child);
            // TODO: fill tokens from m.declaration
            break;
        case "PP_Directive":
            m.declarations ~= convertDirective(child);
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
            //            stderr.writeln("Encountered an unknown node in TranslationUnit: ", child.nodeType, ":", child.name, "\"", child.toString(), "\"");
            stderr.writeln("Encountered an unknown node in TranslationUnit");
            showTree(child);
            break;
        }
    }

    return m;

}

Declaration convertDirective(Tree root) {

    if (root.nodeType != NodeType.nonterminal
        || root.name != "PP_Directive")
        throw new Exception("Expected Directive");

    auto child = root.childs[0];
    switch (child.name) {
    case "PP_Include":
        // showTree(child);
        ImportDeclaration importDecl = new ImportDeclaration();
        importDecl.singleImports ~= new SingleImport();
        importDecl.singleImports[0].identifierChain = new IdentifierChain();
        string filename = child.childs[2].childs[0].content;
        filename = filename.replace("<", "").replace(">", "").replace("/", ".")
            .replace("\\", ".").replace("\"", "").replace(".H", "");
        importDecl.singleImports[0].identifierChain.identifiers ~= filename.toIdentifierToken();
        Declaration decl = new Declaration();
        decl.importDeclaration = importDecl;
        return decl;
        break;
    case "PP_Define":
        if (child.childs.length > 3 && child.childs[3]!is null && child.childs[3].name == "PP_DefineValue") {
            // simple variable define

            // The initializer
            PrimaryExpression primaryExpression;

            auto node = child.childs[3].childs[0];
            if (node.name == "PrimaryExpression") {
                UnaryExpression expr = cast(UnaryExpression) convertPrimaryExpression(node);
                // take the primary expression out of the unary expression
                primaryExpression = expr.primaryExpression;
            }
            else {
                // assume its literal definition
                // The storage class enum
                primaryExpression = new PrimaryExpression();
                // If it's a literal
                primaryExpression.primary = Token(tok!"int", child.childs[3].childs[0].childs[0].content, 0, 0, 0);

            }
            UnaryExpression unaryExpr = new UnaryExpression();
            unaryExpr.primaryExpression = primaryExpression;
            NonVoidInitializer nonVoidInit = new NonVoidInitializer();
            nonVoidInit.assignExpression = unaryExpr;

            Initializer init = new Initializer();
            init.nonVoidInitializer = nonVoidInit;
            AutoDeclarationPart part = new AutoDeclarationPart();
            part.initializer = init;
            part.identifier = child.childs[2].content.toIdentifierToken();

            StorageClass storageClass = new StorageClass();
            storageClass.token = Token(tok!"enum", "enum", 0, 0, 0);

            AutoDeclaration autoDecl = new AutoDeclaration();
            autoDecl.storageClasses ~= storageClass;
            autoDecl.parts ~= part;

            VariableDeclaration varDecl = new VariableDeclaration();
            varDecl.autoDeclaration = autoDecl;
            Declaration decl = new Declaration();
            decl.variableDeclaration = varDecl;
            return decl;
        }
        else {
            showTree(child, 3);
            writeln("Unknown define type: ", child.childs[2].asText);
        }
        break;
    case "PP_IfNotDef":
        // showTree(child, 3);
        // TODO: apply heuristics.
        // 1. if the ifdef is at the beginning of the file,
        //    and the file is a header file, then it is a header guard.
        writeln("Not implemented PP_IfNotDef: ");
        break;
    default:
        writeln("Unknown directive: ", child.name);
    }

    return new Declaration();

}

//******************************
// Types and identifiers
//******************************

Type convertTypeIdAndNewTypeId(Tree root) {
    if (root.nodeType != NodeType.nonterminal ||
        (root.name != "TypeId" && root.name != "NewTypeId"))
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    Type type_d = new Type();

    if (root.childs[0].nodeType == NodeType.array &&
        root.childs[0].childs[0].name == "NameIdentifier") {
        type_d.type2 = convertIdentifier(root.childs[0].childs[0]).toType2();
    }
    if (root.childs.length == 2 && root.childs[1]!is null) {
        if (root.childs[1].name == "PtrAbstractDeclarator") {
            // todo: this may be recursive
            TypeSuffix ts = new TypeSuffix();
            ts.star = Token(tok!"*", "", 0, 0, 0);
            type_d.typeSuffixes ~= ts;
        }
    }
    return type_d;

}

DeclSpecifierSeq convertDeclSpecifierSequence(Tree root) {
    if (root.nodeType != NodeType.nonterminal ||
        root.name != "DeclSpecifierSeq")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    DeclSpecifierSeq decl;

    string[] typeName;
    foreach (child; root.childs[0].childs) {
        if (child.name == "TypeKeyword" ||
            child.name == "NameIdentifier") {
            typeName ~= child.childs[0].content;
        }
        else if (child.name == "CvQualifier" ||
            child.name == "StorageClassSpecifier") {
            // these things are specific to D only
            decl.qualifiers ~= child.childs[0].content;
        }
        else if (child.name == "FunctionSpecifier") {
            decl.qualifiers ~= child.childs[0].content;
        }
        else if (child.name == "DeclSpecifierTypedef") {
            decl.qualifiers ~= child.childs[0].content;
        }
        else {
            writeln("Unknown decl specifier: ", child.name);
        }
    }
    // If there were multiple types, then we need to join them.
    // E.g. "unsigned int" or "unsigned long long"
    decl.typeName = typeName.join(' ');

    return decl;
}

Type convertTypeKeyword(Tree root) {
    if (root.nodeType != NodeType.nonterminal ||
        root.name != "TypeKeyword")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    Type type_d = new Type();

    // Get the C typename
    string typename = root.childs[0].content;
    type_d.type2 = new Type2();
    if (typename in typeConversionMap) {
        type_d.type2.builtinType = typeConversionMap[typename];
    }
    else {
        writeln("Conversion of ", typename, " not implemented");
    }
    return type_d;

}

Type convertType(Tree root) {
    if (root.nodeType == NodeType.array)
        return convertType(root.childs[0]);

    // Type can either be a TypeKeyword or a NameIdentifier or a SimpleTypeSpecifierNoKeyword
    if (root.nodeType != NodeType.nonterminal ||
        (root.name != "TypeKeyword" &&
            root.name != "NameIdentifier" &&
            root.name != "SimpleTypeSpecifierNoKeyword"))
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    Type type_d;

    if (root.name == "TypeKeyword") {
        type_d = convertTypeKeyword(root);
    }
    else if (root.name == "NameIdentifier") {
        type_d = new Type();
        type_d.type2 = convertIdentifier(root).toType2();
    }
    else if (root.name == "SimpleTypeSpecifierNoKeyword") {
        auto left = convertIdentifier(root.childs[0]);
        auto right = convertIdentifier(root.childs[1]);
        Type2 type2_d = new Type2();
        type2_d.typeIdentifierPart = new TypeIdentifierPart();
        type2_d.typeIdentifierPart.identifierOrTemplateInstance =
            (left ~ right)
            .toIdentifierOrTemplateInstance();
        type_d = new Type();
        type_d.type2 = type2_d;
    }
    return type_d;
}

// TODO: should this be converted to a identifierortemplatechain?
UnaryExpression convertQualifiedId(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "QualifiedId")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    UnaryExpression unaryExpr_d = cast(UnaryExpression) convertExpression(root.childs[2]);
    // TODO: check this, with root.childs[0].childs[0] we skip NestedNameSpecifier
    unaryExpr_d.unaryExpression = cast(UnaryExpression) convertExpression(root.childs[0].childs[0]);
    return unaryExpr_d;
}

//******************************
// Declarators and Initializers
//******************************

string convertIdentifier(Tree root) {
    if (root.nodeType != NodeType.nonterminal || (
            root.name != "DeclaratorId" &&
            root.name != "QualifiedId" &&
            root.name != "NameIdentifier" &&
            root.name != "NestedNameSpecifier"))
        throw new Exception("Non-terminal: " ~ root.asText);

    string result;

    foreach (child; root.childs) {
        if (child.nodeType == NodeType.token) {
            if (child.content == "::")
                result ~= ".";
            else
                result ~= child.content;
        }
        else if (child.name == "NestedNameSpecifier") {
            result ~= convertIdentifier(child);
        }
        else if (child.name == "NameIdentifier") {
            result ~= child.childs[0].content;
        }
    }
    return result;
}

Declarator convertNoptrDeclarator(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "NoptrDeclarator")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    Declarator declarator_d = new Declarator();

    if (root.childs[0].nodeType == NodeType.token &&
        root.childs[0].content == "(") {
        // it it a function pointer?
        if (root.childs[2].name == "NoptrDeclarator") {
            // this is a function pointer
            declarator_d = convertDeclarator(root.childs[2]);
        }
        else {
            // this is declarator with immediate construction.
            // e.g. Object a(12,13); 
            // the a is the declarator but looks like a function.
            writeln("Declarator with immediate construction not implemented");
        }
    }
    else {
        // normal DeclaratorId
        declarator_d.name = convertIdentifier(root.childs[0]).toIdentifierToken();
    }
    return declarator_d;
}

Declarator convertPtrDeclarator(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "PtrDeclarator")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    Declarator declarator_d = new Declarator();
    if (root.childs[0].childs[0].content == "*") {
        TypeSuffix ts = new TypeSuffix();
        ts.star = Token(tok!"*", "", 0, 0, 0);
        declarator_d.cstyle ~= ts;
    }
    else if (root.childs[0].childs[0].content == "&") {
        // TODO: this is not a pointer, but a reference
        // we need to convert it to a ref
        TypeSuffix ts = new TypeSuffix();
        ts.star = Token(tok!"ref", "", 0, 0, 0);
        declarator_d.cstyle ~= ts;
    }
    Declarator decltor_d = convertDeclarator(root.childs[1]);
    foreach (d; decltor_d.cstyle) {
        declarator_d.cstyle ~= d;
    }
    // TODO: deal with const inside the declarator because 
    // in D they are part of the type, not the variable.

    declarator_d.name = decltor_d.name;
    return declarator_d;
}

Initializer convertInitializer(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "Initializer")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    Initializer init_d = new Initializer();
    NonVoidInitializer nonVoidInit_d = new NonVoidInitializer();
    if (root.childs[0].content == "=") {
        auto expr_c = root.childs[1].childs[0];
        nonVoidInit_d.assignExpression = convertExpression(expr_c);
        init_d.nonVoidInitializer = nonVoidInit_d;
    }
    return init_d;
}

Initializer convertBraceInitializer(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "BraceOrEqualInitializer")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    Initializer init_d = new Initializer();
    NonVoidInitializer nonVoidInit_d = new NonVoidInitializer();
    if (root.childs[0].content == "=") {
        auto expr_c = root.childs[1].childs[0];
        nonVoidInit_d.assignExpression = convertExpression(expr_c);
        init_d.nonVoidInitializer = nonVoidInit_d;
    }
    return init_d;
}

Declarator convertInitDeclarator(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "InitDeclarator")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    Declarator declarator_d = convertDeclarator(root.childs[0]);

    auto init_c = root.childs[1];
    if (init_c.name == "BraceOrEqualInitializer") {
        declarator_d.initializer = convertBraceInitializer(init_c);
    }
    else if (init_c.name == "Initializer") {
        declarator_d.initializer = convertInitializer(init_c);
    }
    else {
        writeln("Unknown initializer type: ", init_c.name);
    }

    return declarator_d;
}

Declarator convertDeclarator(Tree root) {

    if (root.nodeType != NodeType.nonterminal) {
        writeln(root.start());

        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);
    }

    Declarator declarator_d;

    if (root.name == "NoptrDeclarator") {
        declarator_d = convertNoptrDeclarator(root);
    }
    else if (root.name == "PtrDeclarator") {
        declarator_d = convertPtrDeclarator(root);
    }
    else if (root.name == "InitDeclarator") {
        declarator_d = convertInitDeclarator(root);
    }
    else if (root.name == "PtrAbstractDeclarator") {
        // TODO: multiple pointers not implemented
        declarator_d = new Declarator();
        declarator_d.cstyle ~= new TypeSuffix();
        declarator_d.cstyle[0].star = Token(tok!"*", "", 0, 0, 0);
    }
    else if (root.name == "ArrayDeclarator") {
        declarator_d = convertDeclarator(root.childs[0]);
        TypeSuffix sfx = new TypeSuffix();
        sfx.array = true;
        sfx.low = convertExpression(root.childs[2]);
        declarator_d.cstyle ~= sfx;
    }
    else {
        writeln(": Non-terminal or unexpected terminal: " ~ root.name);
        // writeln("HERE1:");
        // showTree(root);
        // writeln(root.start());
    }

    return declarator_d;

}

/* convertSimpleDeclaration1
 * 
 * Converts a SimpleDeclaration1 node to one or more Declaration nodes.
 * TODO: In C, pointers/arrays attach to variable names; in D, they attach to the type.
 * So we check each declarator, and if some use pointers/arrays, we split them.
 *
 * Example: int* a, b, *c, d[10]; → int* a, c; int b; int[10] d;
 *
 * Returns a list of Declaration nodes.
 */

Declaration[] convertSimpleDeclaration1(Tree root) {

    if (root.nodeType != NodeType.nonterminal
        || root.name != "SimpleDeclaration1")
        throw new Exception("Expected SimpleDeclaration1");

    Declaration[] declarations_d;

    // Get the declspecifierseq
    DeclSpecifierSeq declSpecSeq = convertDeclSpecifierSequence(root.childs[0]);

    bool isTypedef = declSpecSeq.qualifiers.canFind!(e => e == "typedef");

    // walk through all the declarators
    foreach (child; root.childs[1].childs) {
        if (child.nodeType == NodeType.token) {
            // skip the comma
            continue;
        }
        if (child.name == "FunctionDeclarator") {
            Declaration decl_d = new Declaration();
            decl_d.attributes ~= declSpecSeq.getAttributes();
            FunctionDeclaration funcDecl_d = convertFunctionDeclarator(child);
            funcDecl_d.returnType = declSpecSeq.getType();
            funcDecl_d.storageClasses ~= declSpecSeq.getStorageClasses();

            if (isTypedef) {
                // it's a function pointer and since it's a typedef, we need to
                // create an alias for it.
                AliasInitializer aliasInit = new AliasInitializer();

                aliasInit.name = funcDecl_d.name;

                FunctionLiteralExpression funcLitExpr = new FunctionLiteralExpression();
                funcLitExpr.functionOrDelegate = tok!"function";
                funcLitExpr.parameters = funcDecl_d.parameters;
                funcLitExpr.returnType = funcDecl_d.returnType;
                aliasInit.functionLiteralExpression = funcLitExpr;

                AliasDeclaration aliasDecl_d = new AliasDeclaration();
                aliasDecl_d.initializers ~= aliasInit;

                decl_d.aliasDeclaration = aliasDecl_d;
            }
            else {
                decl_d.functionDeclaration = funcDecl_d;
            }
            declarations_d ~= decl_d;
        }
        else {
            // assume it's a variable declaration
            Declaration decl_d = new Declaration();

            // first focus on the declspecifier
            Declarator decltor_d = convertDeclarator(child);

            if (isTypedef) {
                AliasInitializer aliasInit = new AliasInitializer();
                aliasInit.name = decltor_d.name;
                aliasInit.type = declSpecSeq.getType();
                aliasInit.type.typeSuffixes ~= decltor_d.cstyle;
                aliasInit.storageClasses ~= declSpecSeq.getStorageClasses();

                AliasDeclaration aliasDecl_d = new AliasDeclaration();
                aliasDecl_d.initializers ~= aliasInit;

                decl_d.aliasDeclaration = aliasDecl_d;
            }
            else {

                VariableDeclaration varDecl_d = new VariableDeclaration();
                varDecl_d.type = declSpecSeq.getType();
                varDecl_d.storageClasses ~= declSpecSeq.getStorageClasses();
                varDecl_d.declarators ~= decltor_d;

                decl_d = new Declaration();
                decl_d.attributes ~= declSpecSeq.getAttributes();
                decl_d.variableDeclaration = varDecl_d;
            }
            declarations_d ~= decl_d;

        }
    }

    return declarations_d;
}

Declaration convertSimpleDeclaration3(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "SimpleDeclaration3")
        throw new Exception("Expected SimpleDeclaration3");

    Declaration decl_d = new Declaration();

    // first focus on the class declarator
    auto declSpecSeq = root.childs[0].childs[0];
    int index = 0;
    ClassDeclaration classDecl_d;
    StructDeclaration structDecl_d;

    if (declSpecSeq.childs[0].name == "ClassSpecifier") {
        // this is class
        auto classHead_c = declSpecSeq.childs[0].childs[0];

        enum RecordType {
            Struct,
            Class
        }

        RecordType recordType;

        // process the class head
        Token recordName;
        foreach (child; classHead_c.childs) {
            if (child is null)
                continue;
            if (child.name == "ClassKey") {
                recordType = child.childs[0].content == "struct"
                    ? RecordType.Struct : RecordType.Class;
            }
            else if (child.name == "ClassHeadName") {
                recordName = convertIdentifier(child.childs[1]).toIdentifierToken();
            }
            else if (child.name == "BaseClause") {
                BaseClass baseClass_d = new BaseClass();
                baseClass_d.type2 = convertIdentifier(child.childs[1].childs[0].childs[3].childs[1])
                    .toType2();
                BaseClassList list_d = new BaseClassList();
                list_d.items ~= baseClass_d;
                classDecl_d.baseClassList = list_d;
            }
        }

        // process the class/struct body
        StructBody structBody_d = new StructBody();
        auto classBody_c = declSpecSeq.childs[0].childs[1];
        foreach (decl; classBody_c.childs[1].childs) {
            if (decl is null)
                continue;

            if (decl.name == "MemberDeclaration1") {
                structBody_d.declarations ~= convertMemberDeclaration1(decl);
            }
            else if (decl.name == "FunctionDefinitionMember") {
                // This is a complete member function definition
                // Function signature + body.
                structBody_d.declarations ~= convertFunctionDefinitionMember(decl);
            }
            else if (decl.name == "AccessSpecifierWithColon") {
                AttributeDeclaration accessDecl_d = new AttributeDeclaration();
                Attribute attribute = new Attribute();
                auto accessSpec = decl.childs[0].childs[0].content;
                if (accessSpec == "public") {
                    attribute.attribute = Token(tok!"public", "public", 0, 0, 0);
                }
                else if (accessSpec == "private") {
                    attribute.attribute = Token(tok!"private", "private", 0, 0, 0);
                }
                else if (accessSpec == "protected") {
                    attribute.attribute = Token(tok!"protected", "protected", 0, 0, 0);
                }
                else {
                    writeln("Unknown access specifier: ", accessSpec);
                }
                accessDecl_d.attribute = attribute;
                Declaration t = new Declaration();
                t.attributeDeclaration = accessDecl_d;
                structBody_d.declarations ~= t;
            }
            else {
                writeln("Unknown class body declaration: ", decl.name);
            }

        }

        // determine if this is a class or struct
        if (recordType == RecordType.Struct) {
            structDecl_d = new StructDeclaration();
            structDecl_d.name = recordName;
            structDecl_d.structBody = structBody_d;
            decl_d.structDeclaration = structDecl_d;
        }
        else if (recordType == RecordType.Class) {
            classDecl_d = new ClassDeclaration();
            classDecl_d.name = recordName;
            classDecl_d.structBody = structBody_d;
            decl_d.classDeclaration = classDecl_d;
        }
    }
    else {
        writeln("Unknown decl declspecifier: ", declSpecSeq.childs[0].name);
    }

    return decl_d;
}

// TODO: this could be an array too.
Declaration convertMemberDeclaration1(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "MemberDeclaration1")
        throw new Exception("Expected MemberDeclaration1");

    Declaration decl_d = new Declaration();

    // get the type for this declaration
    DeclSpecifierSeq declSpecSeq;
    bool isConstructor = false;
    if (root.childs[0] is null) {
        isConstructor = true;
    }
    else {
        declSpecSeq = convertDeclSpecifierSequence(root.childs[0]);
    }

    Type type_d = declSpecSeq.getType();
    auto declTor_c = root.childs[1].childs[0];

    decl_d.attributes ~= declSpecSeq.getAttributes();

    // in C the pointer/array qualifiers are part of the declarator 
    // eat them up to the first non-terminal  
    while (declTor_c.nodeType == NodeType.nonterminal &&
        declTor_c.name == "PtrDeclarator") {
        // TypeSuffix ts = new TypeSuffix();
        // ts.star = Token(tok!"*", "", 0, 0, 0);
        // type_d.typeSuffixes ~= ts;
        declTor_c = declTor_c.childs[1];
    }

    // TODO: should I call convertFunctionDeclarator instead?
    if (declTor_c.name == "FunctionDeclarator") {
        // This is a function signature only.
        FunctionDeclaration funcDecl_d = new FunctionDeclaration();
        if (isConstructor) {
            // constructor
            funcDecl_d.name = Token(tok!"this", "this", 0, 0, 0);
        }
        else {
            // normal function
            Declarator declTor_d = convertNoptrDeclarator(declTor_c.childs[0]);
            funcDecl_d.name = declTor_d.name;
            funcDecl_d.returnType = type_d;
        }
        funcDecl_d.storageClasses = declSpecSeq.getStorageClasses();

        // now add the parameters
        funcDecl_d.parameters = convertParametersAndQualifiers(declTor_c.childs[1]);

        // check for final const / override 
        if (declTor_c.childs[2].childs.length > 0) {
            if (declTor_c.childs[2].childs[0].name == "VirtSpecifier") {
                if (declTor_c.childs[2].childs[0].childs[0].content == "override") {
                    Attribute attribute = new Attribute();
                    attribute.attribute = Token(tok!"override", "override", 0, 0, 0);
                    funcDecl_d.attributes ~= attribute;
                }
            }
        }
        if (declTor_c.childs[1].childs[3].childs.length > 0) {
            if (declTor_c.childs[1].childs[3].childs[0].name == "CvQualifier") {
                MemberFunctionAttribute attr = new MemberFunctionAttribute();
                attr.tokenType = tok!"const";
                funcDecl_d.memberFunctionAttributes ~= attr;
            }
        }

        decl_d.functionDeclaration = funcDecl_d;
    }
    else {
        // If it's not a function, then it must be a variable declaration
        // variable type

        VariableDeclaration varDecl_d = new VariableDeclaration();
        // varDecl_d.declarators ~= decltor_d;
        varDecl_d.type = type_d;
        varDecl_d.storageClasses ~= declSpecSeq.getStorageClasses();

        // walk through all the declarators
        foreach (child; root.childs[1].childs) {
            if (child.nodeType == NodeType.token) {
                // skip the comma
                continue;
            }
            varDecl_d.declarators ~= convertDeclarator(child);
        }

        decl_d.variableDeclaration = varDecl_d;
    }

    return decl_d;
}

Parameter convertParameterDeclaration(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || (root.name != "ParameterDeclaration" &&
            root.name != "ParameterDeclarationAbstract"))
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    Parameter param_d = new Parameter();

    // deal with declspecifierseq first
    DeclSpecifierSeq declSpecSeq = convertDeclSpecifierSequence(root.childs[0]);
    param_d.type = declSpecSeq.getType();
    param_d.parameterAttributes = declSpecSeq.getParamAttributes();

    // now deal with the declarator
    // TODO: convert: const char* to string
    // TODO: doesn't abstract params (=params without a name).
    // It also ignores the pointer if any
    if (root.childs[1]) {
        Declarator decl_d = convertDeclarator(root.childs[1]);
        if (decl_d) {
            param_d.name = decl_d.name;
            if (decl_d.cstyle.canFind!(e => e.star == tok!"ref")) {
                decl_d.cstyle = decl_d.cstyle.remove!(e => e.star == tok!"ref");
                ParameterAttribute attribute = new ParameterAttribute();
                attribute.idType = tok!"ref";
                param_d.parameterAttributes ~= attribute;
            }
        }
        param_d.cstyle ~= decl_d.cstyle;
    }

    return param_d;

}

Parameters convertParametersAndQualifiers(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "ParametersAndQualifiers")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    auto params = root.childs[1];
    if (!params)
        return null;

    Parameters params_d = new Parameters();

    foreach (child; params.childs[0].childs) {
        if (child.nodeType == NodeType.token) {
            // skip the comma
            continue;
        }
        Parameter paramDecl_d = convertParameterDeclaration(child);
        params_d.parameters ~= paramDecl_d;
    }

    return params_d;

}

FunctionDeclaration convertFunctionDeclarator(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "FunctionDeclarator")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    FunctionDeclaration funcdecl_d = new FunctionDeclaration();

    // get the declarator (i.e. the function name)
    Declarator decltor_d = convertDeclarator(root.childs[0]);
    funcdecl_d.name = decltor_d.name;

    if (root.childs[1].childs[3].childs.length > 0) {
        // this function has attributes
        if (root.childs[1].childs[3].childs[0].name == "CvQualifier") {
            MemberFunctionAttribute attr = new MemberFunctionAttribute();
            attr.tokenType = tok!"const";
            funcdecl_d.memberFunctionAttributes ~= attr;
        }
    }

    // now add the parameters
    funcdecl_d.parameters = convertParametersAndQualifiers(root.childs[1]);

    return funcdecl_d;
}

FunctionDeclaration convertFunctionDefinitionHead(Tree root) {

    if (root.nodeType != NodeType.nonterminal
        || root.name != "FunctionDefinitionHead")
        throw new Exception("Expected FunctionDefinitionHead");

    DeclSpecifierSeq declSpecSeq;
    bool isConstructor = false;
    if (root.childs[0] is null) {
        isConstructor = true;
    }
    else {
        declSpecSeq = convertDeclSpecifierSequence(root.childs[0]);
    }

    Type type_d = declSpecSeq.getType();

    auto funcDeclOrPtr = root.childs[1];
    // check if the function has a pointer attached to the return type
    FunctionDeclaration funcdecl_d;
    if (funcDeclOrPtr.name == "FunctionDeclarator") {
        // get the declarator (i.e. the function name)
        funcdecl_d = convertFunctionDeclarator(funcDeclOrPtr);
    }
    else if (funcDeclOrPtr.name == "PtrDeclarator") {
        // For now assume only one level of indirection
        TypeSuffix ts = new TypeSuffix();
        ts.star = Token(tok!"*", "", 0, 0, 0);
        type_d.typeSuffixes ~= ts;
        funcdecl_d = convertFunctionDeclarator(funcDeclOrPtr.childs[1]);
    }
    else {
        writeln("Unknown function declarator: ", funcDeclOrPtr.name);
    }
    funcdecl_d.returnType = type_d;
    funcdecl_d.attributes ~= declSpecSeq.getAttributes();
    if (isConstructor) {
        // magic incantation to replace the last identifier with "this"
        // if it is a constructor then the final part of a qualified id must be "this"
        string name = (funcdecl_d.name.text.split('.')[0 .. $ - 1] ~ "this").join('.');
        funcdecl_d.name = Token(tok!"this", name, 0, 0, 0);
    }

    return funcdecl_d;
}

// TODO: consider mergin with convertFunctionDefinitionGlobal
Declaration convertFunctionDefinitionMember(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "FunctionDefinitionMember")
        throw new Exception("Expected FunctionDefinitionMember");

    FunctionDeclaration funcdecl_d = convertFunctionDefinitionHead(
        root.childs[0]);

    if (root.childs[1].nodeType == NodeType.token &&
        root.childs[1].content == "=" &&
        root.childs[2].content == "0") {
        // this is a pure virtual function → abstract in D
        Attribute attrib = new Attribute();
        attrib.attribute = Token(tok!"abstract", "abstract", 0, 0, 0);
        funcdecl_d.attributes ~= attrib;
    }
    else {

        auto funcbody_c = root.childs[1];
        funcdecl_d.functionBody = new FunctionBody();
        funcdecl_d.functionBody.specifiedFunctionBody = new SpecifiedFunctionBody();

        // writeln("HERE1:");
        // showTree(root);
        BlockStatement blockStmt_d = convertCompoundStatement(funcbody_c.childs[1]);

        funcdecl_d.functionBody.specifiedFunctionBody.blockStatement = blockStmt_d;
    }
    Declaration decl_d = new Declaration();
    decl_d.functionDeclaration = funcdecl_d;
    decl_d.tokens ~= funcdecl_d.tokens;
    return decl_d;
}

// TODO: consider merging with convertFunctionDefinitionMember
Declaration convertFunctionDefinitionGlobal(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "FunctionDefinitionGlobal")
        throw new Exception("Expected FunctionDefinitionGlobal");

    FunctionDeclaration funcdecl_d = convertFunctionDefinitionHead(
        root.childs[0]);

    auto funcbody_c = root.childs[1];

    funcdecl_d.functionBody = new FunctionBody();
    funcdecl_d.functionBody.specifiedFunctionBody = new SpecifiedFunctionBody();

    BlockStatement blockStmt_d = convertCompoundStatement(funcbody_c.childs[1]);

    funcdecl_d.functionBody.specifiedFunctionBody.blockStatement = blockStmt_d;

    Declaration decl_d = new Declaration();
    decl_d.functionDeclaration = funcdecl_d;
    decl_d.tokens ~= funcdecl_d.tokens;
    return decl_d;
}

//***********************************
// Expressions
//***********************************

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

ExpressionNode convertUnaryExpression(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "UnaryExpression")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    UnaryExpression unaryExpr_d = new UnaryExpression();

    string operator = root.childs[0].content;
    if (operator == "!")
        unaryExpr_d.prefix = Token(tok!"!", "", 0, 0, 0);
    else if (operator == "*") // pointer deref
        unaryExpr_d.prefix = Token(tok!"*", "", 0, 0, 0);

    UnaryExpression unaryExpr = new UnaryExpression();
    unaryExpr.unaryExpression = cast(UnaryExpression) convertExpression(root.childs[1]);
    unaryExpr_d.unaryExpression = unaryExpr;

    return unaryExpr_d;

}

ExpressionNode convertRelationalExpression(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "RelationalExpression")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    RelExpression relExpr_d = new RelExpression();

    relExpr_d.left = convertExpression(root.childs[0]);

    string operator = root.childs[1].content;
    switch (operator) {
    case "<":
        relExpr_d.operator = tok!"<";
        break;
    case ">":
        relExpr_d.operator = tok!">";
        break;
    case "<=":
        relExpr_d.operator = tok!"<=";
        break;
    case ">=":
        relExpr_d.operator = tok!">=";
        break;
    default:
        writeln("Unknown relational token: ", operator);
    }

    relExpr_d.right = convertExpression(root.childs[2]);

    return relExpr_d;

}

ExpressionNode convertAdditiveExpression(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "AdditiveExpression")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    AddExpression addExpr_d = new AddExpression();
    addExpr_d.left = convertExpression(root.childs[0]);

    if (root.childs[1].content == "+") {
        addExpr_d.operator = tok!"+";
    }
    else if (root.childs[1].content == "-") {
        addExpr_d.operator = tok!"-";
    }
    else {
        writeln("Unknown additive token: ", root.childs[1].content);
    }

    addExpr_d.right = convertExpression(root.childs[2]);

    return addExpr_d;
}

ExpressionNode convertMultiplicativeExpression(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "MultiplicativeExpression")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    MulExpression mulExpr_d = new MulExpression();
    mulExpr_d.left = convertExpression(root.childs[0]);

    if (root.childs[1].content == "*") {
        mulExpr_d.operator = tok!"*";
    }
    else if (root.childs[1].content == "/") {
        mulExpr_d.operator = tok!"/";
    }
    else if (root.childs[1].content == "%") {
        mulExpr_d.operator = tok!"%";
    }
    else {
        writeln("Unknown multiplicative token: ", root.childs[1].content);
    }

    mulExpr_d.right = convertExpression(root.childs[2]);

    return mulExpr_d;
}

ExpressionNode convertAndExpression(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "AndExpression")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    AndExpression andExpr_d = new AndExpression();
    andExpr_d.left = convertExpression(root.childs[0]);
    andExpr_d.right = convertExpression(root.childs[2]);

    return andExpr_d;
}

ExpressionNode convertExclusiveOrExpression(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "ExclusiveOrExpression")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    XorExpression xorExpr_d = new XorExpression();
    xorExpr_d.left = convertExpression(root.childs[0]);
    xorExpr_d.right = convertExpression(root.childs[2]);

    return xorExpr_d;
}

ExpressionNode convertInclusiveOrExpression(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "InclusiveOrExpression")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    OrExpression orExpr_d = new OrExpression();
    orExpr_d.left = convertExpression(root.childs[0]);
    orExpr_d.right = convertExpression(root.childs[2]);

    return orExpr_d;
}

ExpressionNode convertLogicalAndExpression(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "LogicalAndExpression")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    AndAndExpression andExpr_d = new AndAndExpression();
    andExpr_d.left = convertExpression(root.childs[0]);
    andExpr_d.right = convertExpression(root.childs[2]);

    return andExpr_d;
}

ExpressionNode convertLogicalOrExpression(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "LogicalOrExpression")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    OrOrExpression orExpr_d = new OrOrExpression();
    orExpr_d.left = convertExpression(root.childs[0]);
    orExpr_d.right = convertExpression(root.childs[2]);

    return orExpr_d;
}

ExpressionNode convertEqualityExpression(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "EqualityExpression")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    EqualExpression equalExpr_d = new EqualExpression();
    equalExpr_d.left = convertExpression(root.childs[0]);
    string operator = root.childs[1].content;
    if (operator == "==")
        equalExpr_d.operator = tok!"==";
    else if (operator == "!=")
        equalExpr_d.operator = tok!"!=";
    else
        writeln("Unknown equality token: ", operator);
    equalExpr_d.right = convertExpression(root.childs[2]);

    return equalExpr_d;
}

NewExpression convertNewExpression(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "NewExpression")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    NewExpression newExpr_d = new NewExpression();
    newExpr_d.type = convertTypeIdAndNewTypeId(root.childs[3]);

    NamedArgumentList argsList_d = new NamedArgumentList();

    // handle new initializer, read arguments
    auto initializerClause_c = root.childs[4].childs[1].childs[0];
    foreach (expr_c; initializerClause_c.childs) {
        NamedArgument namedArg_d = new NamedArgument();

        auto expr_d = convertExpression(expr_c);
        namedArg_d.assignExpression = expr_d;
        argsList_d.items ~= namedArg_d;
    }
    newExpr_d.arguments = new Arguments();
    newExpr_d.arguments.namedArgumentList = argsList_d;

    return newExpr_d;
}

DeleteExpression convertDeleteExpression(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "DeleteExpression")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    DeleteExpression deleteExpr_d = new DeleteExpression();
    deleteExpr_d.unaryExpression = cast(UnaryExpression) convertExpression(root.childs[2]);
    return deleteExpr_d;
}

UnaryExpression convertCastExpression(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "CastExpression")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    CastExpression castExpr_d = new CastExpression();
    castExpr_d.type = convertTypeIdAndNewTypeId(root.childs[1]);
    castExpr_d.unaryExpression = cast(UnaryExpression) convertExpression(root.childs[3]);

    UnaryExpression expr_d = new UnaryExpression();
    expr_d.castExpression = castExpr_d;
    return expr_d;

}

ExpressionNode convertPostfixExpression(Tree root) {
    ExpressionNode result;
    // check for the following is a token (operator)
    if (root.childs[1].nodeType == NodeType.token) {
        string operator = root.childs[1].content;
        if (operator == "(") {
            // function call
            FunctionCallExpression funcCall_d = new FunctionCallExpression();
            funcCall_d.unaryExpression = cast(UnaryExpression) convertExpression(root.childs[0]);
            if (root.childs[2].childs.length > 0) {
                funcCall_d.arguments = new Arguments();
                NamedArgumentList argsList_d = new NamedArgumentList();
                foreach (child; root.childs[2].childs) {
                    if (child.nodeType == NodeType.token) {
                        // skip the comma
                        continue;
                    }
                    NamedArgument namedArg_d = new NamedArgument();
                    namedArg_d.assignExpression = convertExpression(child);
                    argsList_d.items ~= namedArg_d;
                }
                funcCall_d.arguments.namedArgumentList = argsList_d;
                // showTree(root.childs[2], 5);
            }
            UnaryExpression unaryExpr_d = new UnaryExpression();
            unaryExpr_d.functionCallExpression = funcCall_d;
            result = unaryExpr_d;
            // convert function args.
        }
        else if (operator == "->" || operator == ".") {
            // member access
            // showTree(root, 3);
            // TODO: use IdentifierOrTemplateChain instead?
            UnaryExpression unaryExpr_d = cast(UnaryExpression) convertExpression(
                root.childs[3]);
            unaryExpr_d.unaryExpression = cast(UnaryExpression) convertExpression(
                root.childs[0]);
            result = unaryExpr_d;
        }
        else if (operator == "--") {
            // postfix decrement
            UnaryExpression unaryExpr_d = new UnaryExpression();
            unaryExpr_d.unaryExpression = new UnaryExpression();
            unaryExpr_d.unaryExpression.identifierOrTemplateInstance = convertIdentifier(root.childs[0])
                .toIdentifierOrTemplateInstance();
            // the token name must be empty or else libdlang assert will trigger
            unaryExpr_d.suffix = Token(tok!"--", "", 0, 0, 0);
            result = unaryExpr_d;
        }
        else if (operator == "++") {
            // postfix increment
            UnaryExpression unaryExpr_d = new UnaryExpression();
            unaryExpr_d.unaryExpression = new UnaryExpression();
            unaryExpr_d.unaryExpression.identifierOrTemplateInstance = convertIdentifier(root.childs[0])
                .toIdentifierOrTemplateInstance();
            // the token name must be empty or else libdlang assert will trigger
            unaryExpr_d.suffix = Token(tok!"++", "", 0, 0, 0);
            result = unaryExpr_d;
        }
        else if (operator == "[") {
            writeln("Array subscript not implemented");
        }
        else {
            writeln("Unknown postfix token: ", operator);

        }
    }
    return result;
}

ExpressionNode convertPrimaryExpression(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "PrimaryExpression")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    PrimaryExpression primaryExpr_d = new PrimaryExpression();
    if (root.childs.length == 1) {
        primaryExpr_d.primary = Token(tok!"identifier", root.childs[0].content, 0, 0, 0);
    }
    else if (root.childs[0].nodeType == NodeType.token
        && root.childs[0].content == "(") {
        // this is a parenthesized expression
        primaryExpr_d.expression = new Expression();
        primaryExpr_d.expression.items ~= convertExpression(root.childs[1]);
    }
    else if (root.childs.length == 3) {
        Expression expr = new Expression();
        expr.items ~= convertExpression(root.childs[1]);
        primaryExpr_d.expression = expr;
    }
    else {
        writeln("Unknown primary expression: ", root.childs.length);

    }

    UnaryExpression unaryExpr_d = new UnaryExpression();
    unaryExpr_d.primaryExpression = primaryExpr_d;
    return unaryExpr_d;

}

ExpressionNode convertExpression(Tree root) {
    if (root.nodeType == NodeType.token)
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.asText);

    ExpressionNode result;

    switch (root.name) {
    case "PostfixExpression":
        result = convertPostfixExpression(root);
        break;
    case "TypeOrPostfixExpression":
        if (root.nodeType == NodeType.merged) {
            auto node = root.childs[0];
            writeln("TypeorPostfixExpression: is ambiguous, choosing alternative: ", node.name);
            result = convertExpression(node);
        }
        else {
            writeln("Not processing TypeOrPostfixExpression");
        }
        break;
    case "QualifiedId":
        result = convertQualifiedId(root);
        break;
    case "Literal":
        PrimaryExpression primaryExpr_d = new PrimaryExpression();
        primaryExpr_d.primary = Token(tok!"intLiteral", root.childs[0].content, 0, 0, 0);
        UnaryExpression unaryExpr_d = new UnaryExpression();
        unaryExpr_d.primaryExpression = primaryExpr_d;
        result = unaryExpr_d;
        break;
    case "FloatLiteral":
        PrimaryExpression primaryExpr_d = new PrimaryExpression();
        primaryExpr_d.primary = Token(tok!"floatLiteral", root.childs[0].content, 0, 0, 0);
        UnaryExpression unaryExpr_d = new UnaryExpression();
        unaryExpr_d.primaryExpression = primaryExpr_d;
        result = unaryExpr_d;
        break;
    case "CharLiteral":
        PrimaryExpression primaryExpr_d = new PrimaryExpression();
        primaryExpr_d.primary = Token(tok!"characterLiteral", root.childs[0].content, 0, 0, 0);
        UnaryExpression unaryExpr_d = new UnaryExpression();
        unaryExpr_d.primaryExpression = primaryExpr_d;
        result = unaryExpr_d;
        break;
    case "PrimaryExpression":
        result = convertPrimaryExpression(root);
        break;
    case "NameIdentifier":
        UnaryExpression unaryExpr_d = new UnaryExpression();
        unaryExpr_d.identifierOrTemplateInstance = convertIdentifier(root)
            .toIdentifierOrTemplateInstance();
        result = unaryExpr_d;
        break;
    case "InitializerClause":
        result = convertExpression(root.childs[0]);
        break;
    case "ConditionalExpression":
        result = convertTernaryExpression(root);
        break;
    case "AssignmentExpression":
        // TODO: move this to expression handler
        result = convertAssignmentExpression(root);
        break;
    case "UnaryExpression":
        if (root.nodeType == NodeType.merged) {
            auto node = root.childs[1];
            writeln("UnaryExpression: is ambiguous, choosing alternative: ", node.name);
            result = convertExpression(node);
        }
        else {
            result = convertUnaryExpression(root);
        }
        break;
    case "RelationalExpression":
        result = convertRelationalExpression(root);
        break;
    case "AdditiveExpression":
        result = convertAdditiveExpression(root);
        break;
    case "MultiplicativeExpression":
        result = convertMultiplicativeExpression(root);
        break;
    case "AndExpression":
        result = convertAndExpression(root);
        break;
    case "InclusiveOrExpression":
        result = convertInclusiveOrExpression(root);
        break;
    case "ExclusiveOrExpression":
        result = convertExclusiveOrExpression(root);
        break;
    case "LogicalAndExpression":
        result = convertLogicalAndExpression(root);
        break;
    case "LogicalOrExpression":
        result = convertLogicalOrExpression(root);
        break;
    case "EqualityExpression":
        result = convertEqualityExpression(root);
        break;
    case "NewExpression":
        result = convertNewExpression(root);
        break;
    case "DeleteExpression":
        result = convertDeleteExpression(root);
        break;
    case "CastExpression":
        if (root.nodeType == NodeType.merged) {
            root = root.childs[1];
            writefln("CastExpression: is ambiguous, choosing alternative: ", root.name);
        }
        result = convertCastExpression(root);
        break;
    default:
        writeln("Unknown expression type: ", root.name);
        // showTree(root, 3);

        break;
    }

    return result;
}

AssignExpression convertAssignmentExpression(Tree root) {
    if (root.nodeType == NodeType.token
        || root.name != "AssignmentExpression")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.name);

    AssignExpression assignExpr_d = new AssignExpression();

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

    return assignExpr_d;

}

//***********************************
// Statements
//***********************************

ExpressionStatement convertExpressionStatement(Tree root) {

    if (root.nodeType == NodeType.token
        || root.name != "ExpressionStatement")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.name);

    ExpressionStatement exprStmt_d = new ExpressionStatement();

    ExpressionNode exprNode_d = convertExpression(root.childs[0]);
    Expression expr_d = new Expression();
    expr_d.items ~= exprNode_d;
    exprStmt_d.expression = expr_d;

    return exprStmt_d;
}

Statement convertIfStatement(Tree root) {
    if (root.nodeType == NodeType.token
        || root.name != "SelectionStatement")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.name);

    IfStatement ifStmt_d = new IfStatement();

    ifStmt_d.condition = new IfCondition();
    ifStmt_d.condition.expression = new Expression();
    ifStmt_d.condition.expression.items ~= convertExpression(root.childs[2]);
    ifStmt_d.thenStatement = convertStatement(root.childs[4])[0];
    if (root.childs.length >= 6) {
        ifStmt_d.elseStatement = convertStatement(root.childs[6])[0];
    }

    Statement stmt = new Statement();
    stmt.statementNoCaseNoDefault = new StatementNoCaseNoDefault();
    stmt.statementNoCaseNoDefault.ifStatement = ifStmt_d;
    return stmt;

}

Statement convertJumpStatement(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "JumpStatement")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.name);

    Statement stmt = new Statement();
    StatementNoCaseNoDefault stmt_d = new StatementNoCaseNoDefault();
    stmt.statementNoCaseNoDefault = stmt_d;

    // All jump statements have a jumpstatement2 child and a semi-colon token.
    // child[0] is the jumpstatement
    root = root.childs[0];

    // check if the statement is a return or goto

    if (root.childs[0].content == "goto") {
        GotoStatement goto_d = new GotoStatement();
        if (root.childs[1].nodeType == NodeType.token) {
            goto_d.label = Token(tok!"identifier", root.childs[1].content, 0, 0, 0);
        }
        else {
            Expression expr = new Expression();
            expr.items ~= convertExpression(root.childs[1]);
            goto_d.expression = expr;
        }
        stmt_d.gotoStatement = goto_d;
    }
    else if (root.childs[0].content == "return") {
        ReturnStatement ret_d = new ReturnStatement();
        if (root.childs[1]) {
            Expression expr = new Expression();
            expr.items ~= convertExpression(root.childs[1]);
            ret_d.expression = expr;
        }
        stmt_d.returnStatement = ret_d;
    }

    return stmt;
}

Statement convertIterationStatement(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "IterationStatement")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.name);

    ForStatement forStmt_d = new ForStatement();
    if (root.childs[2].name != "EmptyStatement") {
        forStmt_d.initialization = convertStatement(root.childs[2])[0];
    }
    if (root.childs[3]!is null) {
        Expression expr = new Expression();
        expr.items ~= convertExpression(root.childs[3]);
        forStmt_d.test = expr;
    }
    // Increment can be null
    if (root.childs[5]) {
        Expression expr = new Expression();
        expr.items ~= convertExpression(root.childs[5]);
        forStmt_d.increment = expr;
    }
    forStmt_d.declarationOrStatement = convertStatement(root.childs[7])[0];

    Statement stmt_d = new Statement();
    stmt_d.statementNoCaseNoDefault = new StatementNoCaseNoDefault();
    stmt_d.statementNoCaseNoDefault.forStatement = forStmt_d;
    return stmt_d;
}

CaseStatement convertCaseStatement(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "LabelStatement")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.name);

    CaseStatement caseStmt_d = new CaseStatement();

    caseStmt_d.argumentList = new ArgumentList();
    caseStmt_d.argumentList.items ~= convertExpression(root.childs[2]);

    return caseStmt_d;
}

DefaultStatement convertDefaultStatement(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "LabelStatement")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.name);

    DefaultStatement defStmt_d = new DefaultStatement();

    return defStmt_d;
}

Statement convertSwitchStatement(Tree root) {

    enum CaseBlockType {
        noneType,
        caseType,
        defaultType,
    }

    DeclarationOrStatement wrapCaseStatement(CaseStatement caseStmt) {
        Statement stmt_d = new Statement();
        stmt_d.caseStatement = caseStmt;
        DeclarationOrStatement declOrStmt_d = new DeclarationOrStatement();
        declOrStmt_d.statement = stmt_d;
        return declOrStmt_d;
    }

    DeclarationOrStatement wrapDefaultStatement(DefaultStatement defaultStmt) {
        Statement stmt_d = new Statement();
        stmt_d.defaultStatement = defaultStmt;
        DeclarationOrStatement declOrStmt_d = new DeclarationOrStatement();
        declOrStmt_d.statement = stmt_d;
        return declOrStmt_d;
    }

    DeclarationOrStatement getStatements(CaseBlockType caseBlockType,
        CaseStatement caseStmt_d,
        DefaultStatement defaultStmt_d,
        DeclarationsAndStatements stmts_d) {
        if (caseBlockType == CaseBlockType.caseType) {
            caseStmt_d.declarationsAndStatements = stmts_d;
            return wrapCaseStatement(caseStmt_d);
        }
        else if (caseBlockType == CaseBlockType.defaultType) {
            defaultStmt_d.declarationsAndStatements = stmts_d;
            return wrapDefaultStatement(defaultStmt_d);

        }
        else {
            writeln("No case or default statement found. ");
        }
        return null;
    }

    if (root.nodeType != NodeType.nonterminal
        || root.name != "SelectionStatement")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.name);

    SwitchStatement switchStmt_d = new SwitchStatement();

    // Convert the switch condition
    IfCondition ifCond_d = new IfCondition();
    ifCond_d.expression = new Expression();
    ifCond_d.expression.items ~= convertExpression(root.childs[2]);
    switchStmt_d.condition = ifCond_d;

    // Convert the switch body
    BlockStatement blockStmt_d = new BlockStatement();
    blockStmt_d.declarationsAndStatements = new DeclarationsAndStatements();
    DeclarationsAndStatements stmts_d;

    CaseBlockType caseBlockType = CaseBlockType.noneType;
    CaseStatement caseStmt_d;
    DefaultStatement defaultStmt_d;
    auto statements_c = root.childs[4].childs[1].childs[1].childs;
    foreach (child; statements_c) {
        if (child.name == "LabelStatement") {
            // add the case statement to the switch
            if (caseBlockType != CaseBlockType.noneType) {
                blockStmt_d.declarationsAndStatements.declarationsAndStatements ~= getStatements(
                    caseBlockType, caseStmt_d, defaultStmt_d, stmts_d);
            }
            // create a list for the next case block
            stmts_d = new DeclarationsAndStatements();
            if (child.childs[1].content == "case") {
                caseBlockType = CaseBlockType.caseType;
                caseStmt_d = convertCaseStatement(child);
            }
            else if (child.childs[1].content == "default") {
                caseBlockType = CaseBlockType.defaultType;
                defaultStmt_d = convertDefaultStatement(child);
            }
        }
        else {
            auto node = convertStatement(child);
            stmts_d.declarationsAndStatements ~= node;
        }
    }
    // Are there left over statements?
    blockStmt_d.declarationsAndStatements.declarationsAndStatements ~= getStatements(
        caseBlockType, caseStmt_d, defaultStmt_d, stmts_d);

    switchStmt_d.statement = new Statement();
    switchStmt_d.statement.statementNoCaseNoDefault = new StatementNoCaseNoDefault();
    switchStmt_d.statement.statementNoCaseNoDefault.blockStatement = blockStmt_d;

    Statement stmt = new Statement();
    stmt.statementNoCaseNoDefault = new StatementNoCaseNoDefault();
    stmt.statementNoCaseNoDefault.switchStatement = switchStmt_d;

    return stmt;

}

Statement convertLabelStatement(Tree root) {
    if (root.nodeType != NodeType.nonterminal
        || root.name != "LabelStatement")
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.name);

    LabeledStatement labelStmt_d = new LabeledStatement();
    labelStmt_d.identifier = Token(tok!"identifier", root.childs[1].content, 0, 0, 0);
    // TODO: can this line be removed?
    labelStmt_d.declarationOrStatement = new DeclarationOrStatement();

    Statement stmt_d = new Statement();
    stmt_d.statementNoCaseNoDefault = new StatementNoCaseNoDefault();
    stmt_d.statementNoCaseNoDefault.labeledStatement = labelStmt_d;
    return stmt_d;
}

DeclarationOrStatement[] convertStatement(Tree root) {
    if (root.nodeType == NodeType.token)
        throw new Exception("Non-terminal or unexpected terminal: " ~ root.name);

    // go through the children
    DeclarationOrStatement[] declsOrStmts_d;

    switch (root.name) {
    case "Statement":
        // If a statement is ambiguous then 
        // The statement will be merged and contain each alternative
        // interpretation
        if (root.nodeType == NodeType.merged) {
            // substatement such as expressionstatement
            writeln("Statement: is ambiguous. Choosing alternative: ", root.childs[1].name);
            declsOrStmts_d ~= convertStatement(root.childs[1]);
        }
        else if (root.childs[0].name == "PP_Directive") {
            Declaration decl_d = convertDirective(root.childs[0]);
            DeclarationOrStatement declOrStmt_d = new DeclarationOrStatement();
            declOrStmt_d.declaration = decl_d;
            declsOrStmts_d ~= declOrStmt_d;
            return declsOrStmts_d;
        }
        else {
            // skip the first token which an array
            declsOrStmts_d ~= convertStatement(root.childs[1]);
        }
        break;
    case "SimpleDeclaration1":
        Declaration[] decls_d = convertSimpleDeclaration1(root);
        foreach (decl; decls_d) {
            DeclarationOrStatement declOrStmt_d = new DeclarationOrStatement();
            declOrStmt_d.declaration = decl;
            declsOrStmts_d ~= declOrStmt_d;
        }
        break;
    case "CompoundStatement":
        // substatement such as expressionstatement
        DeclarationOrStatement declOrStmt_d = new DeclarationOrStatement();
        declOrStmt_d.statement = new Statement();
        declOrStmt_d.statement.statementNoCaseNoDefault = new StatementNoCaseNoDefault();
        declOrStmt_d.statement.statementNoCaseNoDefault.blockStatement = convertCompoundStatement(
            root);
        declsOrStmts_d ~= declOrStmt_d;
        break;
    case "ExpressionStatement":
        ExpressionStatement exprStmt_d = convertExpressionStatement(root);
        StatementNoCaseNoDefault stmtNoCaseNoDefault_d = new StatementNoCaseNoDefault();
        stmtNoCaseNoDefault_d.expressionStatement = exprStmt_d;
        Statement stmt_d = new Statement();
        stmt_d.statementNoCaseNoDefault = stmtNoCaseNoDefault_d;
        DeclarationOrStatement declOrStmt_d = new DeclarationOrStatement();
        declOrStmt_d.statement = stmt_d;
        declsOrStmts_d ~= declOrStmt_d;
        break;
    case "SelectionStatement":
        auto kind = root.childs[0].content;
        DeclarationOrStatement declOrStmt_d = new DeclarationOrStatement();
        if (kind == "switch") {
            declOrStmt_d.statement = convertSwitchStatement(root);
        }
        else if (kind == "if") {
            declOrStmt_d.statement = convertIfStatement(root);
        }
        else {
            writeln("Unknown selection statement: ", kind);
            // showTree(root, 5);
        }
        declsOrStmts_d ~= declOrStmt_d;
        break;
    case "JumpStatement":
        DeclarationOrStatement declOrStmt_d = new DeclarationOrStatement();
        declOrStmt_d.statement = convertJumpStatement(root);
        declsOrStmts_d ~= declOrStmt_d;
        break;
    case "IterationStatement":
        DeclarationOrStatement declOrStmt_d = new DeclarationOrStatement();
        declOrStmt_d.statement = convertIterationStatement(root);
        declsOrStmts_d ~= declOrStmt_d;
        break;
    case "LabelStatement":
        DeclarationOrStatement declOrStmt_d = new DeclarationOrStatement();
        declOrStmt_d.statement = convertLabelStatement(root);
        declsOrStmts_d ~= declOrStmt_d;
        break;
    case "ForInitStatement":
        if (root.nodeType == NodeType.merged) {
            writeln("ForInitStatement: is ambiguous, choosing alternative: ", root.childs[0].name);
        }
        declsOrStmts_d ~= convertStatement(root.childs[0]);
        break;
    default:

        writeln("SingleStmt: Unknown statement type: ", root.name);
        showTree(root);
        writeln("At line: ", root.start());
        throw new Exception("Unknown statement type: " ~ root.name);
        break;
    }

    return declsOrStmts_d;
}

BlockStatement convertCompoundStatement(Tree root) {

    if (root.nodeType != NodeType.nonterminal &&
        root.name != "CompoundStatement")
        throw new Exception("Unexpected non-terminal: " ~ root.asText);

    BlockStatement blockStmt_d = new BlockStatement();
    blockStmt_d.declarationsAndStatements = new DeclarationsAndStatements();

    // skip token 0 which is '{' and token 2 which is '}'

    foreach (child; root.childs[1].childs) {
        if (child.name == "Comment") {
            writeln("Skipping comment");
            continue;
        }
        blockStmt_d.declarationsAndStatements.declarationsAndStatements ~= convertStatement(
            child);
    }
    return blockStmt_d;
}
