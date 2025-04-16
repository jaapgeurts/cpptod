module convert;

import std.stdio;
import std.file;
import std.path;
import std.string;

import parser;
import translate;

void startConversion(string[] filenames) {

    string filename = filenames[0];

    // TODO: use readText instead?
    string inText = cast(string) read(filename);
    // TODO: replace macros with user entered values
    inText = inText
        .replace("FL_EXPORT", "")
        .replace("FL_OVERRIDE", "override");

    try {
        Tree tree = parseCpp(inText, filename);

        // printTree(stdout, preprocTree, verbose);
        // printTree(stdout, tree, verbose);

        // convert input filename to output filename
        string outFilename = stripExtension(filename) ~ ".d";
        File output = File(outFilename, "w");

        transpileFile(tree, output);
    }
    catch (Exception e) {
        stderr.writeln(e);
        return;
    }

}
