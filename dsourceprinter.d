module dsourceprinter;

import std.algorithm.iteration;
import std.range;
import std.array;
import std.stdio;

import dparse.ast;
import dparse.lexer;

import formatwriter;

class DSourcePrinter : ASTVisitor
{
    private FormatWriter fmt;

    alias visit = ASTVisitor.visit;

    this(File output)
    {
        fmt = new FormatWriter(output);
    }

    override void visit(const ModuleDeclaration decl)
    {
        fmt.write("module ");
        super.visit(decl);
        fmt.writeln(";");
        fmt.writeln();
    }

    override void visit(const FunctionDeclaration decl)
    {
        decl.returnType.accept(this);
        fmt.write(" ",decl.name.text);
        fmt.write("(");
        fmt.write(")");
        if (decl.functionBody !is null) {
            decl.functionBody.accept(this);
        }
    }

    override void visit(const BlockStatement block)
    {
        fmt.writeln();
        fmt.writeln("{");
        fmt.indent();
        super.visit(block);
        fmt.dedent();
        fmt.writeln("}");
    }
    
    override void visit(const ReturnStatement stmt)
    {
        fmt.write("return");
        if (stmt.expression !is null) {
            fmt.write(' ');
            // super.dynamicDispatch(stmt.expression);
            stmt.expression.accept(this);
        }
        fmt.writeln(";");
    }

    override void visit(const Type2 type2)
    {
        fmt.write(type2.builtinType.str);
    }

    override void visit(const IdentifierChain chain)
    {
        fmt.write(chain.identifiers.map!(i => i.text).join('.'));
    }

    override void visit(const VariableDeclaration decl)
    {
        fmt.write();
        decl.type.accept(this);
        fmt.write(" ");
        foreach(i,d; decl.declarators)
        {
            fmt.write(d.name.text);
            d.accept(this);
            if (i < decl.declarators.length - 1) {
                fmt.write(", ");
            }
        }
        fmt.writeln(";");
    }

    override void visit(const Declarator decl)
    {
        fmt.writeln(decl.name.text);
    }

    override void visit(const Token token) {
        fmt.write(token.text);
    }

}