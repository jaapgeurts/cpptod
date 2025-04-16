module postprocess;

import std.stdio;

import dparse.ast;

FunctionBody findBodyForFunction(Module mod, string name) {
    foreach (decl; mod.declarations) {
        if (const FunctionDeclaration func = decl.functionDeclaration) {
            // TODO: now only compares the name, but we should compare the full signature
            if (func.name.text == name) {
                return cast(FunctionBody) func.functionBody;
            }
        }
    }
    return null;
}

void removeFunction(Module tree, string name) {
    // remove the function from the module
    for (int i = 0; i < tree.declarations.length; i++) {
        if (const FunctionDeclaration func = tree.declarations[i].functionDeclaration) {
            if (func.name.text == name) {
                tree.declarations = tree.declarations[0 .. i] ~ tree.declarations[i + 1 .. $];
                return;
            }
        }
    }
    writeln("Function ", name, " not found in tree for removal");
}

// Merges treeC into treeH, removing all declarations from treeC that are also in treeH
Module mergeTrees(Module treeC, Module treeH) {

    // First find all function declarations without a body at the top level of treeH
    foreach (decl; treeH.declarations) {
        if (const FunctionDeclaration func = decl.functionDeclaration) {
            if (func.functionBody is null) {
                // find this function in treeC
                auto funcBody = treeC.findBodyForFunction(func.name.text);
                if (funcBody !is null) {
                    cast(FunctionBody) func.functionBody = funcBody;
                    treeC.removeFunction(func.name.text);
                }
                else {
                    // TODO: bring in the name
                    writeln("Function ", func.name.text, " not found in treeC");
                }
            }
        }
    }

    // find all the functions in the classes without bodies
    foreach (decl; treeH.declarations) {
        if (const ClassDeclaration classDecl = decl.classDeclaration) {
            string className = classDecl.name.text;
            // find all the functions in the classes without bodies
            foreach (memberDecl; classDecl.structBody.declarations) {
                if (const FunctionDeclaration func = memberDecl.functionDeclaration) {
                    if (func.functionBody is null) {
                        string qualifiedName = className ~ "." ~ func.name.text;
                        // find the function in treeC
                        auto funcBody = treeC.findBodyForFunction(qualifiedName);
                        if (funcBody !is null) {
                            cast(FunctionBody) func.functionBody = funcBody;
                            treeC.removeFunction(qualifiedName);
                        }
                        else {
                            writeln("Member function ", qualifiedName, " not found in treeC");
                        }
                    }
                }
            }
        }
    }

    // collect left over declarations in treeC and insert them into treeH
    foreach (decl; treeC.declarations) {
        // only insert variables and functions
        if (decl.functionDeclaration !is null || decl.variableDeclaration !is null) {
            cast(Declaration[]) treeH.declarations ~= decl;
        }

    }
    return treeH;

}
