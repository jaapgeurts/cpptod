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
        decl.accept(this);
        fmt.writeln(";");
        fmt.writeln();
    }

    override void visit(const ImportDeclaration decl) {
        fmt.write("import ");
        decl.accept(this);
        fmt.writeln(";");
    }

    override void visit(const FunctionDeclaration decl) {
        if (decl.returnType !is null) {
            decl.returnType.accept(this);
        }
        fmt.write(" ", decl.name.text);
        fmt.write("(");
        fmt.write(")");
        if (decl.functionBody !is null) {
            decl.functionBody.accept(this);
        }
    }

    override void visit (const Statement stmt) {
        stmt.accept(this);

        fmt.writeln(";");
    }

    override void visit(const UnaryExpression expr) {

        if (expr.primaryExpression) {
            super.dynamicDispatch(expr.primaryExpression);
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

    override void visit(const FunctionCallExpression expr) {

        super.dynamicDispatch(expr.unaryExpression);
        fmt.write("(");
        if (expr.arguments)
            expr.arguments.accept(this);
        fmt.write(")");
    }

    override void visit(const BlockStatement block) {
        fmt.writeln();
        fmt.writeln("{");
        fmt.indent();
        block.accept(this);
        fmt.dedent();
        fmt.writeln("}");
    }

    override void visit(const ReturnStatement stmt) {
        fmt.write("return");
        if (stmt.expression !is null) {
            fmt.write(' ');
            // super.dynamicDispatch(stmt.expression);
            stmt.expression.accept(this);
        }
        fmt.writeln(";");
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

    override void visit(const VariableDeclaration decl) {
        fmt.write();
        if (decl.storageClasses) {
            foreach (sc; decl.storageClasses) {
                sc.accept(this);
                fmt.write(" ");
            }
        }
        if (decl.type) {
            decl.type.accept(this);
        }
        fmt.write(" ");
        foreach (i, d; decl.declarators) {
            foreach (c; d.cstyle) {
                fmt.write(c.star.text);
            }
            fmt.write(d.name.text);
            d.accept(this);
            if (i < decl.declarators.length - 1) {
                fmt.write(", ");
            }
        }
        fmt.writeln(";");

        if (decl.comment)
            fmt.writeln(decl.comment);
    }

    override void visit(const AssignExpression expr) {
        auto expr2 = (cast(Expression) expr.expression);
        if (expr2.items.length >= 1) {
            super.dynamicDispatch(expr2.items[0]);
        }

        fmt.write(" = ");

        if (expr2.items.length >= 2) {
            super.dynamicDispatch(expr2.items[1]);
            // expr2.items[1].accept(this);
        }

    }

    override void visit(const Declarator decl) {
        fmt.writeln(decl.name.text);
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
