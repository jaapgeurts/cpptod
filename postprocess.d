module postprocess;

import std.stdio;
import std.algorithm.searching;
import std.algorithm.mutation;
import std.array;

import dparse.ast;
import dparse.lexer;

// conversion of this class constructor name to 'this' is done in the translator

FunctionBody findBodyForFunction(Module mod, const FunctionDeclaration hdrFunc)
{
// writeln("Searching function: ", hdrFunc.name.text);
    outer: foreach (decl; mod.declarations)
    {
        if (const FunctionDeclaration srcFunc = decl.functionDeclaration)
        {
            // Compare the function names
            if (srcFunc.name.text == hdrFunc.name.text)
            {
                // And their parameters.
                if (srcFunc.parameters is null && hdrFunc.parameters is null)
                {
                    return cast(FunctionBody) srcFunc.functionBody;
                }
                if (srcFunc.parameters is null || hdrFunc.parameters is null)
                {
                    continue;
                }
                if (srcFunc.parameters.parameters.length != hdrFunc.parameters.parameters.length)
                {
                    continue;
                }

                for (int i = 0; i < srcFunc.parameters.parameters.length; i++)
                {
                    if (
                        srcFunc.parameters.parameters[i].type != hdrFunc
                        .parameters.parameters[i].type)
                    {
                        continue outer;
                    }
                }
                return cast(FunctionBody) srcFunc.functionBody;
            }
        }
    }
    return null;
}

void removeFunction(Module tree, const FunctionDeclaration hdrFunc)
{
outer:
    // remove the function from the module
    for (int i = 0; i < tree.declarations.length; i++)
    {
        if (const FunctionDeclaration srcFunc = tree.declarations[i].functionDeclaration)
        {
            if (srcFunc.name.text == hdrFunc.name.text)
            {
                if (srcFunc.parameters is null && hdrFunc.parameters is null)
                {
                    tree.declarations = tree.declarations[0 .. i] ~ tree.declarations[i + 1 .. $];
                    return;
                }
                if (srcFunc.parameters is null || hdrFunc.parameters is null)
                {
                    continue;
                }
                if (srcFunc.parameters.parameters.length != hdrFunc.parameters.parameters.length)
                {
                    continue;
                }
                for (int j = 0; j < srcFunc.parameters.parameters.length; j++)
                {
                    if (
                        srcFunc.parameters.parameters[j].type != hdrFunc
                        .parameters.parameters[j].type)
                    {
                        continue outer;
                    }
                }
                tree.declarations = tree.declarations[0 .. i] ~ tree.declarations[i + 1 .. $];
                return;
            }
        }
    }
    writeln("Function ", hdrFunc.name.text, " not found in tree for removal");
}

// Merges treeC into treeH, removing all declarations from treeC that are also in treeH
Module mergeTrees(Module treeC, Module treeH)
{

    // First find all function declarations without a body at the top level
    // of header file (treeH) and attach the function body from treeC to them
    foreach (decl; treeH.declarations)
    {
        if (const FunctionDeclaration hdrFunc = decl.functionDeclaration)
        {
            if (hdrFunc.functionBody is null)
            {
                // find this function in treeC
                auto funcBody = treeC.findBodyForFunction(hdrFunc);
                if (funcBody !is null)
                {
                    cast(FunctionBody) hdrFunc.functionBody = funcBody;
                    treeC.removeFunction(hdrFunc);
                }
                else
                {
                    // TODO: bring in the name
                    writeln("Function ", hdrFunc.name.text, " not found in treeC");
                }
            }
        }
    }

    // find all the functions in the classes without bodies
    foreach (decl; treeH.declarations)
    {
        if (const ClassDeclaration classDecl = decl.classDeclaration)
        {
            string className = classDecl.name.text;
            // find all the functions in the classes without bodies
            foreach (memberDecl; classDecl.structBody.declarations)
            {
                if (const FunctionDeclaration hdrFunc = memberDecl.functionDeclaration)
                {
                    if (hdrFunc.functionBody is null)
                    {
                        string qualifiedName = className ~ "." ~ hdrFunc.name.text;
                        // find the function in treeC
                        auto tFunc = new FunctionDeclaration();
                        tFunc.name = hdrFunc.name;
                        tFunc.name.text = qualifiedName;
                        tFunc.parameters = cast(Parameters) hdrFunc.parameters;
                        auto funcBody = treeC.findBodyForFunction(tFunc);
                        if (funcBody !is null)
                        {
                            cast(FunctionBody) hdrFunc.functionBody = funcBody;
                            treeC.removeFunction(tFunc);
                        }
                        else
                        {
                            writeln("Member function ", qualifiedName, " not found in treeC");
                        }
                    }
                }
            }
        }
    }

    // collect left over declarations in treeC and insert them into treeH
    foreach (decl; treeC.declarations)
    {
        // only insert variables and functions
        if (decl.functionDeclaration !is null || decl.variableDeclaration !is null)
        {
            cast(Declaration[]) treeH.declarations ~= decl;
        }

    }
    return treeH;

}

void replaceReservedKeywords(Module tree)
{
    // find all function and variable names

}

class ConstCharPtrReplacer : ASTVisitor
{
    alias visit = ASTVisitor.visit;

    override void visit(const FunctionDeclaration decl)
    {
        FunctionDeclaration decl1 = cast(FunctionDeclaration)decl;
        if (decl1.returnType
            && decl1.returnType.type2.builtinType == tok!"char" ) {
            long posStar = decl1.returnType.typeSuffixes.countUntil!(s => s.star == tok!"*");
            if (posStar == -1)
                return;
            long posConst = decl1.attributes.countUntil!(a => a.attribute == tok!"const");
            if (posConst == -1)
                return;

            // writeln("Found: ", decl1.name);
            decl1.returnType.typeSuffixes = decl1.returnType.typeSuffixes[0..posStar] ~ decl1.returnType.typeSuffixes[posStar+1..$];
            decl1.returnType.type2.builtinType = 0;
            decl1.returnType.type2.typeIdentifierPart = new TypeIdentifierPart();
            decl1.returnType.type2.typeIdentifierPart.identifierOrTemplateInstance = new IdentifierOrTemplateInstance();
            decl1.returnType.type2.typeIdentifierPart.identifierOrTemplateInstance.identifier = Token(tok!"identifier","string",0,0,0);
            decl1.attributes = decl1.attributes[0..posConst] ~ decl1.attributes[posConst+1..$];
        }
        decl1.accept(this);
    }

    override void visit(const Parameter param) {
        Parameter param1 = cast(Parameter)param;

        if (param1.type.type2.builtinType == tok!"char") {
            long posStar = param1.cstyle.countUntil!(s=>s.star == tok!"*");
            if (posStar == -1)
                return;
            long posConst = param1.parameterAttributes.countUntil!(a=>a.idType == tok!"const");
            if (posConst == -1)
                return;
            param1.cstyle = param1.cstyle[0..posStar] ~ param1.cstyle[posStar+1..$];

            param1.type.type2.builtinType = 0;
            param1.type.type2.typeIdentifierPart = new TypeIdentifierPart();
            param1.type.type2.typeIdentifierPart.identifierOrTemplateInstance = new IdentifierOrTemplateInstance();
            param1.type.type2.typeIdentifierPart.identifierOrTemplateInstance.identifier = Token(tok!"identifier","string",0,0,0);

            param1.parameterAttributes = param1.parameterAttributes[0..posConst] ~ param1.parameterAttributes[posConst+1..$];
        }
    }
}

void replaceConstCharPtr(Module tree)
{
  ConstCharPtrReplacer replacer = new ConstCharPtrReplacer();
  tree.accept(replacer);
}
