module formatwriter;

import std.array;
import std.algorithm;
import std.range;
import std.stdio;


class FormatWriter
{
    private File sink;
    private int depth = 0;
    private bool atLineStart = true;

    enum INDENT = "  ";


    this(File sink)
    {
        this.sink = sink;
    }

    // Indented write
    public void write(T...)(T args)
    {
        if (atLineStart) {
            sink.write(INDENT.repeat(depth).join);
            atLineStart = false;
        }

        static foreach(arg; args)  
        {
            static if (is(typeof(arg) == string)) {
                if (arg.canFind('\n'))
                    atLineStart = true;
            }
            sink.write(arg);
        }
    }

    // Indented write
    public void writeln(T...)(T args)
    {
        this.write(args);
        sink.writeln();
        atLineStart = true;
    }


    void indent()
    {
        depth++;
        atLineStart = true;
    }

    void dedent()
    {
        depth--;
    }
}
