// Generated with DParserGen.
module grammarcpreproc_lexer;
import dparsergen.core.grammarinfo;
import dparsergen.core.parseexception;
import dparsergen.core.utils;
import std.conv;
import std.string;
import std.typecons;

enum SymbolID startTokenID = 11000;
static assert(allNonterminalTokens.length < SymbolID.max - startTokenID);
enum SymbolID endTokenID = startTokenID + allNonterminalTokens.length;

SymbolID getTokenID(string tok)
{
    foreach (i; 0 .. allNonterminalTokens.length)
        if (allNonterminalTokens[i].name == tok)
            return cast(SymbolID)(startTokenID + i);
    return SymbolID.max;
}

struct Lexer(Location, bool includeIgnoredTokens = false)
{
    alias LocationDiff = typeof(Location.init - Location.init);
    string input;
    this(string input, Location startLocation = Location.init)
    {
        this.input = input;
        this.front.currentLocation = startLocation;
        popFront;
    }

    template tokenID(string tok) if (getTokenID(tok) != SymbolID.max)
    {
        enum tokenID = getTokenID(tok);
    }
    string tokenName(size_t id)
    {
        return allNonterminalTokens[id - startTokenID].name;
    }

    static struct Front
    {
        string content;
        SymbolID symbol;
        Location currentLocation;
        static if (includeIgnoredTokens)
            bool isIgnoreToken;

        Location currentTokenEnd()
        {
            return currentLocation + LocationDiff.fromStr(content);
        }
    }

    Front front;
    bool empty;

    // InContextOnly: HeaderNameSys
    bool allowTokenId8;
    bool allowToken(string tok)() if (tok == "HeaderNameSys")
    {
        return allowTokenId8;
    }
    void allowToken(string tok)(bool b) if (tok == "HeaderNameSys")
    {
        allowTokenId8 = b;
    }

    void popFront()
    {
        input = input[front.content.length .. $];
        front.currentLocation = front.currentLocation + LocationDiff.fromStr(front.content);

        popFrontImpl();
    }

    void popFrontImpl()
    {
        size_t foundLength;
        SymbolID foundSymbol = SymbolID.max;
        bool foundIsIgnore;

        string inputCopy = input;

        size_t storedStart = size_t.max;
        string storedString;

        goto start;

    state0:
        // ("#") ("(") (")") (",") (BlockComment) (CharacterLiteral) (EscapedNewline) (HeaderNameSys) (Identifier) (LineComment) (NL) (Operator) (PpNumber) (StringLiteral) (WS)
        // path:
    start:
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[\\t-\\n\\f-\\r -_a-~]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\n')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state95;
                }
                else if (currentChar == '\r')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state94;
                }
                else if (currentChar == '\"')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state28;
                }
                else if (currentChar == '#')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state1;
                }
                else if (currentChar == '%')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state98;
                }
                else if (currentChar == '&')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state119;
                }
                else if (currentChar == '\'')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state13;
                }
                else if (currentChar == '(')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state3;
                }
                else if (currentChar == ')')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state4;
                }
                else if (currentChar == '+')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state115;
                }
                else if (currentChar == ',')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state5;
                }
                else if (currentChar == '-')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state116;
                }
                else if (currentChar == '.')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state101;
                }
                else if (currentChar == '/')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state6;
                }
                else if (currentChar == ':')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state97;
                }
                else if (currentChar == '<')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state63;
                }
                else if (currentChar == '>')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state121;
                }
                else if (currentChar == 'R')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state40;
                }
                else if (currentChar == '\\')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state60;
                }
                else if (currentChar == 'a')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state80;
                }
                else if (currentChar == 'b')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state82;
                }
                else if (currentChar == 'c')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state89;
                }
                else if (currentChar == 'd')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state75;
                }
                else if (currentChar == 'n')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state68;
                }
                else if (currentChar == 'o')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state88;
                }
                else if (currentChar == 'u')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state26;
                }
                else if (currentChar == 'x')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state93;
                }
                else if (currentChar == '|')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state120;
                }
                else if ((currentChar >= '0' && currentChar <= '9'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state103;
                }
                else if (currentChar == 'L' || currentChar == 'U')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state59;
                }
                else if (currentChar == '\t' || currentChar == '\f' || currentChar == ' ')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state96;
                }
                else if (!((currentChar >= '!' && currentChar <= '_') || (currentChar >= 'e' && currentChar <= '~')))
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[\\t-\\n\\f-\\r -_a-~]", inputCopy.ptr - input.ptr);
                }
                else if (currentChar == '$' || (currentChar >= 'A' && currentChar <= 'Z') || (currentChar >= '_' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else if ((currentChar >= '!' && currentChar <= '*') || currentChar == '=' || currentChar == '^')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state118;
                }
                else
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state2;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[\\t-\\n\\f-\\r -_a-~]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state1:
        // "#" (Operator)
        // path: [#]
        {
            if (inputCopy.length == 0)
                goto endstate1;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '#')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"\"#\"";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state2;
                }
                else
                {
                    goto endstate1;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate1;
                }
            }
        }
        endstate1:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"\"#\"";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state2:
        // Operator
        // path: [;?-@\[\]{}-~]
        {
            if (inputCopy.length == 0)
                goto endstate2;
            goto endstate2;
        }
        endstate2:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Operator";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state3:
        // "("
        // path: [(]
        {
            if (inputCopy.length == 0)
                goto endstate3;
            goto endstate3;
        }
        endstate3:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"\"(\"";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state4:
        // ")"
        // path: [)]
        {
            if (inputCopy.length == 0)
                goto endstate4;
            goto endstate4;
        }
        endstate4:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"\")\"";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state5:
        // ","
        // path: [,]
        {
            if (inputCopy.length == 0)
                goto endstate5;
            goto endstate5;
        }
        endstate5:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"\",\"";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state6:
        // Operator (BlockComment) (LineComment)
        // path: [/]
        {
            if (inputCopy.length == 0)
                goto endstate6;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '*')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Operator";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state7;
                }
                else if (currentChar == '/')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Operator";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state12;
                }
                else if (currentChar == '=')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state2;
                }
                else if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Operator";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state10;
                }
                else
                {
                    goto endstate6;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate6;
                }
            }
        }
        endstate6:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Operator";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state7:
        // (BlockComment)
        // path: [/] [*]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[^]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '*')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state8;
                }
                else
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state7;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    inputCopy = inputCopyNext;
                    goto state7;
                }
            }
        }

    state8:
        // (BlockComment)
        // path: [/] [*] [*]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[^]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '*')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state8;
                }
                else if (currentChar == '/')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state9;
                }
                else
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state7;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    inputCopy = inputCopyNext;
                    goto state7;
                }
            }
        }

    state9:
        // BlockComment
        // path: [/] [*] [*] [/]
        {
            if (inputCopy.length == 0)
                goto endstate9;
            goto endstate9;
        }
        endstate9:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"BlockComment";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state10:
        // (BlockComment)
        // path: [/] [\\]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[\\n]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\n')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state11;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[\\n]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[\\n]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state11:
        // (BlockComment)
        // path: [/] [\\] [\n]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[*]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '*')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state7;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[*]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[*]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state12:
        // LineComment
        // path: [/] [/]
        {
            if (inputCopy.length == 0)
                goto endstate12;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\n' || currentChar == '\r')
                {
                    goto endstate12;
                }

                {
                    inputCopy = inputCopy[1 .. $];
                    goto state12;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    inputCopy = inputCopyNext;
                    goto state12;
                }
            }
        }
        endstate12:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"LineComment";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state13:
        // (CharacterLiteral)
        // path: [\']
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[^\\n\\\']", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state16;
                }
                else if (currentChar == '\n' || currentChar == '\'')
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[^\\n\\\']", inputCopy.ptr - input.ptr);
                }
                else
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state14;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    inputCopy = inputCopyNext;
                    goto state14;
                }
            }
        }

    state14:
        // (CharacterLiteral)
        // path: [\'] [^\n\'\\]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[^\\n]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\n')
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[^\\n]", inputCopy.ptr - input.ptr);
                }
                if (currentChar == '\'')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state15;
                }
                else if (currentChar == '\\')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state16;
                }
                else
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state14;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    inputCopy = inputCopyNext;
                    goto state14;
                }
            }
        }

    state15:
        // CharacterLiteral
        // path: [\'] [^\n\'\\] [\']
        {
            if (inputCopy.length == 0)
                goto endstate15;
            goto endstate15;
        }
        endstate15:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"CharacterLiteral";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state16:
        // (CharacterLiteral)
        // path: [\'] [\\]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[\\n\\r\\\"\\\'0-7?U\\\\a-bfnrt-vx]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\r')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state25;
                }
                else if (currentChar == 'U')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state21;
                }
                else if (currentChar == 'u')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state18;
                }
                else if (currentChar == 'x')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state17;
                }
                else if (currentChar == '\n' || currentChar == '\"' || currentChar == '\'' || (currentChar >= '0' && currentChar <= '7') || currentChar == '?' || currentChar == '\\' || (currentChar >= 'a' && currentChar <= 'b') || currentChar == 'f' || currentChar == 'n' || currentChar == 'r' || (currentChar >= 't' && currentChar <= 'v'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state14;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[\\n\\r\\\"\\\'0-7?U\\\\a-bfnrt-vx]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[\\n\\r\\\"\\\'0-7?U\\\\a-bfnrt-vx]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state17:
        // (CharacterLiteral)
        // path: [\'] [\\] [x]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state14;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state18:
        // (CharacterLiteral)
        // path: [\'] [\\] [u]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state19;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state19:
        // (CharacterLiteral)
        // path: [\'] [\\] [u] [0-9A-Fa-f]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state20;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state20:
        // (CharacterLiteral)
        // path: [\'] [\\] [u] [0-9A-Fa-f] [0-9A-Fa-f]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state17;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state21:
        // (CharacterLiteral)
        // path: [\'] [\\] [U]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state22;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state22:
        // (CharacterLiteral)
        // path: [\'] [\\] [U] [0-9A-Fa-f]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state23;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state23:
        // (CharacterLiteral)
        // path: [\'] [\\] [U] [0-9A-Fa-f] [0-9A-Fa-f]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state24;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state24:
        // (CharacterLiteral)
        // path: [\'] [\\] [U] [0-9A-Fa-f] [0-9A-Fa-f] [0-9A-Fa-f]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state18;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state25:
        // (CharacterLiteral)
        // path: [\'] [\\] [\r]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[\\n]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\n')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state14;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[\\n]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[\\n]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state26:
        // Identifier (CharacterLiteral) (StringLiteral)
        // path: [u]
        {
            if (inputCopy.length == 0)
                goto endstate26;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\"')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state28;
                }
                else if (currentChar == '\'')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state13;
                }
                else if (currentChar == '8')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state27;
                }
                else if (currentChar == 'R')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state40;
                }
                else if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate26;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate26;
                }
            }
        }
        endstate26:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state27:
        // Identifier (StringLiteral)
        // path: [u] [8]
        {
            if (inputCopy.length == 0)
                goto endstate27;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\"')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state28;
                }
                else if (currentChar == 'R')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state40;
                }
                else if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate27;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate27;
                }
            }
        }
        endstate27:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state28:
        // (StringLiteral)
        // path: [\"]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[^\\n]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\n')
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[^\\n]", inputCopy.ptr - input.ptr);
                }
                if (currentChar == '\"')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state30;
                }
                else if (currentChar == '\\')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state29;
                }
                else
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state28;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    inputCopy = inputCopyNext;
                    goto state28;
                }
            }
        }

    state29:
        // (StringLiteral)
        // path: [\"] [\\]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[\\n\\r\\\"\\\'0-7?U\\\\a-bfnrt-vx]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\r')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state39;
                }
                else if (currentChar == 'U')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state35;
                }
                else if (currentChar == 'u')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state32;
                }
                else if (currentChar == 'x')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state31;
                }
                else if (currentChar == '\n' || currentChar == '\"' || currentChar == '\'' || (currentChar >= '0' && currentChar <= '7') || currentChar == '?' || currentChar == '\\' || (currentChar >= 'a' && currentChar <= 'b') || currentChar == 'f' || currentChar == 'n' || currentChar == 'r' || (currentChar >= 't' && currentChar <= 'v'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state28;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[\\n\\r\\\"\\\'0-7?U\\\\a-bfnrt-vx]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[\\n\\r\\\"\\\'0-7?U\\\\a-bfnrt-vx]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state30:
        // StringLiteral
        // path: [\"] [\"]
        {
            if (inputCopy.length == 0)
                goto endstate30;
            goto endstate30;
        }
        endstate30:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"StringLiteral";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state31:
        // (StringLiteral)
        // path: [\"] [\\] [x]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state28;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state32:
        // (StringLiteral)
        // path: [\"] [\\] [u]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state33;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state33:
        // (StringLiteral)
        // path: [\"] [\\] [u] [0-9A-Fa-f]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state34;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state34:
        // (StringLiteral)
        // path: [\"] [\\] [u] [0-9A-Fa-f] [0-9A-Fa-f]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state31;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state35:
        // (StringLiteral)
        // path: [\"] [\\] [U]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state36;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state36:
        // (StringLiteral)
        // path: [\"] [\\] [U] [0-9A-Fa-f]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state37;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state37:
        // (StringLiteral)
        // path: [\"] [\\] [U] [0-9A-Fa-f] [0-9A-Fa-f]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state38;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state38:
        // (StringLiteral)
        // path: [\"] [\\] [U] [0-9A-Fa-f] [0-9A-Fa-f] [0-9A-Fa-f]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state32;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state39:
        // (StringLiteral)
        // path: [\"] [\\] [\r]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[\\n]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\n')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state28;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[\\n]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[\\n]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state40:
        // Identifier (StringLiteral)
        // path: [R]
        {
            if (inputCopy.length == 0)
                goto endstate40;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\"')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state41;
                }
                else if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate40;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate40;
                }
            }
        }
        endstate40:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state41:
        // (StringLiteral)
        // path: [R] [\"]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[^\\t-\\n\\f-\\r )\\\\]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '(')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state42;
                }
                else if ((currentChar >= '\t' && currentChar <= '\n') || (currentChar >= '\f' && currentChar <= '\r') || currentChar == ' ' || currentChar == ')' || currentChar == '\\')
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[^\\t-\\n\\f-\\r )\\\\]", inputCopy.ptr - input.ptr);
                }
                else
                {
                    assert(storedStart == size_t.max);
                    storedStart = inputCopy.ptr - input.ptr;
                    inputCopy = inputCopy[1 .. $];
                    goto state44;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    assert(storedStart == size_t.max);
                    storedStart = inputCopy.ptr - input.ptr;
                    inputCopy = inputCopyNext;
                    goto state44;
                }
            }
        }

    state42:
        // (StringLiteral)
        // path: [R] [\"] [(]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[^]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == ')')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state43;
                }
                else
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state42;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    inputCopy = inputCopyNext;
                    goto state42;
                }
            }
        }

    state43:
        // (StringLiteral)
        // path: [R] [\"] [(] [)]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[^]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\"')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state30;
                }
                else if (currentChar == ')')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state43;
                }
                else
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state42;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    inputCopy = inputCopyNext;
                    goto state42;
                }
            }
        }

    state44:
        // (StringLiteral)
        // path: [R] [\"] [^\t-\n\f-\r (-)\\]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[^\\t-\\n\\f-\\r )\\\\]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '(')
                {
                    assert(storedStart != size_t.max);
                    storedString = input[storedStart .. inputCopy.ptr - input.ptr];
                    storedStart = size_t.max;
                    inputCopy = inputCopy[1 .. $];
                    goto state45;
                }
                else if ((currentChar >= '\t' && currentChar <= '\n') || (currentChar >= '\f' && currentChar <= '\r') || currentChar == ' ' || currentChar == ')' || currentChar == '\\')
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[^\\t-\\n\\f-\\r )\\\\]", inputCopy.ptr - input.ptr);
                }
                else
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state44;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    inputCopy = inputCopyNext;
                    goto state44;
                }
            }
        }

    state45:
        // (StringLiteral)
        // path: [R] [\"] [^\t-\n\f-\r (-)\\] [(]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[^]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == ')')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state46;
                }
                else
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state45;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    inputCopy = inputCopyNext;
                    goto state45;
                }
            }
        }

    state46:
        // (StringLiteral)
        // path: [R] [\"] [^\t-\n\f-\r (-)\\] [(] [)]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[^]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == ')')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state46;
                }
                else if ((currentChar >= '\t' && currentChar <= '\n') || (currentChar >= '\f' && currentChar <= '\r') || currentChar == ' ' || currentChar == '(' || currentChar == '\\')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state45;
                }
                else
                {
                    assert(storedStart == size_t.max);
                    storedStart = inputCopy.ptr - input.ptr;
                    assert(storedStart != size_t.max);
                    string compareString = input[storedStart .. inputCopy.ptr + 1 - input.ptr];
                    bool currentCharCorrect = compareString.length <= storedString.length && currentChar == storedString[compareString.length - 1];
                    inputCopy = inputCopy[1 .. $];
                    if (compareString.length == storedString.length && currentCharCorrect)
                    {
                        assert(compareString == storedString);
                        storedStart = size_t.max;
                        goto state48;
                    }
                    else if (compareString.length < storedString.length && currentCharCorrect)
                    {
                        goto state47;
                    }
                    else
                    {
                        storedStart = size_t.max;
                        goto state45;
                    }
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    assert(storedStart == size_t.max);
                    storedStart = inputCopy.ptr - input.ptr;
                    assert(storedStart != size_t.max);
                    string compareString = input[storedStart .. inputCopyNext.ptr - input.ptr];
                    bool currentCharCorrect = compareString.length <= storedString.length && inputCopy[0 .. inputCopyNext.ptr - inputCopy.ptr] == storedString[compareString.length - (inputCopyNext.ptr - inputCopy.ptr)..compareString.length];
                    inputCopy = inputCopyNext;
                    if (compareString.length == storedString.length && currentCharCorrect)
                    {
                        assert(compareString == storedString);
                        storedStart = size_t.max;
                        goto state48;
                    }
                    else if (compareString.length < storedString.length && currentCharCorrect)
                    {
                        goto state47;
                    }
                    else
                    {
                        storedStart = size_t.max;
                        goto state45;
                    }
                }
            }
        }

    state47:
        // (StringLiteral)
        // path: [R] [\"] [^\t-\n\f-\r (-)\\] [(] [)] [^\t-\n\f-\r (-)\\]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[^]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == ')')
                {
                    inputCopy = inputCopy[1 .. $];
                    storedStart = size_t.max;
                    goto state46;
                }
                else if ((currentChar >= '\t' && currentChar <= '\n') || (currentChar >= '\f' && currentChar <= '\r') || currentChar == ' ' || currentChar == '(' || currentChar == '\\')
                {
                    inputCopy = inputCopy[1 .. $];
                    storedStart = size_t.max;
                    goto state45;
                }
                else
                {
                    assert(storedStart != size_t.max);
                    string compareString = input[storedStart .. inputCopy.ptr + 1 - input.ptr];
                    bool currentCharCorrect = compareString.length <= storedString.length && currentChar == storedString[compareString.length - 1];
                    inputCopy = inputCopy[1 .. $];
                    if (compareString.length == storedString.length && currentCharCorrect)
                    {
                        assert(compareString == storedString);
                        storedStart = size_t.max;
                        goto state48;
                    }
                    else if (compareString.length < storedString.length && currentCharCorrect)
                    {
                        goto state47;
                    }
                    else
                    {
                        storedStart = size_t.max;
                        goto state45;
                    }
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    assert(storedStart != size_t.max);
                    string compareString = input[storedStart .. inputCopyNext.ptr - input.ptr];
                    bool currentCharCorrect = compareString.length <= storedString.length && inputCopy[0 .. inputCopyNext.ptr - inputCopy.ptr] == storedString[compareString.length - (inputCopyNext.ptr - inputCopy.ptr)..compareString.length];
                    inputCopy = inputCopyNext;
                    if (compareString.length == storedString.length && currentCharCorrect)
                    {
                        assert(compareString == storedString);
                        storedStart = size_t.max;
                        goto state48;
                    }
                    else if (compareString.length < storedString.length && currentCharCorrect)
                    {
                        goto state47;
                    }
                    else
                    {
                        storedStart = size_t.max;
                        goto state45;
                    }
                }
            }
        }

    state48:
        // (StringLiteral)
        // path:
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[^]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\"')
                {
                    inputCopy = inputCopy[1 .. $];
                    storedStart = size_t.max;
                    goto state30;
                }
                else if (currentChar == ')')
                {
                    inputCopy = inputCopy[1 .. $];
                    storedStart = size_t.max;
                    goto state46;
                }
                else
                {
                    inputCopy = inputCopy[1 .. $];
                    storedStart = size_t.max;
                    goto state45;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    inputCopy = inputCopyNext;
                    storedStart = size_t.max;
                    goto state45;
                }
            }
        }

    state49:
        // Identifier
        // path: [$A-KM-QS-TV-Z_e-mp-tv-wy-z]
        {
            if (inputCopy.length == 0)
                goto endstate49;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate49;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate49;
                }
            }
        }
        endstate49:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state50:
        // (Identifier)
        // path: [u] [\\]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[Uu]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == 'U')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state55;
                }
                else if (currentChar == 'u')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state51;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[Uu]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[Uu]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state51:
        // (Identifier)
        // path: [\\] [u]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state52;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state52:
        // (Identifier)
        // path: [\\] [u] [0-9A-Fa-f]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state53;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state53:
        // (Identifier)
        // path: [\\] [u] [0-9A-Fa-f] [0-9A-Fa-f]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state54;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state54:
        // (Identifier)
        // path: [\\] [u] [0-9A-Fa-f] [0-9A-Fa-f] [0-9A-Fa-f]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state55:
        // (Identifier)
        // path: [\\] [U]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state56;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state56:
        // (Identifier)
        // path: [\\] [U] [0-9A-Fa-f]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state57;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state57:
        // (Identifier)
        // path: [\\] [U] [0-9A-Fa-f] [0-9A-Fa-f]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state58;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state58:
        // (Identifier)
        // path: [\\] [U] [0-9A-Fa-f] [0-9A-Fa-f] [0-9A-Fa-f]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state51;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state59:
        // Identifier (CharacterLiteral) (StringLiteral)
        // path: [LU]
        {
            if (inputCopy.length == 0)
                goto endstate59;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\"')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state28;
                }
                else if (currentChar == '\'')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state13;
                }
                else if (currentChar == 'R')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state40;
                }
                else if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate59;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate59;
                }
            }
        }
        endstate59:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state60:
        // (EscapedNewline) (Identifier)
        // path: [\\]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[\\n\\rUu]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\n')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state61;
                }
                else if (currentChar == '\r')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state62;
                }
                else if (currentChar == 'U')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state55;
                }
                else if (currentChar == 'u')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state51;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[\\n\\rUu]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[\\n\\rUu]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state61:
        // EscapedNewline
        // path: [\\] [\n]
        {
            if (inputCopy.length == 0)
                goto endstate61;
            goto endstate61;
        }
        endstate61:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"EscapedNewline";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state62:
        // (EscapedNewline)
        // path: [\\] [\r]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[\\n]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\n')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state61;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[\\n]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[\\n]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state63:
        // Operator (HeaderNameSys)
        // path: [<]
        {
            if (inputCopy.length == 0)
                goto endstate63;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\n')
                {
                    goto endstate63;
                }
                if (currentChar == '<')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state67;
                }
                else if (currentChar == '>')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Operator";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state66;
                }
                else if (currentChar == '%' || currentChar == ':' || currentChar == '=')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state64;
                }
                else
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Operator";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state65;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Operator";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopyNext;
                    goto state65;
                }
            }
        }
        endstate63:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Operator";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state64:
        // Operator (HeaderNameSys)
        // path: [<] [%:=]
        {
            if (inputCopy.length == 0)
                goto endstate64;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\n')
                {
                    goto endstate64;
                }
                if (currentChar == '>')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Operator";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state66;
                }
                else
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Operator";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state65;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Operator";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopyNext;
                    goto state65;
                }
            }
        }
        endstate64:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Operator";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state65:
        // (HeaderNameSys)
        // path: [<] [^\n%:<->]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[^\\n]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\n')
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[^\\n]", inputCopy.ptr - input.ptr);
                }
                if (currentChar == '>')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state66;
                }
                else
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state65;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    inputCopy = inputCopyNext;
                    goto state65;
                }
            }
        }

    state66:
        // HeaderNameSys
        // path: [<] [>]
        {
            if (inputCopy.length == 0)
                goto endstate66;
            goto endstate66;
        }
        endstate66:
        if (allowToken!"HeaderNameSys")
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"HeaderNameSys";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }
        else
        {
            if (foundSymbol != SymbolID.max)
                goto lexerend;
            else
                throw lexerException("Error", "", inputCopy.ptr - input.ptr);
        }

    state67:
        // Operator (HeaderNameSys)
        // path: [<] [<]
        {
            if (inputCopy.length == 0)
                goto endstate67;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\n')
                {
                    goto endstate67;
                }
                if (currentChar == '=')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state64;
                }
                else if (currentChar == '>')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Operator";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state66;
                }
                else
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Operator";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state65;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Operator";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopyNext;
                    goto state65;
                }
            }
        }
        endstate67:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Operator";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state68:
        // Identifier (Operator)
        // path: [n]
        {
            if (inputCopy.length == 0)
                goto endstate68;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 'e')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state69;
                }
                else if (currentChar == 'o')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state71;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate68;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate68;
                }
            }
        }
        endstate68:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state69:
        // Identifier (Operator)
        // path: [n] [e]
        {
            if (inputCopy.length == 0)
                goto endstate69;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 'w')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state70;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate69;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate69;
                }
            }
        }
        endstate69:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state70:
        // Operator Identifier
        // path: [n] [e] [w]
        {
            if (inputCopy.length == 0)
                goto endstate70;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Operator";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Operator";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate70;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate70;
                }
            }
        }
        endstate70:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Operator";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state71:
        // Identifier (Operator)
        // path: [n] [o]
        {
            if (inputCopy.length == 0)
                goto endstate71;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 't')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state72;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate71;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate71;
                }
            }
        }
        endstate71:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state72:
        // Operator Identifier
        // path: [o] [r]
        {
            if (inputCopy.length == 0)
                goto endstate72;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Operator";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == '_')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Operator";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state73;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Operator";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate72;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate72;
                }
            }
        }
        endstate72:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Operator";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state73:
        // Identifier (Operator)
        // path: [o] [r] [_]
        {
            if (inputCopy.length == 0)
                goto endstate73;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 'e')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state74;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate73;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate73;
                }
            }
        }
        endstate73:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state74:
        // Identifier (Operator)
        // path: [o] [r] [_] [e]
        {
            if (inputCopy.length == 0)
                goto endstate74;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 'q')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state70;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate74;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate74;
                }
            }
        }
        endstate74:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state75:
        // Identifier (Operator)
        // path: [d]
        {
            if (inputCopy.length == 0)
                goto endstate75;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 'e')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state76;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate75;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate75;
                }
            }
        }
        endstate75:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state76:
        // Identifier (Operator)
        // path: [d] [e]
        {
            if (inputCopy.length == 0)
                goto endstate76;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 'l')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state77;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate76;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate76;
                }
            }
        }
        endstate76:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state77:
        // Identifier (Operator)
        // path: [d] [e] [l]
        {
            if (inputCopy.length == 0)
                goto endstate77;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 'e')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state78;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate77;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate77;
                }
            }
        }
        endstate77:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state78:
        // Identifier (Operator)
        // path: [d] [e] [l] [e]
        {
            if (inputCopy.length == 0)
                goto endstate78;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 't')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state79;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate78;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate78;
                }
            }
        }
        endstate78:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state79:
        // Identifier (Operator)
        // path: [d] [e] [l] [e] [t]
        {
            if (inputCopy.length == 0)
                goto endstate79;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 'e')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state70;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate79;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate79;
                }
            }
        }
        endstate79:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state80:
        // Identifier (Operator)
        // path: [a]
        {
            if (inputCopy.length == 0)
                goto endstate80;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 'n')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state81;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate80;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate80;
                }
            }
        }
        endstate80:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state81:
        // Identifier (Operator)
        // path: [a] [n]
        {
            if (inputCopy.length == 0)
                goto endstate81;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 'd')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state72;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate81;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate81;
                }
            }
        }
        endstate81:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state82:
        // Identifier (Operator)
        // path: [b]
        {
            if (inputCopy.length == 0)
                goto endstate82;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 'i')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state83;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate82;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate82;
                }
            }
        }
        endstate82:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state83:
        // Identifier (Operator)
        // path: [b] [i]
        {
            if (inputCopy.length == 0)
                goto endstate83;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 't')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state84;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate83;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate83;
                }
            }
        }
        endstate83:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state84:
        // Identifier (Operator)
        // path: [b] [i] [t]
        {
            if (inputCopy.length == 0)
                goto endstate84;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 'a')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state85;
                }
                else if (currentChar == 'o')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state87;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'b' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate84;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate84;
                }
            }
        }
        endstate84:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state85:
        // Identifier (Operator)
        // path: [b] [i] [t] [a]
        {
            if (inputCopy.length == 0)
                goto endstate85;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 'n')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state86;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate85;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate85;
                }
            }
        }
        endstate85:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state86:
        // Identifier (Operator)
        // path: [b] [i] [t] [a] [n]
        {
            if (inputCopy.length == 0)
                goto endstate86;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 'd')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state70;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate86;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate86;
                }
            }
        }
        endstate86:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state87:
        // Identifier (Operator)
        // path: [b] [i] [t] [o]
        {
            if (inputCopy.length == 0)
                goto endstate87;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 'r')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state70;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate87;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate87;
                }
            }
        }
        endstate87:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state88:
        // Identifier (Operator)
        // path: [o]
        {
            if (inputCopy.length == 0)
                goto endstate88;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 'r')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state72;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate88;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate88;
                }
            }
        }
        endstate88:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state89:
        // Identifier (Operator)
        // path: [c]
        {
            if (inputCopy.length == 0)
                goto endstate89;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 'o')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state90;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate89;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate89;
                }
            }
        }
        endstate89:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state90:
        // Identifier (Operator)
        // path: [c] [o]
        {
            if (inputCopy.length == 0)
                goto endstate90;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 'm')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state91;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate90;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate90;
                }
            }
        }
        endstate90:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state91:
        // Identifier (Operator)
        // path: [c] [o] [m]
        {
            if (inputCopy.length == 0)
                goto endstate91;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 'p')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state92;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate91;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate91;
                }
            }
        }
        endstate91:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state92:
        // Identifier (Operator)
        // path: [c] [o] [m] [p]
        {
            if (inputCopy.length == 0)
                goto endstate92;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 'l')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state70;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate92;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate92;
                }
            }
        }
        endstate92:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state93:
        // Identifier (Operator)
        // path: [x]
        {
            if (inputCopy.length == 0)
                goto endstate93;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Identifier";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state50;
                }
                else if (currentChar == 'o')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state88;
                }
                else if (currentChar == '$' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state49;
                }
                else
                {
                    goto endstate93;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate93;
                }
            }
        }
        endstate93:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Identifier";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state94:
        // WS (NL)
        // path: [\r]
        {
            if (inputCopy.length == 0)
                goto endstate94;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\n')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"WS";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state95;
                }
                else if (currentChar == '\t' || (currentChar >= '\f' && currentChar <= '\r') || currentChar == ' ')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state96;
                }
                else
                {
                    goto endstate94;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate94;
                }
            }
        }
        endstate94:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"WS";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state95:
        // NL
        // path: [\n]
        {
            if (inputCopy.length == 0)
                goto endstate95;
            goto endstate95;
        }
        endstate95:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"NL";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state96:
        // WS
        // path: [\t\f ]
        {
            if (inputCopy.length == 0)
                goto endstate96;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\t' || (currentChar >= '\f' && currentChar <= '\r') || currentChar == ' ')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state96;
                }
                else
                {
                    goto endstate96;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate96;
                }
            }
        }
        endstate96:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"WS";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state97:
        // Operator
        // path: [:]
        {
            if (inputCopy.length == 0)
                goto endstate97;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == ':' || currentChar == '>')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state2;
                }
                else
                {
                    goto endstate97;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate97;
                }
            }
        }
        endstate97:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Operator";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state98:
        // Operator
        // path: [%]
        {
            if (inputCopy.length == 0)
                goto endstate98;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == ':')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state99;
                }
                else if ((currentChar >= '=' && currentChar <= '>'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state2;
                }
                else
                {
                    goto endstate98;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate98;
                }
            }
        }
        endstate98:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Operator";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state99:
        // Operator
        // path: [%] [:]
        {
            if (inputCopy.length == 0)
                goto endstate99;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '%')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Operator";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state100;
                }
                else
                {
                    goto endstate99;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate99;
                }
            }
        }
        endstate99:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Operator";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state100:
        // (Operator)
        // path: [%] [:] [%]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[:]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == ':')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state2;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[:]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[:]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state101:
        // Operator (PpNumber)
        // path: [.]
        {
            if (inputCopy.length == 0)
                goto endstate101;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '*')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state2;
                }
                else if (currentChar == '.')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Operator";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state102;
                }
                else if ((currentChar >= '0' && currentChar <= '9'))
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"Operator";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state103;
                }
                else
                {
                    goto endstate101;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate101;
                }
            }
        }
        endstate101:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Operator";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state102:
        // (Operator)
        // path: [.] [.]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[.]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '.')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state2;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[.]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[.]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state103:
        // PpNumber
        // path: [0-9]
        {
            if (inputCopy.length == 0)
                goto endstate103;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\'')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"PpNumber";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state110;
                }
                else if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"PpNumber";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state105;
                }
                else if (currentChar == 'E' || currentChar == 'e')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state104;
                }
                else if (currentChar == '$' || currentChar == '.' || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state103;
                }
                else
                {
                    goto endstate103;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate103;
                }
            }
        }
        endstate103:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"PpNumber";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state104:
        // PpNumber
        // path: [0-9] [Ee]
        {
            if (inputCopy.length == 0)
                goto endstate104;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\'')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"PpNumber";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state110;
                }
                else if (currentChar == '\\')
                {
                    assert(inputCopy.ptr >= input.ptr);
                    foundSymbol = tokenID!"PpNumber";
                    foundLength = inputCopy.ptr - input.ptr;
                    foundIsIgnore = false;
                    inputCopy = inputCopy[1 .. $];
                    goto state105;
                }
                else if (currentChar == 'E' || currentChar == 'e')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state104;
                }
                else if (currentChar == '$' || currentChar == '+' || (currentChar >= '-' && currentChar <= '.') || (currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state103;
                }
                else
                {
                    goto endstate104;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate104;
                }
            }
        }
        endstate104:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"PpNumber";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state105:
        // (PpNumber)
        // path: [0-9] [\\]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[Uu]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == 'U')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state111;
                }
                else if (currentChar == 'u')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state106;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[Uu]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[Uu]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state106:
        // (PpNumber)
        // path: [0-9] [\\] [u]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state107;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state107:
        // (PpNumber)
        // path: [0-9] [\\] [u] [0-9A-Fa-f]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state108;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state108:
        // (PpNumber)
        // path: [0-9] [\\] [u] [0-9A-Fa-f] [0-9A-Fa-f]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state109;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state109:
        // (PpNumber)
        // path: [0-9] [\\] [u] [0-9A-Fa-f] [0-9A-Fa-f] [0-9A-Fa-f]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state103;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state110:
        // (PpNumber)
        // path: [0-9] [\']
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[$A-Z\\\\_a-z]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '\\')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state105;
                }
                else if (currentChar == '$' || (currentChar >= 'A' && currentChar <= 'Z') || currentChar == '_' || (currentChar >= 'a' && currentChar <= 'z'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state103;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[$A-Z\\\\_a-z]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[$A-Z\\\\_a-z]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state111:
        // (PpNumber)
        // path: [0-9] [\\] [U]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state112;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state112:
        // (PpNumber)
        // path: [0-9] [\\] [U] [0-9A-Fa-f]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state113;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state113:
        // (PpNumber)
        // path: [0-9] [\\] [U] [0-9A-Fa-f] [0-9A-Fa-f]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state114;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state114:
        // (PpNumber)
        // path: [0-9] [\\] [U] [0-9A-Fa-f] [0-9A-Fa-f] [0-9A-Fa-f]
        {
            if (inputCopy.length == 0)
            {
                if (input.ptr == inputCopy.ptr)
                    goto lexerend;
                else if (foundSymbol != SymbolID.max)
                    goto lexerend;
                else
                    throw lexerException("EOF", "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
            }
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if ((currentChar >= '0' && currentChar <= '9') || (currentChar >= 'A' && currentChar <= 'F') || (currentChar >= 'a' && currentChar <= 'f'))
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state106;
                }
                else
                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentChar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    if (foundSymbol != SymbolID.max)
                        goto lexerend;
                    else
                        throw lexerException(text("Error unexpected \'", currentDchar.escapeChar(false), "\'"), "[0-9A-Fa-f]", inputCopy.ptr - input.ptr);
                }
            }
        }

    state115:
        // Operator
        // path: [+]
        {
            if (inputCopy.length == 0)
                goto endstate115;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '+' || currentChar == '=')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state2;
                }
                else
                {
                    goto endstate115;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate115;
                }
            }
        }
        endstate115:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Operator";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state116:
        // Operator
        // path: [\-]
        {
            if (inputCopy.length == 0)
                goto endstate116;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '>')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state117;
                }
                else if (currentChar == '-' || currentChar == '=')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state2;
                }
                else
                {
                    goto endstate116;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate116;
                }
            }
        }
        endstate116:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Operator";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state117:
        // Operator
        // path: [\-] [>]
        {
            if (inputCopy.length == 0)
                goto endstate117;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '*')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state2;
                }
                else
                {
                    goto endstate117;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate117;
                }
            }
        }
        endstate117:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Operator";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state118:
        // Operator
        // path: [!*=\^]
        {
            if (inputCopy.length == 0)
                goto endstate118;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '=')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state2;
                }
                else
                {
                    goto endstate118;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate118;
                }
            }
        }
        endstate118:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Operator";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state119:
        // Operator
        // path: [&]
        {
            if (inputCopy.length == 0)
                goto endstate119;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '&' || currentChar == '=')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state2;
                }
                else
                {
                    goto endstate119;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate119;
                }
            }
        }
        endstate119:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Operator";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state120:
        // Operator
        // path: [|]
        {
            if (inputCopy.length == 0)
                goto endstate120;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '=' || currentChar == '|')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state2;
                }
                else
                {
                    goto endstate120;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate120;
                }
            }
        }
        endstate120:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Operator";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

    state121:
        // Operator
        // path: [>]
        {
            if (inputCopy.length == 0)
                goto endstate121;
            char currentChar = inputCopy[0];
            if (currentChar < 0x80)
            {
                if (currentChar == '=')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state2;
                }
                else if (currentChar == '>')
                {
                    inputCopy = inputCopy[1 .. $];
                    goto state118;
                }
                else
                {
                    goto endstate121;
                }
            }
            else
            {
                string inputCopyNext = inputCopy;
                import std.utf;

                dchar currentDchar = decodeFront!(Yes.useReplacementDchar)(inputCopyNext);

                {
                    goto endstate121;
                }
            }
        }
        endstate121:
        {
            assert(inputCopy.ptr >= input.ptr);
            foundSymbol = tokenID!"Operator";
            foundLength = inputCopy.ptr - input.ptr;
            foundIsIgnore = false;
            goto lexerend;
        }

        lexerend:

        if (foundSymbol != SymbolID.max)
        {
            if (foundLength == 0)
            {
                if (!inputCopy.empty)
                    throw lexerException("no token", null, inputCopy.ptr + 1 - input.ptr);
                else
                {
                    front.content = "";
                    front.symbol = SymbolID(0);
                    static if (includeIgnoredTokens)
                        front.isIgnoreToken = false;
                    empty = true;
                    return;
                }
            }
            static if (!includeIgnoredTokens)
            {
                if (foundIsIgnore)
                {
                    front.currentLocation = front.currentLocation + LocationDiff.fromStr(input[0 .. foundLength]);
                    input = input[foundLength .. $];
                    inputCopy = input;
                    foundLength = 0;
                    foundIsIgnore = false;
                    foundSymbol = SymbolID.max;
                    storedStart = size_t.max;
                    storedString = null;
                    goto start;
                }
            }
            front.content = input[0 .. foundLength];
            front.symbol = foundSymbol;
            static if (includeIgnoredTokens)
                front.isIgnoreToken = foundIsIgnore;
            empty = false;
            return;
        }
        else if (input.length == 0)
        {
            front.content = "";
            front.symbol = SymbolID(0);
            static if (includeIgnoredTokens)
                front.isIgnoreToken = false;
            empty = true;
            return;
        }
        else
            throw lexerException("no token", null, 1);
    }

    SingleParseException!Location lexerException(string errorText, string expected, size_t len,
            string file = __FILE__, size_t line = __LINE__)
    {
        string str = errorText;
        if (expected.length)
            str ~= ", expected " ~ expected;
        return new SingleParseException!Location(str, front.currentLocation, front.currentLocation, file, line);
    }
}

immutable allNonterminalTokens = [
    /* 12000: */ immutable(Nonterminal)("$null", NonterminalFlags.none, [], []),
    /* 12001: */ immutable(Nonterminal)("\"#\"", NonterminalFlags.none, [], []),
    /* 12002: */ immutable(Nonterminal)("\"(\"", NonterminalFlags.none, [], []),
    /* 12003: */ immutable(Nonterminal)("\")\"", NonterminalFlags.none, [], []),
    /* 12004: */ immutable(Nonterminal)("\",\"", NonterminalFlags.none, [], []),
    /* 12005: */ immutable(Nonterminal)("BlockComment", NonterminalFlags.none, ["minimalMatch"], []),
    /* 12006: */ immutable(Nonterminal)("CharacterLiteral", NonterminalFlags.none, [], []),
    /* 12007: */ immutable(Nonterminal)("EscapedNewline", NonterminalFlags.none, [], []),
    /* 12008: */ immutable(Nonterminal)("HeaderNameSys", NonterminalFlags.none, ["inContextOnly"], []),
    /* 12009: */ immutable(Nonterminal)("Identifier", NonterminalFlags.none, ["lowPrio"], []),
    /* 12010: */ immutable(Nonterminal)("LineComment", NonterminalFlags.none, [], []),
    /* 12011: */ immutable(Nonterminal)("NL", NonterminalFlags.none, [], []),
    /* 12012: */ immutable(Nonterminal)("Operator", NonterminalFlags.none, [], []),
    /* 12013: */ immutable(Nonterminal)("PpNumber", NonterminalFlags.none, [], []),
    /* 12014: */ immutable(Nonterminal)("StringLiteral", NonterminalFlags.none, ["minimalMatch"], []),
    /* 12015: */ immutable(Nonterminal)("WS", NonterminalFlags.none, [], []),
    /* 12016: */ immutable(Nonterminal)("HexQuad", NonterminalFlags.none, [], []),
    /* 12017: */ immutable(Nonterminal)("UniversalCharacterName", NonterminalFlags.none, [], []),
    /* 12018: */ immutable(Nonterminal)("IdentifierNondigit", NonterminalFlags.none, [], []),
    /* 12019: */ immutable(Nonterminal)("Nondigit", NonterminalFlags.none, [], []),
    /* 12020: */ immutable(Nonterminal)("Digit", NonterminalFlags.none, [], []),
    /* 12021: */ immutable(Nonterminal)("OctalDigit", NonterminalFlags.none, [], []),
    /* 12022: */ immutable(Nonterminal)("HexadecimalDigit", NonterminalFlags.none, [], []),
    /* 12023: */ immutable(Nonterminal)("CCharSequence", NonterminalFlags.none, [], []),
    /* 12024: */ immutable(Nonterminal)("CChar", NonterminalFlags.none, [], []),
    /* 12025: */ immutable(Nonterminal)("EscapeSequence", NonterminalFlags.none, [], []),
    /* 12026: */ immutable(Nonterminal)("SimpleEscapeSequence", NonterminalFlags.none, [], []),
    /* 12027: */ immutable(Nonterminal)("OctalEscapeSequence", NonterminalFlags.none, [], []),
    /* 12028: */ immutable(Nonterminal)("HexadecimalEscapeSequence", NonterminalFlags.none, [], []),
    /* 12029: */ immutable(Nonterminal)("EncodingPrefix", NonterminalFlags.none, [], []),
    /* 12030: */ immutable(Nonterminal)("SCharSequence", NonterminalFlags.none, [], []),
    /* 12031: */ immutable(Nonterminal)("SChar", NonterminalFlags.none, [], []),
    /* 12032: */ immutable(Nonterminal)("RawString", NonterminalFlags.none, [], []),
    /* 12033: */ immutable(Nonterminal)("RCharSequence", NonterminalFlags.none, [], []),
    /* 12034: */ immutable(Nonterminal)("RChar", NonterminalFlags.none, [], []),
    /* 12035: */ immutable(Nonterminal)("DCharSequence", NonterminalFlags.none, [], []),
    /* 12036: */ immutable(Nonterminal)("DChar", NonterminalFlags.none, [], []),
    /* 12037: */ immutable(Nonterminal)("\"\\r\"?", NonterminalFlags.none, [], []),
    /* 12038: */ immutable(Nonterminal)("[^>\\n]+", NonterminalFlags.none, ["array"], []),
    /* 12039: */ immutable(Nonterminal)("[^>\\n]*", NonterminalFlags.none, ["array"], []),
    /* 12040: */ immutable(Nonterminal)("[^]+", NonterminalFlags.none, ["array"], []),
    /* 12041: */ immutable(Nonterminal)("[^]*", NonterminalFlags.none, ["array"], []),
    /* 12042: */ immutable(Nonterminal)("[^\\n\\r]+", NonterminalFlags.none, ["array"], []),
    /* 12043: */ immutable(Nonterminal)("[^\\n\\r]*", NonterminalFlags.none, ["array"], []),
    /* 12044: */ immutable(Nonterminal)("[_\\r\\t\\f]+", NonterminalFlags.none, ["array"], []),
    /* 12045: */ immutable(Nonterminal)("EncodingPrefix?", NonterminalFlags.none, [], []),
    /* 12046: */ immutable(Nonterminal)("SCharSequence?", NonterminalFlags.none, [], []),
    /* 12047: */ immutable(Nonterminal)("RCharSequence?", NonterminalFlags.none, [], []),
];
