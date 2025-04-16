import std.algorithm;
import std.array;
import std.conv;
import std.exception;
import std.file;
import std.stdio;
import std.path;


import convert;


int main(string[] args) {
    string filename;
    bool verbose;
    foreach (arg; args[1 .. $]) {
        if (arg.startsWith("-")) {
            if (arg == "-v")
                verbose = true;
            else if (arg == "-h") {
                filename = "";
                break;
            }
            else {
                stderr.writeln("Unknown option ", arg);
            }
        }
        else {
            if (filename.length) {
                stderr.writeln("Too many arguments");
                return 1;
            }
            filename = arg;
        }
    }
    if (filename.length == 0) {
        stderr.writeln("Usage: testcpp [OPTIONS] filename.cpp");
        stderr.writeln("    -v Verbose output");
        stderr.writeln("    -h Show this help");
        return 0;
    }

    startConversion([filename]);

    return 0;
}
