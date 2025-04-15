import dparsergen.core.dynamictree;
import dparsergen.core.grammarinfo;
import dparsergen.core.location;
import dparsergen.core.nodetype;
import dparsergen.core.utils;
static import grammarcpp;
static import grammarcpp_lexer;
// static import grammarcpreproc;
// static import grammarcpreproc_lexer;
import std.algorithm;
import std.array;
import std.conv;
import std.exception;
import std.file;
import std.stdio;
import std.path;

import convert;

/**
Custom type, which stores the filename in addition to the position in the file.
*/
struct Location
{
    LocationAll loc;
    string filename;
    alias LocationDiff = LocationAll.LocationDiff;

    this(LocationAll loc, string filename = "")
    {
        this.loc = loc;
        this.filename = filename;
    }

    auto bytePos() const
    {
        return loc.bytePos;
    }

    auto line() const
    {
        return loc.line;
    }

    auto offset() const
    {
        return loc.offset;
    }

    enum invalid = Location(LocationAll.invalid);

    bool isValid() const
    {
        return loc.isValid;
    }

    LocationDiff opBinary(string op)(const Location rhs) const if (op == "-")
    {
        if (rhs.filename == filename)
            return loc - rhs.loc;
        else
            return LocationDiff.invalid;
    }

    Location opBinary(string op)(const LocationDiff rhs) const if (op == "+")
    {
        if (this == invalid || rhs == LocationDiff.invalid)
            return invalid;
        else
            return Location(loc + rhs, filename);
    }

    void opOpAssign(string op)(const LocationDiff rhs) if (op == "+")
    {
        loc += rhs;
    }

    int opCmp(const Location rhs) const
    {
        if (filename < rhs.filename)
            return -1;
        if (filename > rhs.filename)
            return 1;
        return loc.opCmp(rhs.loc);
    }

    string toPrettyString() const
    {
        return text(filename, ":", line + 1, ":", offset + 1);
    }
}

alias Tree = DynamicParseTree!(Location, LocationRangeStartLength);
alias CreatorCpp = DynamicParseTreeCreator!(grammarcpp, Location, LocationRangeStartLength);

int main(string[] args)
{
    string filename;
    bool verbose;
    foreach (arg; args[1 .. $])
    {
        if (arg.startsWith("-"))
        {
            if (arg == "-v")
                verbose = true;
            else if (arg == "-h")
            {
                filename = "";
                break;
            }
            else
            {
                stderr.writeln("Unknown option ", arg);
            }
        }
        else
        {
            if (filename.length)
            {
                stderr.writeln("Too many arguments");
                return 1;
            }
            filename = arg;
        }
    }
    if (filename.length == 0)
    {
        stderr.writeln("Usage: testcpp [OPTIONS] filename.cpp");
        stderr.writeln("    -v Verbose output");
        stderr.writeln("    -h Show this help");
        return 0;
    }

    string inText = cast(string) read(filename);


    // Parse C++ code
    Tree tree;
    try
    {
        auto creator = new CreatorCpp;


        tree = grammarcpp.parse!(CreatorCpp,
            grammarcpp_lexer.Lexer!Location)(inText,
                creator, Location(LocationAll.init, filename)
            );
        assert(tree.inputLength.bytePos <= inText.length);
    }
    catch (Exception e)
    {
        stderr.writeln(e);
        return 1;
    }

    // printTree(stdout, preprocTree, verbose);
    // printTree(stdout, tree, verbose);

    // convert input filename to output filename
    string outFilename = stripExtension(filename) ~ ".d";
    File output = File(outFilename, "w");


    transpileFile(tree,output);

    return 0;
}


