module dsourceprinter;

import std.algorithm.iteration;
import std.range;
import std.array;
import std.stdio;

import dparse.ast;
import dparse.lexer;

import formatwriter;

class DSourcePrinter : ASTVisitor {
    private FormatWriter fmt;

    alias visit = ASTVisitor.visit;

    this(File output) {
        fmt = new FormatWriter(output);
    }

    override void visit(const ModuleDeclaration decl) {
        fmt.write("module ");
        // TODO: remove accept and change all to: this.visit(decl)
        decl.accept(this);
        fmt.writeln(";");
        fmt.writeln();
    }

    override void visit(const ImportDeclaration decl) {
        fmt.write("import ");
        decl.accept(this);
        fmt.writeln(";");
    }

    override void visit(const DeclarationOrStatement decl) {
        if (decl.declaration) {
            decl.declaration.accept(this);
        }
        else {
            decl.statement.accept(this);
        }
        fmt.writeln();
    }

    // TODO: consider whether const in C means immutable or const in D
    override void visit(const Attribute attr) {

        attr.accept(this);

        if (attr.attribute == tok!"const") {
            fmt.write("const ");
        }
        else if (attr.attribute == tok!"public") {
            fmt.write("public");
        }
        else if (attr.attribute == tok!"private") {
            fmt.write("private");
        }
        else if (attr.attribute == tok!"protected") {
            fmt.write("protected");
        }
        else if (attr.attribute == tok!"override") {
            fmt.write("override");
        }
        else if (attr.attribute == tok!"abstract") {
            fmt.write("abstract");
        }
    }

    override void visit(const AttributeDeclaration decl) {
        decl.accept(this);
        fmt.writeln(":");
    }

    override void visit(const FunctionDeclaration decl) {
        bool hasConstAttribute = false;

        foreach (attrib; decl.attributes) {
            this.visit(attrib);
            if (attrib.attribute == tok!"const") {
                hasConstAttribute = true;
                fmt.write("(");
            } else {
                fmt.write(" ");
            }
        }

        foreach (sc; decl.storageClasses) {
            this.visit(sc);
            fmt.write(" ");
        }

        if (decl.returnType) {
            decl.returnType.accept(this);
            if (hasConstAttribute)
                fmt.write(")");
            fmt.write(" ");
        }
        this.visit(decl.name);
        fmt.write("(");
        if (decl.parameters) {
            this.visit(decl.parameters);
        }
        fmt.write(")");

        foreach (attr; decl.memberFunctionAttributes) {
            if (attr.tokenType == tok!"const") {
                fmt.write(" const");
            }
        }

        if (decl.functionBody) {
            fmt.write(' ');
            decl.functionBody.accept(this);
        }
        else {
            fmt.write(";");
        }
        fmt.writeln();
        fmt.writeln();
    }

    override void visit(const EnumDeclaration decl) {
        fmt.write("enum ");
        this.visit(decl.name);
        this.visit(decl.enumBody);
    }

    override void visit (const EnumBody enumbody) {
        fmt.writeln(" {");
        fmt.indent();
        foreach(i, member; enumbody.enumMembers) {
            this.visit(member);
            fmt.writeln(",");
        }
        fmt.dedent();
        fmt.writeln("}");
    }

    override void visit(const EnumMember member) {
        if (member.name != 0) {
            this.visit(member.name);
        }
        if (member.assignExpression) {
            fmt.write(" = ");
            super.dynamicDispatch(member.assignExpression);
        }
    }

    override void visit(const Parameters params) {
        // TODO: can also be done with lambda expression
        foreach (i, param; params.parameters) {
            foreach (attrib; param.parameterAttributes) {
                this.visit(attrib);
            }
            param.type.accept(this);
            foreach (suffix; param.cstyle) {
                this.visit(suffix);
            }
            fmt.write(" ");
            this.visit(param.name);
            if (i != params.parameters.length - 1) {
                fmt.write(", ");
            }
        }
    }

    override void visit(const ParameterAttribute attrib) {
        if (attrib.idType == tok!"const") {
            fmt.write("const ");
        }
        else if (attrib.idType == tok!"in") {
            fmt.write("in ");
        }
        else if (attrib.idType == tok!"out") {
            fmt.write("out ");
        }
        else if (attrib.idType == tok!"ref") {
            fmt.write("ref ");
        }
    }

    override void visit(const PrimaryExpression expr) {
        if (expr.primary != 0) {
            this.visit(expr.primary);
        }
        else if (expr.expression) {
            fmt.write("(");
            super.dynamicDispatch(expr.expression);
            fmt.write(")");
        }
        else {
            expr.accept(this);
        }
    }

    override void visit(const ShiftExpression expr) {
        super.dynamicDispatch(expr.left);
        if (expr.operator == tok!">>")
            fmt.write(" >> ");
        else if (expr.operator == tok!"<<")
            fmt.write(" << ");
        super.dynamicDispatch(expr.right);
    }

    override void visit(const UnaryExpression expr) {

        if (expr.prefix != 0) {
            if (expr.prefix == tok!"!") {
                fmt.write("!");
            }
            else if (expr.prefix == tok!"*") {
                fmt.write("*");
            }
            else {
                writeln("Unknown prefix ", expr.prefix);
                this.visit(expr.prefix);
            }
        }
        if (expr.primaryExpression) {
            super.dynamicDispatch(expr.primaryExpression);
        }
        if (expr.castExpression) {
            // must be visit because with expr.castExpression.accept()
            //  it will visit the fields of the cast expression
            this.visit(expr.castExpression);
        }
        if (expr.functionCallExpression) {
            super.dynamicDispatch(expr.functionCallExpression);
        }
        if (expr.unaryExpression) {
            super.dynamicDispatch(expr.unaryExpression);
        }
        if (expr.unaryExpression && expr.identifierOrTemplateInstance) {
            fmt.write(".");
        }
        if (expr.identifierOrTemplateInstance) {
            expr.identifierOrTemplateInstance.accept(this);
        }
        if (expr.suffix != 0) {
            if (expr.suffix == tok!"++") {
                fmt.write("++");
            }
            else if (expr.suffix == tok!"--") {
                fmt.write("--");
            }
            else {
                writeln("Unknown suffix ", expr.suffix);
                this.visit(expr.suffix);
            }
        }
        if (expr.indexExpression) {
            this.dynamicDispatch(expr.indexExpression);
        }

    }

    override void visit(const TernaryExpression expr) {
        if (expr.orOrExpression)
            super.dynamicDispatch(expr.orOrExpression);

        fmt.write(" ? ");

        if (expr.expression)
            super.dynamicDispatch(expr.expression);

        fmt.write(" : ");

        if (expr.ternaryExpression)
            super.dynamicDispatch(expr.ternaryExpression);

    }

    override void visit(const IndexExpression expr) {
        fmt.write("[");
        this.dynamicDispatch(expr.unaryExpression);
        fmt.write("]");
    }

    override void visit(const FunctionCallExpression expr) {

        super.dynamicDispatch(expr.unaryExpression);
        fmt.write("(");
        if (expr.arguments)
            expr.arguments.accept(this);
        fmt.write(")");

    }

    override void visit(const NamedArgumentList argsList) {
        foreach (i, arg; argsList.items) {
            if (!arg.assignExpression) {
                writeln("printer: NamedArgumentList: arg is null");
                continue;
            }
            super.dynamicDispatch(arg.assignExpression);
            if (i != argsList.items.length - 1) {
                fmt.write(", ");
            }
        }
    }

    //*********************************
    // Expressions
    //*********************************

    override void visit(const NewExpression expr) {
        fmt.write("new ");

        expr.type.accept(this);

        if (expr.arguments) {
            fmt.write("(");
            expr.arguments.accept(this);
            fmt.write(")");
        }
    }

    override void visit(const DeleteExpression expr) {
        fmt.write("delete ");
        if (expr.unaryExpression) {
            super.dynamicDispatch(expr.unaryExpression);
        }
    }

    override void visit(const CastExpression expr) {
        fmt.write("cast(");
        if (expr.type) {
            this.visit(expr.type);
        }
        fmt.write(") ");
        if (expr.unaryExpression) {
            super.dynamicDispatch(expr.unaryExpression);
        }
    }

    //********************************
    // Statements
    //********************************

    override void visit(const ExpressionStatement stmt) {
        super.dynamicDispatch(stmt.expression);
        fmt.write(";");
    }

    override void visit(const BlockStatement block) {
        fmt.writeln("{");
        fmt.indent();
        block.accept(this);
        fmt.dedent();
        fmt.write("}");
    }

    override void visit(const IfStatement stmt) {
        fmt.write("if (");
        if (stmt.condition) {
            stmt.condition.accept(this);
        }
        fmt.write(") ");
        // A if statement must have a then block
        stmt.thenStatement.accept(this);
        if (stmt.elseStatement) {
            fmt.writeln();
            fmt.write("else ");
            stmt.elseStatement.accept(this);
        }
    }

    override void visit(const ReturnStatement stmt) {
        fmt.write("return");
        if (stmt.expression !is null) {
            fmt.write(' ');
            super.dynamicDispatch(stmt.expression);
        }
        fmt.write(";");
    }

    override void visit(const GotoStatement stmt) {
        fmt.write("goto");
        if (stmt.expression) {
            fmt.write(' ');
            super.dynamicDispatch(stmt.expression);
        }
        else {
            this.visit(stmt.label);
        }
        fmt.write(";");
    }

    override void visit(const BreakStatement stmt) {
        fmt.write("break");
        if (stmt.label != 0 ) {
            fmt.write(' ');
            this.visit(stmt.label);
        }
        fmt.write(";");
    }

    override void visit(const ForStatement stmt) {
        fmt.write("for (");
        if (stmt.initialization) {
            stmt.initialization.accept(this);
        } else {
            fmt.write("; ");
        }
        if (stmt.test)
            super.dynamicDispatch(stmt.test);
        fmt.write("; ");
        if (stmt.increment)
            super.dynamicDispatch(stmt.increment);
        fmt.write(") ");
        if (stmt.declarationOrStatement) {
            stmt.declarationOrStatement.accept(this);
        }
    }

    override void visit(const WhileStatement stmt) {
        fmt.write("while (");
        if (stmt.condition) {
            this.visit(stmt.condition);
        }
        if (stmt.declarationOrStatement) {
            stmt.declarationOrStatement.accept(this);
        }
    }

    override void visit(const SwitchStatement stmt) {
        fmt.write("switch (");
        if (stmt.condition)
            stmt.condition.accept(this);
        fmt.write(") ");
        if (stmt.statement)
            stmt.statement.accept(this);
    }

    override void visit(const CaseStatement stmt) {
        fmt.write("case ");
        if (stmt.argumentList) {
            stmt.argumentList.accept(this);
        }
        fmt.writeln(":");
        fmt.indent();
        stmt.declarationsAndStatements.accept(this);
        fmt.dedent();
    }

    override void visit(const DefaultStatement stmt) {
        fmt.writeln("default:");
        fmt.indent();
        stmt.declarationsAndStatements.accept(this);
        fmt.dedent();
    }

    override void visit(const LabeledStatement stmt) {
        this.visit(stmt.identifier);
        fmt.writeln(":");
    }

    override void visit(const TypeSuffix suffix) {
        if (suffix.star != 0)
            fmt.write("*");
    }

    override void visit(const Type2 type2) {
        if (type2.typeIdentifierPart !is null) {
            type2.typeIdentifierPart.accept(this);
        }
        else {
            fmt.write(type2.builtinType.str);
        }
    }

    override void visit(const IdentifierChain chain) {
        fmt.write(chain.identifiers.map!(i => i.text).join('.'));
    }

    override void visit(const AutoDeclarationPart part) {

        this.visit(part.identifier);
        this.visit(part.initializer);
    }

    override void visit(const AutoDeclaration decl) {
        foreach (sc; decl.storageClasses) {
            sc.accept(this);
            fmt.write(" ");
        }
        foreach (part; decl.parts)
            this.visit(part);

    }

    override void visit(const AliasDeclaration decl) {
        fmt.write("alias ");
        decl.accept(this);
        fmt.writeln(";");

    }

    override void visit(const AliasInitializer init) {
        this.visit(init.name);
        fmt.write(" = ");
        foreach (sc; init.storageClasses) {
            sc.accept(this);
            fmt.write(" ");
        }
        if (init.type) {
            this.visit(init.type);
        }
        fmt.write(" ");

        if (init.functionLiteralExpression) {
            this.visit(init.functionLiteralExpression);
        }

    }

    override void visit(const FunctionLiteralExpression expr) {
        if (expr.returnType) {
            this.visit(expr.returnType);
        }
        fmt.write(" function");
        if (expr.parameters) {
            fmt.write("(");
            this.visit(expr.parameters);
            fmt.write(")");
        }
    }

    override void visit(const VariableDeclaration decl) {
        // fmt.write();
        if (decl.storageClasses) {
            foreach (sc; decl.storageClasses) {
                sc.accept(this);
                fmt.write(" ");
            }
        }

        if (decl.type) {
            this.visit(decl.type);
        }
        foreach (i, d; decl.declarators) {
            if (d is null) {
                writeln("printer: VariableDeclaration: d is null");
                continue;
            }
            foreach (c; d.cstyle) {
                this.visit(c);
            }
            fmt.write(" ");
            this.visit(d.name);
            d.accept(this);
            if (i < decl.declarators.length - 1) {
                fmt.write(",");
            }
        }

        if (decl.autoDeclaration)
            this.visit(decl.autoDeclaration);

        fmt.write(";");
        // TODO: consider how to format newlines
        fmt.writeln();
        if (decl.comment)
            fmt.writeln(decl.comment);

    }

    override void visit(const BaseClassList list) {
        fmt.write(" : ");

        foreach (i, bclass; list.items) {
            bclass.accept(this);
            if (i != list.items.length - 1) {
                fmt.write(", ");
            }
        }
    }

    override void visit(const StructDeclaration decl) {
        fmt.write("struct ");
        this.visit(decl.name);
        decl.accept(this);
    }

    override void visit(const ClassDeclaration decl) {
        fmt.write("class ");
        this.visit(decl.name);
        decl.accept(this);
    }

    override void visit(const StructBody bdy) {
        fmt.writeln(" {");
        fmt.indent();
        bdy.accept(this);
        fmt.dedent();
        fmt.writeln("}");
    }

    override void visit(const AssignExpression expr) {
        auto expr2 = (cast(Expression) expr.expression);
        if (expr2 is null) {
            stderr.writeln("Assign expression: expr2 is null");
            return;
        }
        if (expr2.items.length >= 1) {
            super.dynamicDispatch(expr2.items[0]);
        }

        if (expr.operator == tok!"=")
            fmt.write(" = ");
        else if (expr.operator == tok!"+=")
            fmt.write(" += ");
        else if (expr.operator == tok!"-=")
            fmt.write(" -= ");
        else if (expr.operator == tok!"*=")
            fmt.write(" *= ");
        else if (expr.operator == tok!"/=")
            fmt.write(" /= ");
        else if (expr.operator == tok!"%=")
            fmt.write(" %= ");
        else if (expr.operator == tok!"&=")
            fmt.write(" &= ");
        else if (expr.operator == tok!"|=")
            fmt.write(" |= ");
        else if (expr.operator == tok!"^=")
            fmt.write(" ^= ");
        else
            writeln("unknown token when printing");

        // super.dynamicDispatch(expr.expression);

        if (expr2.items.length >= 2) {
            super.dynamicDispatch(expr2.items[1]);
            // expr2.items[1].accept(this);
        }
    }

    override void visit(const RelExpression expr) {
        super.dynamicDispatch(expr.left);
        if (expr.operator == tok!">")
            fmt.write(" > ");
        else if (expr.operator == tok!"<")
            fmt.write(" < ");
        else if (expr.operator == tok!">=")
            fmt.write(" >= ");
        else if (expr.operator == tok!"<=")
            fmt.write(" <= ");
        else
            writeln("unknown token when printing");
        super.dynamicDispatch(expr.right);
    }

    override void visit(const MulExpression expr) {
        super.dynamicDispatch(expr.left);
        if (expr.operator == tok!"*")
            fmt.write(" * ");
        else if (expr.operator == tok!"/")
            fmt.write(" / ");
        else if (expr.operator == tok!"%")
            fmt.write(" % ");
        else
            writeln("unknown token when printing");
        super.dynamicDispatch(expr.right);
    }

    override void visit(const AddExpression expr) {
        super.dynamicDispatch(expr.left);
        if (expr.operator == tok!"+")
            fmt.write(" + ");
        else if (expr.operator == tok!"-")
            fmt.write(" - ");
        else
            writeln("unknown token when printing");
        super.dynamicDispatch(expr.right);
    }

    override void visit(const AndExpression expr) {
        super.dynamicDispatch(expr.left);
        fmt.write(" & ");
        super.dynamicDispatch(expr.right);
    }

    override void visit(const OrExpression expr) {
        super.dynamicDispatch(expr.left);
        fmt.write(" | ");
        super.dynamicDispatch(expr.right);
    }

    override void visit(const XorExpression expr) {
        super.dynamicDispatch(expr.left);
        fmt.write(" ^ ");
        super.dynamicDispatch(expr.right);
    }

    override void visit(const AndAndExpression expr) {
        super.dynamicDispatch(expr.left);
        fmt.write(" && ");
        super.dynamicDispatch(expr.right);
    }

    override void visit(const OrOrExpression expr) {
        super.dynamicDispatch(expr.left);
        fmt.write(" || ");
        super.dynamicDispatch(expr.right);
    }

    override void visit(const EqualExpression expr) {
        // TODO: remove later.
        if (expr.left)
            super.dynamicDispatch(expr.left);
        else
            writeln("Not implemented equal expr left");
        if (expr.operator == tok!"==")
            fmt.write(" == ");
        else if (expr.operator == tok!"!=")
            fmt.write(" != ");
        else
            writeln("unknown token when printing");
        // TODO: remove later.
        if (expr.right)
            super.dynamicDispatch(expr.right);
        else
            writeln("Not implemented equal expr right");
    }

    override void visit(const Declarator decl) {
        foreach (suffix; decl.cstyle) {
            this.visit(suffix);
        }
        fmt.write(" ");
        this.visit(decl.name);
        if (decl.initializer)
            this.visit(decl.initializer);
        decl.accept(this);
    }

    override void visit(const Initializer init) {
        if (init.nonVoidInitializer) {
            fmt.write(" = ");
            init.nonVoidInitializer.accept(this);
        }
    }

    override void visit(const Token token) {
        fmt.write(token.text);
    }

}
