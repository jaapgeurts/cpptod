import std.stdio;
import std.getopt;
import std.file;
import std.algorithm;
import std.string;
import std.path;
import std.ascii : toLower;

import dparse.ast;
import dparse.astprinter;

import parser;
import translate;
import postprocess;
import dsourceprinter;

bool isMerge = false;
bool isFormat = false;
string inputFilenameC;
string inputFilenameH;
string outputFilename;

int main(string[] args) {

    try {

        auto argumentInfo = getopt(
            args,
            std.getopt.config.passThrough,
            "merge|m", "Merges a headerfile and source. Useful when merging a class definition and source file. Left over declarations are placed in the output file. The outfile filename is inferred from the header file name unless explicitly supplied. You must specify exactly two input files for this to work."
                .wrap(80, "\t", "\t\t"), &isMerge,
                "output|o", "Output file name. If not specified, the output file name is inferred from the input file name."
                .wrap(80, "\t", "\t\t"), &outputFilename,
                "format|f", "Format the output file using dfmt."
                .wrap(80, "\t", "\t\t"), &isFormat,
        );
        if (argumentInfo.helpWanted) {
            defaultGetoptPrinter("CppToD - This program converts C/C++ code to D code. You can convert single files or merge a header and source into a single D output file.\n", argumentInfo
                    .options);
            return 0;
        }
    }
    catch (Exception e) {
        stderr.writeln("Error parsing command line arguments: ", e.msg);
        return 1;
    }

    // check if all required arguments are present 
    // and take the first two arguments as input file names
    if (isMerge) {
        if (args.length != 3) {
            stderr.writeln("Error: You must specify exactly two input files for merging.");
            return 2;
        }
        // test which file is the header file
        if (args[1][$ - 1].toLower == 'h') {
            inputFilenameH = args[1];
            inputFilenameC = args[2];
        }
        else {
            inputFilenameH = args[2];
            inputFilenameC = args[1];
        }

    }
    else {
        if (args.length != 2) {
            stderr.writeln("Error: You must specify at one input file. Multiple files are not supported yet (workaround: invoke multiple times).");
            return 3;
        }
        inputFilenameC = args[1];
    }

    // check if the input files exist
    if (!exists(inputFilenameC)) {
        stderr.writeln("Error: Input file does not exist: ", inputFilenameC);
        return 4;
    }
    if (isMerge && !exists(inputFilenameH)) {
        stderr.writeln("Error: Input file does not exist: ", inputFilenameH);
        return 5;
    }

    if (outputFilename.length == 0) {
        if (isMerge) {
            outputFilename = stripExtension(inputFilenameH) ~ ".d";
        }
        else {
            outputFilename = stripExtension(inputFilenameC) ~ ".d";
        }
    }

    writeln("Processing Source:", inputFilenameC, " and Header:", inputFilenameH, " to ", outputFilename);

    startConversion(inputFilenameC, inputFilenameH, outputFilename);

    return 0;
}

void startConversion(string filenameC, string filenameH, string outFilename) {

    // read the input file
    string inTextC = readText(filenameC);
    string inTextH;
    if (filenameH.length > 0) {
        inTextH = readText(filenameH);
    }

    // Replace macros
    inTextC = inTextC.replaceMacros();
    if (inTextH.length > 0) {
        inTextH = inTextH.replaceMacros();
    }

    try {
        Tree treeC = parseCpp(inTextC, filenameC);
        Tree treeH;

        if (isMerge) {
            treeH = parseCpp(inTextH, filenameH);
        }

        // convert both trees to D
        Module moduleC = transpileFile(treeC);
        Module moduleH;
        if (isMerge) {
            moduleH = transpileFile(treeH);

            // merge the two trees
            moduleC = mergeTrees(moduleC, moduleH);
        }

        // printTree(stdout, preprocTree, verbose);
        // printTree(stdout, tree, verbose);

        // convert input filename to output filename
        File output = File(outFilename, "w");

        auto xmlprinter = new XMLPrinter();
        File newoutput = File("newtree.xml", "w");
        xmlprinter.output = newoutput;
        moduleC.accept(xmlprinter);

        // print the tree. 
        // TODO: replace with a dfmt printer
        DSourcePrinter printer = new DSourcePrinter(output);
        moduleC.accept(printer);
        output.close();

        // if (isFormat) {
        //     // format the output file using dfmt
        //     string cmd = "dfmt -i " ~ outFilename;
        //     writeln("Formatting output file with dfmt: ", cmd);
        //     auto result = process(cmd);
        //     if (result.status != 0) {
        //         stderr.writeln("Error formatting output file: ", result.output);
        //     }
        // }

    }
    catch (Exception e) {
        stderr.writeln(e);
        return;
    }

}

string replaceMacros(string text) {
    return text.replace("FL_EXPORT", "")
        .replace("FL_OVERRIDE", "override");
}
