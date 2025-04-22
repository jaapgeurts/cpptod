module postprocess;

import std.stdio;

import dparse.ast;

// conversion of this class constructor name to 'this' is done in the translator

FunctionBody findBodyForFunction(Module mod, const FunctionDeclaration hdrFunc) {
outer:
    foreach (decl; mod.declarations) {
        if (const FunctionDeclaration srcFunc = decl.functionDeclaration) {
            // TODO: now only compares the name, but we should compare the full signature
            if (srcFunc.name.text == hdrFunc.name.text) {
                if (srcFunc.parameters is null && hdrFunc.parameters is null) {
                    return cast(FunctionBody) srcFunc.functionBody;
                }
                if (srcFunc.parameters is null || hdrFunc.parameters is null) {
                    continue;
                }
                if (srcFunc.parameters.parameters.length != hdrFunc.parameters.parameters.length) {
                    continue;
                }

                for (int i = 0; i < srcFunc.parameters.parameters.length; i++) {
                    if (
                        srcFunc.parameters.parameters[i].type != hdrFunc
                        .parameters.parameters[i].type) {
                        continue outer;
                    }
                }
                return cast(FunctionBody) srcFunc.functionBody;
            }
        }
    }
    return null;
}

void removeFunction(Module tree, const FunctionDeclaration hdrFunc) {
outer:
    // remove the function from the module
    for (int i = 0; i < tree.declarations.length; i++) {
        if (const FunctionDeclaration srcFunc = tree.declarations[i].functionDeclaration) {
            if (srcFunc.name.text == hdrFunc.name.text) {
                if (srcFunc.parameters is null && hdrFunc.parameters is null) {
                    tree.declarations = tree.declarations[0 .. i] ~ tree.declarations[i + 1 .. $];
                    return;
                }
                if (srcFunc.parameters is null || hdrFunc.parameters is null) {
                    continue;
                }
                if (srcFunc.parameters.parameters.length != hdrFunc.parameters.parameters.length) {
                    continue;
                }
                for (int j = 0; j < srcFunc.parameters.parameters.length; j++) {
                    if (
                        srcFunc.parameters.parameters[j].type != hdrFunc
                        .parameters.parameters[j].type) {
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
Module mergeTrees(Module treeC, Module treeH) {

    // First find all function declarations without a body at the top level
    // of header file (treeH) and attach the function body from treeC to them
    foreach (decl; treeH.declarations) {
        if (const FunctionDeclaration hdrFunc = decl.functionDeclaration) {
            if (hdrFunc.functionBody is null) {
                // find this function in treeC
                auto funcBody = treeC.findBodyForFunction(hdrFunc);
                if (funcBody !is null) {
                    cast(FunctionBody) hdrFunc.functionBody = funcBody;
                    treeC.removeFunction(hdrFunc);
                }
                else {
                    // TODO: bring in the name
                    writeln("Function ", hdrFunc.name.text, " not found in treeC");
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
                if (const FunctionDeclaration hdrFunc = memberDecl.functionDeclaration) {
                    if (hdrFunc.functionBody is null) {
                        string qualifiedName = className ~ "." ~ hdrFunc.name.text;
                        // find the function in treeC
                        auto tFunc = new FunctionDeclaration();
                        tFunc.name = hdrFunc.name;
                        tFunc.name.text = qualifiedName;
                        tFunc.parameters = cast(Parameters) hdrFunc.parameters;
                        auto funcBody = treeC.findBodyForFunction(tFunc);
                        if (funcBody !is null) {
                            cast(FunctionBody) hdrFunc.functionBody = funcBody;
                            treeC.removeFunction(tFunc);
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
