// Generated with DParserGen.
module grammarcpreproc;
import dparsergen.core.grammarinfo;
import dparsergen.core.parseexception;
import dparsergen.core.parsestackelem;
import dparsergen.core.utils;
import std.algorithm;
import std.conv;
import std.meta;
import std.stdio;
import std.traits;

enum SymbolID startTokenID = 11000;
static assert(allTokens.length < SymbolID.max - startTokenID);
enum SymbolID endTokenID = startTokenID + allTokens.length;

enum SymbolID startNonterminalID = 12000;
static assert(allNonterminals.length < SymbolID.max - startNonterminalID);
enum SymbolID endNonterminalID = startNonterminalID + allNonterminals.length;

enum ProductionID startProductionID = 13000;
static assert(allProductions.length < ProductionID.max - startProductionID);
enum ProductionID endProductionID = startProductionID + allProductions.length;

private enum nonterminalIDForImpl(string name) = staticIndexOf!(name,
    "AllOperators",
    "Conditional",
    "ConditionalElif",
    "ConditionalElse",
    "ConditionalNext",
    "ConditionalStart",
    "ControlLine",
    "EOF",
    "EmptyDirective",
    "EmptyLine",
    "FuncDefine",
    "FuncParam",
    "FuncParams",
    "Group",
    "Group?",
    "GroupPart",
    "HeaderName",
    "HeaderPart",
    "Include",
    "IncludeNext",
    "LineAnnotation",
    "NewLine",
    "PPElif",
    "PPElse",
    "PPEndif",
    "PPError",
    "PPIf",
    "PPIfDef",
    "PPIfNDef",
    "PPWarning",
    "ParamExpansion",
    "Pragma",
    "PreprocessingFile",
    "TextLine",
    "Token",
    "TokenInFunc",
    "TokenList",
    "TokenX",
    "TokenXInFunc",
    "Undef",
    "VarDefine",
    "VarDefineName",
    "WSC",
    "WSC2",
    "WSCElem",
    "list(FuncParam, \",\")",
    "repeat(Token)",
    "repeat(WSCElem)",
    "repeatOrNone(GroupPart)",
    "repeatOrNone(Token)",
    "repeatOrNone(TokenInFunc)",
    );
template nonterminalIDFor(string name) if (nonterminalIDForImpl!name >= 0)
{
    enum nonterminalIDFor = startNonterminalID + nonterminalIDForImpl!name;
}

struct Parser(CreatorInstance, alias L)
{
    alias Lexer = L;
    alias Location = typeof(Lexer.init.front.currentLocation);
    alias LocationDiff = typeof(Location.init - Location.init);

    CreatorInstance creator;
    Lexer* lexer;
    ParseException lastError;

    template NonterminalType(size_t nonterminalID)
            if (nonterminalID >= startNonterminalID && nonterminalID < endNonterminalID)
    {
        alias NonterminalType = CreatorInstance.NonterminalType!nonterminalID;
    }

    alias Token = typeof(lexer.front.content);

    Location lastTokenEnd;

    ParseStackElem!(Location, Token) popToken()
    {
        if (lexer.front.currentLocation - lastTokenEnd != LocationDiff.invalid)
            assert(lexer.front.currentLocation >= lastTokenEnd,
                    text(lastTokenEnd, " ", lexer.front.currentLocation));

        lastTokenEnd = lexer.front.currentTokenEnd;
        auto tok = lexer.front.content;
        auto pos = lexer.front.currentLocation;
        lexer.popFront;

        assert(lastTokenEnd >= pos);

        if (!lexer.empty)
        {
            assert(lexer.front.currentLocation >= lastTokenEnd,
                    text(lastTokenEnd, " ", lexer.front.currentLocation));
        }

        return ParseStackElem!(Location, Token)(pos, tok);
    }
    auto reduce0_AllOperators/*AllOperators @string = Operator*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12000/*AllOperators*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13000)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12000/*AllOperators*/))(parseStart, pt);
    }

    auto reduce1_AllOperators/*AllOperators @string = "("*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12000/*AllOperators*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13001)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12000/*AllOperators*/))(parseStart, pt);
    }

    auto reduce2_AllOperators/*AllOperators @string = ")"*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12000/*AllOperators*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13002)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12000/*AllOperators*/))(parseStart, pt);
    }

    auto reduce3_AllOperators/*AllOperators @string = ","*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12000/*AllOperators*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13003)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12000/*AllOperators*/))(parseStart, pt);
    }

    auto reduce4_Conditional/*Conditional = ConditionalStart repeatOrNone(GroupPart) ConditionalNext*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12005) stack3, ParseStackElem!(Location, NonterminalType!12048) stack2, ParseStackElem!(Location, NonterminalType!12004) stack1)
    {
        NonterminalType!(12001/*Conditional*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13004)(parseStart, end, stack3, stack2, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12001/*Conditional*/))(parseStart, pt);
    }

    auto reduce5_ConditionalElif/*ConditionalElif = PPElif repeatOrNone(GroupPart) ConditionalNext*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12022) stack3, ParseStackElem!(Location, NonterminalType!12048) stack2, ParseStackElem!(Location, NonterminalType!12004) stack1)
    {
        NonterminalType!(12002/*ConditionalElif*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13005)(parseStart, end, stack3, stack2, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12002/*ConditionalElif*/))(parseStart, pt);
    }

    auto reduce6_ConditionalElse/*ConditionalElse = PPElse repeatOrNone(GroupPart) PPEndif*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12023) stack3, ParseStackElem!(Location, NonterminalType!12048) stack2, ParseStackElem!(Location, NonterminalType!12024) stack1)
    {
        NonterminalType!(12003/*ConditionalElse*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13006)(parseStart, end, stack3, stack2, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12003/*ConditionalElse*/))(parseStart, pt);
    }

    auto reduce7_ConditionalNext/*ConditionalNext = <ConditionalElif*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12002) stack1)
    {
        NonterminalType!(12004/*ConditionalNext*/) pt;
        pt = stack1.val;
        parseStart = stack1.start;
        return ParseStackElem!(Location, NonterminalType!(12004/*ConditionalNext*/))(parseStart, pt);
    }

    auto reduce8_ConditionalNext/*ConditionalNext = <ConditionalElse*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12003) stack1)
    {
        NonterminalType!(12004/*ConditionalNext*/) pt;
        pt = stack1.val;
        parseStart = stack1.start;
        return ParseStackElem!(Location, NonterminalType!(12004/*ConditionalNext*/))(parseStart, pt);
    }

    auto reduce9_ConditionalNext/*ConditionalNext = <PPEndif*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12024) stack1)
    {
        NonterminalType!(12004/*ConditionalNext*/) pt;
        pt = stack1.val;
        parseStart = stack1.start;
        return ParseStackElem!(Location, NonterminalType!(12004/*ConditionalNext*/))(parseStart, pt);
    }

    auto reduce10_ConditionalStart/*ConditionalStart = <PPIf*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12026) stack1)
    {
        NonterminalType!(12005/*ConditionalStart*/) pt;
        pt = stack1.val;
        parseStart = stack1.start;
        return ParseStackElem!(Location, NonterminalType!(12005/*ConditionalStart*/))(parseStart, pt);
    }

    auto reduce11_ConditionalStart/*ConditionalStart = <PPIfDef*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12027) stack1)
    {
        NonterminalType!(12005/*ConditionalStart*/) pt;
        pt = stack1.val;
        parseStart = stack1.start;
        return ParseStackElem!(Location, NonterminalType!(12005/*ConditionalStart*/))(parseStart, pt);
    }

    auto reduce12_ConditionalStart/*ConditionalStart = <PPIfNDef*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12028) stack1)
    {
        NonterminalType!(12005/*ConditionalStart*/) pt;
        pt = stack1.val;
        parseStart = stack1.start;
        return ParseStackElem!(Location, NonterminalType!(12005/*ConditionalStart*/))(parseStart, pt);
    }

    auto reduce13_ControlLine/*ControlLine = <Include*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12018) stack1)
    {
        NonterminalType!(12006/*ControlLine*/) pt;
        pt = stack1.val;
        parseStart = stack1.start;
        return ParseStackElem!(Location, NonterminalType!(12006/*ControlLine*/))(parseStart, pt);
    }

    auto reduce14_ControlLine/*ControlLine = <IncludeNext*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12019) stack1)
    {
        NonterminalType!(12006/*ControlLine*/) pt;
        pt = stack1.val;
        parseStart = stack1.start;
        return ParseStackElem!(Location, NonterminalType!(12006/*ControlLine*/))(parseStart, pt);
    }

    auto reduce15_ControlLine/*ControlLine = <VarDefine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12040) stack1)
    {
        NonterminalType!(12006/*ControlLine*/) pt;
        pt = stack1.val;
        parseStart = stack1.start;
        return ParseStackElem!(Location, NonterminalType!(12006/*ControlLine*/))(parseStart, pt);
    }

    auto reduce16_ControlLine/*ControlLine = <FuncDefine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12010) stack1)
    {
        NonterminalType!(12006/*ControlLine*/) pt;
        pt = stack1.val;
        parseStart = stack1.start;
        return ParseStackElem!(Location, NonterminalType!(12006/*ControlLine*/))(parseStart, pt);
    }

    auto reduce17_ControlLine/*ControlLine = <Undef*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12039) stack1)
    {
        NonterminalType!(12006/*ControlLine*/) pt;
        pt = stack1.val;
        parseStart = stack1.start;
        return ParseStackElem!(Location, NonterminalType!(12006/*ControlLine*/))(parseStart, pt);
    }

    auto reduce18_ControlLine/*ControlLine = <LineAnnotation*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12020) stack1)
    {
        NonterminalType!(12006/*ControlLine*/) pt;
        pt = stack1.val;
        parseStart = stack1.start;
        return ParseStackElem!(Location, NonterminalType!(12006/*ControlLine*/))(parseStart, pt);
    }

    auto reduce19_ControlLine/*ControlLine = <PPError*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12025) stack1)
    {
        NonterminalType!(12006/*ControlLine*/) pt;
        pt = stack1.val;
        parseStart = stack1.start;
        return ParseStackElem!(Location, NonterminalType!(12006/*ControlLine*/))(parseStart, pt);
    }

    auto reduce20_ControlLine/*ControlLine = <PPWarning*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12029) stack1)
    {
        NonterminalType!(12006/*ControlLine*/) pt;
        pt = stack1.val;
        parseStart = stack1.start;
        return ParseStackElem!(Location, NonterminalType!(12006/*ControlLine*/))(parseStart, pt);
    }

    auto reduce21_ControlLine/*ControlLine = <Pragma*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12031) stack1)
    {
        NonterminalType!(12006/*ControlLine*/) pt;
        pt = stack1.val;
        parseStart = stack1.start;
        return ParseStackElem!(Location, NonterminalType!(12006/*ControlLine*/))(parseStart, pt);
    }

    auto reduce22_ControlLine/*ControlLine = <EmptyDirective*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12008) stack1)
    {
        NonterminalType!(12006/*ControlLine*/) pt;
        pt = stack1.val;
        parseStart = stack1.start;
        return ParseStackElem!(Location, NonterminalType!(12006/*ControlLine*/))(parseStart, pt);
    }

    auto reduce23_EOF/*EOF @string = !anytoken @empty*/()
    {
        Location parseStart = lastTokenEnd;
        NonterminalType!(12007/*EOF*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13023)(parseStart, end);
        }
        return ParseStackElem!(Location, NonterminalType!(12007/*EOF*/))(parseStart, pt);
    }

    auto reduce24_EmptyDirective/*EmptyDirective = WSC "#" WSC ^NewLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042) stack2/*, ParseStackElem!(Location, NonterminalType!12021) stack1*/)
    {
        NonterminalType!(12008/*EmptyDirective*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13024)(parseStart, end, stack4, stack3, stack2);
        }
        return ParseStackElem!(Location, NonterminalType!(12008/*EmptyDirective*/))(parseStart, pt);
    }

    auto reduce25_EmptyLine/*EmptyLine = NL*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12009/*EmptyLine*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13025)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12009/*EmptyLine*/))(parseStart, pt);
    }

    auto reduce26_EmptyLine/*EmptyLine = WSC2 NewLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12043) stack2, ParseStackElem!(Location, NonterminalType!12021) stack1)
    {
        NonterminalType!(12009/*EmptyLine*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13026)(parseStart, end, stack2, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12009/*EmptyLine*/))(parseStart, pt);
    }

    auto reduce27_FuncDefine/*FuncDefine = WSC "#" WSC Identifier>>"define" WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) ^NewLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack12, ParseStackElem!(Location, Token) stack11, ParseStackElem!(Location, NonterminalType!12042) stack10, ParseStackElem!(Location, Token) stack9, ParseStackElem!(Location, NonterminalType!12042) stack8, ParseStackElem!(Location, Token) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12012) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042) stack3, ParseStackElem!(Location, NonterminalType!12050) stack2/*, ParseStackElem!(Location, NonterminalType!12021) stack1*/)
    {
        NonterminalType!(12010/*FuncDefine*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13027)(parseStart, end, stack12, stack11, stack10, stack9, stack8, stack7, stack6, stack5, stack4, stack3, stack2);
        }
        return ParseStackElem!(Location, NonterminalType!(12010/*FuncDefine*/))(parseStart, pt);
    }

    auto reduce28_FuncParam/*FuncParam = WSC Identifier WSC*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042) stack1)
    {
        NonterminalType!(12011/*FuncParam*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13028)(parseStart, end, stack3, stack2, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12011/*FuncParam*/))(parseStart, pt);
    }

    auto reduce29_FuncParam/*FuncParam = WSC Operator>>"..." WSC*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042) stack1)
    {
        NonterminalType!(12011/*FuncParam*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13029)(parseStart, end, stack3, stack2, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12011/*FuncParam*/))(parseStart, pt);
    }

    auto reduce30_FuncParam/*FuncParam = WSC*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack1)
    {
        NonterminalType!(12011/*FuncParam*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13030)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12011/*FuncParam*/))(parseStart, pt);
    }

    auto reduce31_FuncParams/*FuncParams @array = list(FuncParam, ",")*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12045) stack1)
    {
        NonterminalType!(12012/*FuncParams*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13031)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12012/*FuncParams*/))(parseStart, pt);
    }

    auto reduce32_Group/*Group @array = GroupPart*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12015) stack1)
    {
        NonterminalType!(12013/*Group*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13032)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12013/*Group*/))(parseStart, pt);
    }

    auto reduce33_Group/*Group @array = Group GroupPart*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12013) stack2, ParseStackElem!(Location, NonterminalType!12015) stack1)
    {
        NonterminalType!(12013/*Group*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13033)(parseStart, end, stack2, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12013/*Group*/))(parseStart, pt);
    }

    auto reduce34/*Group? = <Group [virtual]*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12013) stack1)
    {
        NonterminalType!(12014/*Group?*/) pt;
        pt = stack1.val;
        parseStart = stack1.start;
        return ParseStackElem!(Location, NonterminalType!(12014/*Group?*/))(parseStart, pt);
    }

    auto reduce35/*Group? = [virtual]*/()
    {
        Location parseStart = lastTokenEnd;
        NonterminalType!(12014/*Group?*/) pt;
        pt = typeof(pt).init;
        return ParseStackElem!(Location, NonterminalType!(12014/*Group?*/))(parseStart, pt);
    }

    auto reduce36_GroupPart/*GroupPart = <Conditional*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12001) stack1)
    {
        NonterminalType!(12015/*GroupPart*/) pt;
        pt = stack1.val;
        parseStart = stack1.start;
        return ParseStackElem!(Location, NonterminalType!(12015/*GroupPart*/))(parseStart, pt);
    }

    auto reduce37_GroupPart/*GroupPart = <ControlLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12006) stack1)
    {
        NonterminalType!(12015/*GroupPart*/) pt;
        pt = stack1.val;
        parseStart = stack1.start;
        return ParseStackElem!(Location, NonterminalType!(12015/*GroupPart*/))(parseStart, pt);
    }

    auto reduce38_GroupPart/*GroupPart = <TextLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12033) stack1)
    {
        NonterminalType!(12015/*GroupPart*/) pt;
        pt = stack1.val;
        parseStart = stack1.start;
        return ParseStackElem!(Location, NonterminalType!(12015/*GroupPart*/))(parseStart, pt);
    }

    auto reduce39_GroupPart/*GroupPart = <EmptyLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12009) stack1)
    {
        NonterminalType!(12015/*GroupPart*/) pt;
        pt = stack1.val;
        parseStart = stack1.start;
        return ParseStackElem!(Location, NonterminalType!(12015/*GroupPart*/))(parseStart, pt);
    }

    auto reduce40_HeaderName/*HeaderName = HeaderNameSys*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12016/*HeaderName*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13040)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12016/*HeaderName*/))(parseStart, pt);
    }

    auto reduce41_HeaderName/*HeaderName = StringLiteral*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12016/*HeaderName*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13041)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12016/*HeaderName*/))(parseStart, pt);
    }

    auto reduce42_HeaderName/*HeaderName = Identifier*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12016/*HeaderName*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13042)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12016/*HeaderName*/))(parseStart, pt);
    }

    auto reduce43_HeaderPart/*HeaderPart @enableToken(HeaderNameSys) = WSC HeaderName*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack2, ParseStackElem!(Location, NonterminalType!12016) stack1)
    {
        NonterminalType!(12017/*HeaderPart*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13043)(parseStart, end, stack2, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12017/*HeaderPart*/))(parseStart, pt);
    }

    auto reduce44_Include/*Include = WSC "#" WSC Identifier>>"include" HeaderPart WSC ^NewLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12017) stack3, ParseStackElem!(Location, NonterminalType!12042) stack2/*, ParseStackElem!(Location, NonterminalType!12021) stack1*/)
    {
        NonterminalType!(12018/*Include*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13044)(parseStart, end, stack7, stack6, stack5, stack4, stack3, stack2);
        }
        return ParseStackElem!(Location, NonterminalType!(12018/*Include*/))(parseStart, pt);
    }

    auto reduce45_IncludeNext/*IncludeNext = WSC "#" WSC Identifier>>"include_next" HeaderPart WSC ^NewLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12017) stack3, ParseStackElem!(Location, NonterminalType!12042) stack2/*, ParseStackElem!(Location, NonterminalType!12021) stack1*/)
    {
        NonterminalType!(12019/*IncludeNext*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13045)(parseStart, end, stack7, stack6, stack5, stack4, stack3, stack2);
        }
        return ParseStackElem!(Location, NonterminalType!(12019/*IncludeNext*/))(parseStart, pt);
    }

    auto reduce46_LineAnnotation/*LineAnnotation = WSC "#" WSC line:PpNumber WSC ^NewLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042) stack2/*, ParseStackElem!(Location, NonterminalType!12021) stack1*/)
    {
        NonterminalType!(12020/*LineAnnotation*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13046)(parseStart, end, stack6, stack5, stack4, stack3, stack2);
        }
        return ParseStackElem!(Location, NonterminalType!(12020/*LineAnnotation*/))(parseStart, pt);
    }

    auto reduce47_LineAnnotation/*LineAnnotation = WSC "#" WSC line:PpNumber WSC filename:StringLiteral WSC repeatOrNone(Token) ^NewLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack9, ParseStackElem!(Location, Token) stack8, ParseStackElem!(Location, NonterminalType!12042) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042) stack3, ParseStackElem!(Location, NonterminalType!12049) stack2/*, ParseStackElem!(Location, NonterminalType!12021) stack1*/)
    {
        NonterminalType!(12020/*LineAnnotation*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13047)(parseStart, end, stack9, stack8, stack7, stack6, stack5, stack4, stack3, stack2);
        }
        return ParseStackElem!(Location, NonterminalType!(12020/*LineAnnotation*/))(parseStart, pt);
    }

    auto reduce48_LineAnnotation/*LineAnnotation = WSC "#" WSC Identifier>>"line" WSC line:PpNumber WSC ^NewLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack8, ParseStackElem!(Location, Token) stack7, ParseStackElem!(Location, NonterminalType!12042) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042) stack2/*, ParseStackElem!(Location, NonterminalType!12021) stack1*/)
    {
        NonterminalType!(12020/*LineAnnotation*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13048)(parseStart, end, stack8, stack7, stack6, stack5, stack4, stack3, stack2);
        }
        return ParseStackElem!(Location, NonterminalType!(12020/*LineAnnotation*/))(parseStart, pt);
    }

    auto reduce49_LineAnnotation/*LineAnnotation = WSC "#" WSC Identifier>>"line" WSC line:PpNumber WSC filename:StringLiteral WSC repeatOrNone(Token) ^NewLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack11, ParseStackElem!(Location, Token) stack10, ParseStackElem!(Location, NonterminalType!12042) stack9, ParseStackElem!(Location, Token) stack8, ParseStackElem!(Location, NonterminalType!12042) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042) stack3, ParseStackElem!(Location, NonterminalType!12049) stack2/*, ParseStackElem!(Location, NonterminalType!12021) stack1*/)
    {
        NonterminalType!(12020/*LineAnnotation*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13049)(parseStart, end, stack11, stack10, stack9, stack8, stack7, stack6, stack5, stack4, stack3, stack2);
        }
        return ParseStackElem!(Location, NonterminalType!(12020/*LineAnnotation*/))(parseStart, pt);
    }

    auto reduce50_NewLine/*NewLine @string = NL*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12021/*NewLine*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13050)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12021/*NewLine*/))(parseStart, pt);
    }

    auto reduce51_NewLine/*NewLine @string = EOF*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12007) stack1)
    {
        NonterminalType!(12021/*NewLine*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13051)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12021/*NewLine*/))(parseStart, pt);
    }

    auto reduce52_PPElif/*PPElif = WSC "#" WSC Identifier>>"elif" WSC repeatOrNone(Token) ^NewLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042) stack3, ParseStackElem!(Location, NonterminalType!12049) stack2/*, ParseStackElem!(Location, NonterminalType!12021) stack1*/)
    {
        NonterminalType!(12022/*PPElif*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13052)(parseStart, end, stack7, stack6, stack5, stack4, stack3, stack2);
        }
        return ParseStackElem!(Location, NonterminalType!(12022/*PPElif*/))(parseStart, pt);
    }

    auto reduce53_PPElse/*PPElse = WSC "#" WSC Identifier>>"else" WSC ^NewLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042) stack2/*, ParseStackElem!(Location, NonterminalType!12021) stack1*/)
    {
        NonterminalType!(12023/*PPElse*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13053)(parseStart, end, stack6, stack5, stack4, stack3, stack2);
        }
        return ParseStackElem!(Location, NonterminalType!(12023/*PPElse*/))(parseStart, pt);
    }

    auto reduce54_PPEndif/*PPEndif = WSC "#" WSC Identifier>>"endif" WSC ^NewLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042) stack2/*, ParseStackElem!(Location, NonterminalType!12021) stack1*/)
    {
        NonterminalType!(12024/*PPEndif*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13054)(parseStart, end, stack6, stack5, stack4, stack3, stack2);
        }
        return ParseStackElem!(Location, NonterminalType!(12024/*PPEndif*/))(parseStart, pt);
    }

    auto reduce55_PPError/*PPError = WSC "#" WSC Identifier>>"error" WSC repeatOrNone(Token) ^NewLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042) stack3, ParseStackElem!(Location, NonterminalType!12049) stack2/*, ParseStackElem!(Location, NonterminalType!12021) stack1*/)
    {
        NonterminalType!(12025/*PPError*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13055)(parseStart, end, stack7, stack6, stack5, stack4, stack3, stack2);
        }
        return ParseStackElem!(Location, NonterminalType!(12025/*PPError*/))(parseStart, pt);
    }

    auto reduce56_PPIf/*PPIf = WSC "#" WSC Identifier>>"if" WSC repeatOrNone(Token) ^NewLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042) stack3, ParseStackElem!(Location, NonterminalType!12049) stack2/*, ParseStackElem!(Location, NonterminalType!12021) stack1*/)
    {
        NonterminalType!(12026/*PPIf*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13056)(parseStart, end, stack7, stack6, stack5, stack4, stack3, stack2);
        }
        return ParseStackElem!(Location, NonterminalType!(12026/*PPIf*/))(parseStart, pt);
    }

    auto reduce57_PPIfDef/*PPIfDef = WSC "#" WSC Identifier>>"ifdef" WSC Token ^NewLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042) stack3, ParseStackElem!(Location, NonterminalType!12034) stack2/*, ParseStackElem!(Location, NonterminalType!12021) stack1*/)
    {
        NonterminalType!(12027/*PPIfDef*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13057)(parseStart, end, stack7, stack6, stack5, stack4, stack3, stack2);
        }
        return ParseStackElem!(Location, NonterminalType!(12027/*PPIfDef*/))(parseStart, pt);
    }

    auto reduce58_PPIfNDef/*PPIfNDef = WSC "#" WSC Identifier>>"ifndef" WSC Token ^NewLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042) stack3, ParseStackElem!(Location, NonterminalType!12034) stack2/*, ParseStackElem!(Location, NonterminalType!12021) stack1*/)
    {
        NonterminalType!(12028/*PPIfNDef*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13058)(parseStart, end, stack7, stack6, stack5, stack4, stack3, stack2);
        }
        return ParseStackElem!(Location, NonterminalType!(12028/*PPIfNDef*/))(parseStart, pt);
    }

    auto reduce59_PPWarning/*PPWarning = WSC "#" WSC Identifier>>"warning" WSC repeatOrNone(Token) ^NewLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042) stack3, ParseStackElem!(Location, NonterminalType!12049) stack2/*, ParseStackElem!(Location, NonterminalType!12021) stack1*/)
    {
        NonterminalType!(12029/*PPWarning*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13059)(parseStart, end, stack7, stack6, stack5, stack4, stack3, stack2);
        }
        return ParseStackElem!(Location, NonterminalType!(12029/*PPWarning*/))(parseStart, pt);
    }

    auto reduce60_ParamExpansion/*ParamExpansion = "#" WSC Identifier WSC*/(Location parseStart, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042) stack1)
    {
        NonterminalType!(12030/*ParamExpansion*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13060)(parseStart, end, stack4, stack3, stack2, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12030/*ParamExpansion*/))(parseStart, pt);
    }

    auto reduce61_Pragma/*Pragma = WSC "#" WSC Identifier>>"pragma" WSC repeatOrNone(Token) ^NewLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042) stack3, ParseStackElem!(Location, NonterminalType!12049) stack2/*, ParseStackElem!(Location, NonterminalType!12021) stack1*/)
    {
        NonterminalType!(12031/*Pragma*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13061)(parseStart, end, stack7, stack6, stack5, stack4, stack3, stack2);
        }
        return ParseStackElem!(Location, NonterminalType!(12031/*Pragma*/))(parseStart, pt);
    }

    auto reduce62_PreprocessingFile/*PreprocessingFile = Group?*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12014) stack1)
    {
        NonterminalType!(12032/*PreprocessingFile*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13062)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12032/*PreprocessingFile*/))(parseStart, pt);
    }

    auto reduce63_TextLine/*TextLine = WSC !"#" repeat(Token) NewLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack3, ParseStackElem!(Location, NonterminalType!12046) stack2, ParseStackElem!(Location, NonterminalType!12021) stack1)
    {
        NonterminalType!(12033/*TextLine*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13063)(parseStart, end, stack3, stack2, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12033/*TextLine*/))(parseStart, pt);
    }

    auto reduce64_Token/*Token = TokenX WSC*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12037) stack2, ParseStackElem!(Location, NonterminalType!12042) stack1)
    {
        NonterminalType!(12034/*Token*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13064)(parseStart, end, stack2, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12034/*Token*/))(parseStart, pt);
    }

    auto reduce65_TokenInFunc/*TokenInFunc = TokenXInFunc WSC*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12038) stack2, ParseStackElem!(Location, NonterminalType!12042) stack1)
    {
        NonterminalType!(12035/*TokenInFunc*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13065)(parseStart, end, stack2, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12035/*TokenInFunc*/))(parseStart, pt);
    }

    auto reduce66_TokenInFunc/*TokenInFunc = <ParamExpansion*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12030) stack1)
    {
        NonterminalType!(12035/*TokenInFunc*/) pt;
        pt = stack1.val;
        parseStart = stack1.start;
        return ParseStackElem!(Location, NonterminalType!(12035/*TokenInFunc*/))(parseStart, pt);
    }

    auto reduce67_TokenList/*TokenList @start = WSC repeatOrNone(Token)*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack2, ParseStackElem!(Location, NonterminalType!12049) stack1)
    {
        NonterminalType!(12036/*TokenList*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13067)(parseStart, end, stack2, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12036/*TokenList*/))(parseStart, pt);
    }

    auto reduce68_TokenX/*TokenX @string = AllOperators*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12000) stack1)
    {
        NonterminalType!(12037/*TokenX*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13068)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12037/*TokenX*/))(parseStart, pt);
    }

    auto reduce69_TokenX/*TokenX @string = StringLiteral*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12037/*TokenX*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13069)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12037/*TokenX*/))(parseStart, pt);
    }

    auto reduce70_TokenX/*TokenX @string = CharacterLiteral*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12037/*TokenX*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13070)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12037/*TokenX*/))(parseStart, pt);
    }

    auto reduce71_TokenX/*TokenX @string = PpNumber*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12037/*TokenX*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13071)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12037/*TokenX*/))(parseStart, pt);
    }

    auto reduce72_TokenX/*TokenX @string = Identifier*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12037/*TokenX*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13072)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12037/*TokenX*/))(parseStart, pt);
    }

    auto reduce73_TokenX/*TokenX @string = "#"*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12037/*TokenX*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13073)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12037/*TokenX*/))(parseStart, pt);
    }

    auto reduce74_TokenXInFunc/*TokenXInFunc @string = Operator*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12038/*TokenXInFunc*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13074)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12038/*TokenXInFunc*/))(parseStart, pt);
    }

    auto reduce75_TokenXInFunc/*TokenXInFunc @string = "("*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12038/*TokenXInFunc*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13075)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12038/*TokenXInFunc*/))(parseStart, pt);
    }

    auto reduce76_TokenXInFunc/*TokenXInFunc @string = ")"*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12038/*TokenXInFunc*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13076)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12038/*TokenXInFunc*/))(parseStart, pt);
    }

    auto reduce77_TokenXInFunc/*TokenXInFunc @string = ","*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12038/*TokenXInFunc*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13077)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12038/*TokenXInFunc*/))(parseStart, pt);
    }

    auto reduce78_TokenXInFunc/*TokenXInFunc @string = StringLiteral*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12038/*TokenXInFunc*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13078)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12038/*TokenXInFunc*/))(parseStart, pt);
    }

    auto reduce79_TokenXInFunc/*TokenXInFunc @string = CharacterLiteral*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12038/*TokenXInFunc*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13079)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12038/*TokenXInFunc*/))(parseStart, pt);
    }

    auto reduce80_TokenXInFunc/*TokenXInFunc @string = PpNumber*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12038/*TokenXInFunc*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13080)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12038/*TokenXInFunc*/))(parseStart, pt);
    }

    auto reduce81_TokenXInFunc/*TokenXInFunc @string = Identifier*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12038/*TokenXInFunc*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13081)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12038/*TokenXInFunc*/))(parseStart, pt);
    }

    auto reduce82_Undef/*Undef = WSC "#" WSC Identifier>>"undef" WSC Identifier WSC ^NewLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack8, ParseStackElem!(Location, Token) stack7, ParseStackElem!(Location, NonterminalType!12042) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042) stack2/*, ParseStackElem!(Location, NonterminalType!12021) stack1*/)
    {
        NonterminalType!(12039/*Undef*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13082)(parseStart, end, stack8, stack7, stack6, stack5, stack4, stack3, stack2);
        }
        return ParseStackElem!(Location, NonterminalType!(12039/*Undef*/))(parseStart, pt);
    }

    auto reduce83_VarDefine/*VarDefine = WSC "#" WSC Identifier>>"define" WSC VarDefineName WSC repeatOrNone(Token) ^NewLine*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12042) stack9, ParseStackElem!(Location, Token) stack8, ParseStackElem!(Location, NonterminalType!12042) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042) stack5, ParseStackElem!(Location, NonterminalType!12041) stack4, ParseStackElem!(Location, NonterminalType!12042) stack3, ParseStackElem!(Location, NonterminalType!12049) stack2/*, ParseStackElem!(Location, NonterminalType!12021) stack1*/)
    {
        NonterminalType!(12040/*VarDefine*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13083)(parseStart, end, stack9, stack8, stack7, stack6, stack5, stack4, stack3, stack2);
        }
        return ParseStackElem!(Location, NonterminalType!(12040/*VarDefine*/))(parseStart, pt);
    }

    auto reduce84_VarDefineName/*VarDefineName @string = Identifier !"("*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12041/*VarDefineName*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13084)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12041/*VarDefineName*/))(parseStart, pt);
    }

    auto reduce85_WSC/*WSC @array = WSC2 !WS !BlockComment !LineComment !EscapedNewline*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12043) stack1)
    {
        NonterminalType!(12042/*WSC*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13085)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12042/*WSC*/))(parseStart, pt);
    }

    auto reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/()
    {
        Location parseStart = lastTokenEnd;
        NonterminalType!(12042/*WSC*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13086)(parseStart, end);
        }
        return ParseStackElem!(Location, NonterminalType!(12042/*WSC*/))(parseStart, pt);
    }

    auto reduce87_WSC2/*WSC2 @array = repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12047) stack1)
    {
        NonterminalType!(12043/*WSC2*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13087)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12043/*WSC2*/))(parseStart, pt);
    }

    auto reduce88_WSCElem/*WSCElem @string = BlockComment*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12044/*WSCElem*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13088)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12044/*WSCElem*/))(parseStart, pt);
    }

    auto reduce89_WSCElem/*WSCElem @string = LineComment*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12044/*WSCElem*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13089)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12044/*WSCElem*/))(parseStart, pt);
    }

    auto reduce90_WSCElem/*WSCElem @string = WS*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12044/*WSCElem*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13090)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12044/*WSCElem*/))(parseStart, pt);
    }

    auto reduce91_WSCElem/*WSCElem @string = EscapedNewline*/(Location parseStart, ParseStackElem!(Location, Token) stack1)
    {
        NonterminalType!(12044/*WSCElem*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13091)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12044/*WSCElem*/))(parseStart, pt);
    }

    auto reduce92/*list(FuncParam, ",") @array = FuncParam*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12011) stack1)
    {
        NonterminalType!(12045/*list(FuncParam, ",")*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13092)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12045/*list(FuncParam, ",")*/))(parseStart, pt);
    }

    auto reduce93/*list(FuncParam, ",") @array = list(FuncParam, ",") "," FuncParam*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12045) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12011) stack1)
    {
        NonterminalType!(12045/*list(FuncParam, ",")*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13093)(parseStart, end, stack3, stack2, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12045/*list(FuncParam, ",")*/))(parseStart, pt);
    }

    auto reduce94/*repeat(Token) @array = repeat(Token) Token*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12046) stack2, ParseStackElem!(Location, NonterminalType!12034) stack1)
    {
        NonterminalType!(12046/*repeat(Token)*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13094)(parseStart, end, stack2, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12046/*repeat(Token)*/))(parseStart, pt);
    }

    auto reduce95/*repeat(Token) @array = Token*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12034) stack1)
    {
        NonterminalType!(12046/*repeat(Token)*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13095)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12046/*repeat(Token)*/))(parseStart, pt);
    }

    auto reduce96/*repeat(WSCElem) @array = repeat(WSCElem) WSCElem*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12047) stack2, ParseStackElem!(Location, NonterminalType!12044) stack1)
    {
        NonterminalType!(12047/*repeat(WSCElem)*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13096)(parseStart, end, stack2, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12047/*repeat(WSCElem)*/))(parseStart, pt);
    }

    auto reduce97/*repeat(WSCElem) @array = WSCElem*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12044) stack1)
    {
        NonterminalType!(12047/*repeat(WSCElem)*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13097)(parseStart, end, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12047/*repeat(WSCElem)*/))(parseStart, pt);
    }

    auto reduce98/*repeatOrNone(GroupPart) @array = repeatOrNone(GroupPart) GroupPart*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12048) stack2, ParseStackElem!(Location, NonterminalType!12015) stack1)
    {
        NonterminalType!(12048/*repeatOrNone(GroupPart)*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13098)(parseStart, end, stack2, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12048/*repeatOrNone(GroupPart)*/))(parseStart, pt);
    }

    auto reduce99/*repeatOrNone(GroupPart) @array = @empty*/()
    {
        Location parseStart = lastTokenEnd;
        NonterminalType!(12048/*repeatOrNone(GroupPart)*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13099)(parseStart, end);
        }
        return ParseStackElem!(Location, NonterminalType!(12048/*repeatOrNone(GroupPart)*/))(parseStart, pt);
    }

    auto reduce100/*repeatOrNone(Token) @array = repeatOrNone(Token) Token*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12049) stack2, ParseStackElem!(Location, NonterminalType!12034) stack1)
    {
        NonterminalType!(12049/*repeatOrNone(Token)*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13100)(parseStart, end, stack2, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12049/*repeatOrNone(Token)*/))(parseStart, pt);
    }

    auto reduce101/*repeatOrNone(Token) @array = @empty*/()
    {
        Location parseStart = lastTokenEnd;
        NonterminalType!(12049/*repeatOrNone(Token)*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13101)(parseStart, end);
        }
        return ParseStackElem!(Location, NonterminalType!(12049/*repeatOrNone(Token)*/))(parseStart, pt);
    }

    auto reduce102/*repeatOrNone(TokenInFunc) @array = repeatOrNone(TokenInFunc) TokenInFunc*/(Location parseStart, ParseStackElem!(Location, NonterminalType!12050) stack2, ParseStackElem!(Location, NonterminalType!12035) stack1)
    {
        NonterminalType!(12050/*repeatOrNone(TokenInFunc)*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13102)(parseStart, end, stack2, stack1);
        }
        return ParseStackElem!(Location, NonterminalType!(12050/*repeatOrNone(TokenInFunc)*/))(parseStart, pt);
    }

    auto reduce103/*repeatOrNone(TokenInFunc) @array = @empty*/()
    {
        Location parseStart = lastTokenEnd;
        NonterminalType!(12050/*repeatOrNone(TokenInFunc)*/) pt;
        {
            Location end = lastTokenEnd;
            if (end < parseStart)
                end = parseStart;

            pt = creator.createParseTree!(13103)(parseStart, end);
        }
        return ParseStackElem!(Location, NonterminalType!(12050/*repeatOrNone(TokenInFunc)*/))(parseStart, pt);
    }

    // path: PreprocessingFile
    // type: unknown
    //  PreprocessingFile -> .PreprocessingFile {$end} startElement
    //  PreprocessingFile -> .Group? {$end}
    //  Conditional       -> .ConditionalStart repeatOrNone(GroupPart) ConditionalNext {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalStart  -> .PPIf {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalStart  -> .PPIfDef {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalStart  -> .PPIfNDef {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine       -> .EmptyDirective {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine       -> .FuncDefine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine       -> .Include {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine       -> .IncludeNext {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine       -> .LineAnnotation {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine       -> .PPError {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine       -> .PPWarning {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine       -> .Pragma {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine       -> .Undef {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine       -> .VarDefine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EmptyDirective    -> .WSC "#" WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EmptyLine         -> .WSC2 NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EmptyLine         -> .NL {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  FuncDefine        -> .WSC "#" WSC Identifier>>"define" WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Group             -> .Group GroupPart {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Group             -> .GroupPart {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Group?            -> . {$end}
    //  Group?            -> .Group {$end}
    //  GroupPart         -> .Conditional {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  GroupPart         -> .ControlLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  GroupPart         -> .EmptyLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  GroupPart         -> .TextLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Include           -> .WSC "#" WSC Identifier>>"include" HeaderPart WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  IncludeNext       -> .WSC "#" WSC Identifier>>"include_next" HeaderPart WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation    -> .WSC "#" WSC Identifier>>"line" WSC PpNumber WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation    -> .WSC "#" WSC Identifier>>"line" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation    -> .WSC "#" WSC PpNumber WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation    -> .WSC "#" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPError           -> .WSC "#" WSC Identifier>>"error" WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIf              -> .WSC "#" WSC Identifier>>"if" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfDef           -> .WSC "#" WSC Identifier>>"ifdef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfNDef          -> .WSC "#" WSC Identifier>>"ifndef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPWarning         -> .WSC "#" WSC Identifier>>"warning" WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Pragma            -> .WSC "#" WSC Identifier>>"pragma" WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TextLine          -> .WSC !"#" repeat(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Undef             -> .WSC "#" WSC Identifier>>"undef" WSC Identifier WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  VarDefine         -> .WSC "#" WSC Identifier>>"define" WSC VarDefineName WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC               -> . !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    //  WSC               -> .WSC2 !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    //  WSC2              -> .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem           -> .BlockComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem           -> .EscapedNewline {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem           -> .LineComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem           -> .WS {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem)   -> .WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem)   -> .repeat(WSCElem) WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    int parsePreprocessingFile/*0*/(ref NonterminalType!(12032) result, ref Location resultLocation)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12001, 12005, 12006, 12008, 12009, 12010, 12013, 12014, 12015, 12018, 12019, 12020, 12025, 12026, 12027, 12028, 12029, 12031, 12032, 12033, 12039, 12040, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce35/*Group? = [virtual]*/();
            currentResult = ParseResultIn.create(12014/*Group?*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"#"} || lexer.front.symbol == Lexer.tokenID!q{"("} || lexer.front.symbol == Lexer.tokenID!q{")"} || lexer.front.symbol == Lexer.tokenID!q{","} || lexer.front.symbol == Lexer.tokenID!"CharacterLiteral" || lexer.front.symbol == Lexer.tokenID!"Identifier" || lexer.front.symbol == Lexer.tokenID!"Operator" || lexer.front.symbol == Lexer.tokenID!"PpNumber" || lexer.front.symbol == Lexer.tokenID!"StringLiteral")
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12009) r;
            Location rl;
            gotoParent = parse14(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12009/*EmptyLine*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce35/*Group? = [virtual]*/();
            currentResult = ParseResultIn.create(12014/*Group?*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12001/*Conditional*/)
            {
                currentResult = ParseResultIn.create(12015/*GroupPart*/, currentResult.get!(12001/*Conditional*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12005/*ConditionalStart*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12005/*ConditionalStart*/)(currentResultLocation, currentResult.get!(12005/*ConditionalStart*/)());
                NonterminalType!(12001) r;
                Location rl;
                gotoParent = parse2(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12001/*Conditional*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12006/*ControlLine*/)
            {
                currentResult = ParseResultIn.create(12015/*GroupPart*/, currentResult.get!(12006/*ControlLine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12008/*EmptyDirective*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12008/*EmptyDirective*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12009/*EmptyLine*/)
            {
                currentResult = ParseResultIn.create(12015/*GroupPart*/, currentResult.get!(12009/*EmptyLine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12010/*FuncDefine*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12010/*FuncDefine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12013/*Group*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12013/*Group*/)(currentResultLocation, currentResult.get!(12013/*Group*/)());
                CreatorInstance.NonterminalUnion!([12013, 12014]) r;
                Location rl;
                gotoParent = parse170(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12014/*Group?*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12014/*Group?*/)(currentResultLocation, currentResult.get!(12014/*Group?*/)());
                NonterminalType!(12032) r;
                Location rl;
                gotoParent = parse175(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12032/*PreprocessingFile*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12015/*GroupPart*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12015/*GroupPart*/)(currentResultLocation, currentResult.get!(12015/*GroupPart*/)());
                NonterminalType!(12013) r;
                Location rl;
                gotoParent = parse176(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12013/*Group*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12018/*Include*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12018/*Include*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12019/*IncludeNext*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12019/*IncludeNext*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12020/*LineAnnotation*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12020/*LineAnnotation*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12025/*PPError*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12025/*PPError*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12026/*PPIf*/)
            {
                currentResult = ParseResultIn.create(12005/*ConditionalStart*/, currentResult.get!(12026/*PPIf*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12027/*PPIfDef*/)
            {
                currentResult = ParseResultIn.create(12005/*ConditionalStart*/, currentResult.get!(12027/*PPIfDef*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12028/*PPIfNDef*/)
            {
                currentResult = ParseResultIn.create(12005/*ConditionalStart*/, currentResult.get!(12028/*PPIfNDef*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12029/*PPWarning*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12029/*PPWarning*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12031/*Pragma*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12031/*Pragma*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12032/*PreprocessingFile*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12032/*PreprocessingFile*/)(currentResultLocation, currentResult.get!(12032/*PreprocessingFile*/)());
                NonterminalType!(12032) r;
                Location rl;
                gotoParent = parse177(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                auto tree = r;
                result = tree;
                resultLocation = rl;
                return 0;
            }
            else if (currentResult.nonterminalID == 12033/*TextLine*/)
            {
                currentResult = ParseResultIn.create(12015/*GroupPart*/, currentResult.get!(12033/*TextLine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12039/*Undef*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12039/*Undef*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12040/*VarDefine*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12040/*VarDefine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                CreatorInstance.NonterminalUnion!([12008, 12010, 12018, 12019, 12020, 12025, 12026, 12027, 12028, 12029, 12031, 12033, 12039, 12040]) r;
                Location rl;
                gotoParent = parse172(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                CreatorInstance.NonterminalUnion!([12009, 12042]) r;
                Location rl;
                gotoParent = parse157(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        auto tree = currentResult.get!(12032);
        result = tree;
        resultLocation = currentResultLocation;
        return 0;
    }
    // path: PreprocessingFile ConditionalStart
    // type: unknown
    //  Conditional             ->  ConditionalStart.repeatOrNone(GroupPart) ConditionalNext {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(GroupPart) ->                  . {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(GroupPart) ->                  .repeatOrNone(GroupPart) GroupPart {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse2(ref NonterminalType!(12001) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12005/*ConditionalStart*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12001, 12048]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce99/*repeatOrNone(GroupPart) @array = @empty*/();
            currentResult = ParseResultIn.create(12048/*repeatOrNone(GroupPart)*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12048/*repeatOrNone(GroupPart)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12048/*repeatOrNone(GroupPart)*/)(currentResultLocation, currentResult.get!(12048/*repeatOrNone(GroupPart)*/)());
                CreatorInstance.NonterminalUnion!([12001, 12048]) r;
                Location rl;
                gotoParent = parse3(r, rl, parseStart1, stack1, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12001/*Conditional*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart)
    // type: unknown
    //  Conditional             ->  ConditionalStart repeatOrNone(GroupPart).ConditionalNext {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(GroupPart) ->                   repeatOrNone(GroupPart).GroupPart {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Conditional             ->                                          .ConditionalStart repeatOrNone(GroupPart) ConditionalNext {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalElif         ->                                          .PPElif repeatOrNone(GroupPart) ConditionalNext {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalElse         ->                                          .PPElse repeatOrNone(GroupPart) PPEndif {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalNext         ->                                          .ConditionalElif {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalNext         ->                                          .ConditionalElse {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalNext         ->                                          .PPEndif {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalStart        ->                                          .PPIf {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalStart        ->                                          .PPIfDef {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalStart        ->                                          .PPIfNDef {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                          .EmptyDirective {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                          .FuncDefine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                          .Include {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                          .IncludeNext {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                          .LineAnnotation {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                          .PPError {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                          .PPWarning {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                          .Pragma {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                          .Undef {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                          .VarDefine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EmptyDirective          ->                                          .WSC "#" WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EmptyLine               ->                                          .WSC2 NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EmptyLine               ->                                          .NL {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  FuncDefine              ->                                          .WSC "#" WSC Identifier>>"define" WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  GroupPart               ->                                          .Conditional {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  GroupPart               ->                                          .ControlLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  GroupPart               ->                                          .EmptyLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  GroupPart               ->                                          .TextLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Include                 ->                                          .WSC "#" WSC Identifier>>"include" HeaderPart WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  IncludeNext             ->                                          .WSC "#" WSC Identifier>>"include_next" HeaderPart WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation          ->                                          .WSC "#" WSC Identifier>>"line" WSC PpNumber WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation          ->                                          .WSC "#" WSC Identifier>>"line" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation          ->                                          .WSC "#" WSC PpNumber WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation          ->                                          .WSC "#" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPElif                  ->                                          .WSC "#" WSC Identifier>>"elif" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPElse                  ->                                          .WSC "#" WSC Identifier>>"else" WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPEndif                 ->                                          .WSC "#" WSC Identifier>>"endif" WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPError                 ->                                          .WSC "#" WSC Identifier>>"error" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIf                    ->                                          .WSC "#" WSC Identifier>>"if" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfDef                 ->                                          .WSC "#" WSC Identifier>>"ifdef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfNDef                ->                                          .WSC "#" WSC Identifier>>"ifndef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPWarning               ->                                          .WSC "#" WSC Identifier>>"warning" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Pragma                  ->                                          .WSC "#" WSC Identifier>>"pragma" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TextLine                ->                                          .WSC !"#" repeat(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Undef                   ->                                          .WSC "#" WSC Identifier>>"undef" WSC Identifier WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  VarDefine               ->                                          .WSC "#" WSC Identifier>>"define" WSC VarDefineName WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC                     ->                                          . !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    //  WSC                     ->                                          .WSC2 !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    //  WSC2                    ->                                          .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem                 ->                                          .BlockComment {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem                 ->                                          .EscapedNewline {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem                 ->                                          .LineComment {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem                 ->                                          .WS {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem)         ->                                          .WSCElem {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem)         ->                                          .repeat(WSCElem) WSCElem {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse3(ref CreatorInstance.NonterminalUnion!([12001, 12048]) result, ref Location resultLocation, Location parseStart2, ParseStackElem!(Location, NonterminalType!12005/*ConditionalStart*/) stack2, Location parseStart1, ParseStackElem!(Location, NonterminalType!12048/*repeatOrNone(GroupPart)*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12001, 12002, 12003, 12004, 12005, 12006, 12008, 12009, 12010, 12015, 12018, 12019, 12020, 12022, 12023, 12024, 12025, 12026, 12027, 12028, 12029, 12031, 12033, 12039, 12040, 12042, 12043, 12044, 12047, 12048]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12009) r;
            Location rl;
            gotoParent = parse14(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12009/*EmptyLine*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12001/*Conditional*/)
            {
                currentResult = ParseResultIn.create(12015/*GroupPart*/, currentResult.get!(12001/*Conditional*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12002/*ConditionalElif*/)
            {
                currentResult = ParseResultIn.create(12004/*ConditionalNext*/, currentResult.get!(12002/*ConditionalElif*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12003/*ConditionalElse*/)
            {
                currentResult = ParseResultIn.create(12004/*ConditionalNext*/, currentResult.get!(12003/*ConditionalElse*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12004/*ConditionalNext*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12004/*ConditionalNext*/)(currentResultLocation, currentResult.get!(12004/*ConditionalNext*/)());
                NonterminalType!(12001) r;
                Location rl;
                gotoParent = parse6(r, rl, parseStart2, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12001/*Conditional*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12005/*ConditionalStart*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12005/*ConditionalStart*/)(currentResultLocation, currentResult.get!(12005/*ConditionalStart*/)());
                NonterminalType!(12001) r;
                Location rl;
                gotoParent = parse2(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12001/*Conditional*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12006/*ControlLine*/)
            {
                currentResult = ParseResultIn.create(12015/*GroupPart*/, currentResult.get!(12006/*ControlLine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12008/*EmptyDirective*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12008/*EmptyDirective*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12009/*EmptyLine*/)
            {
                currentResult = ParseResultIn.create(12015/*GroupPart*/, currentResult.get!(12009/*EmptyLine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12010/*FuncDefine*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12010/*FuncDefine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12015/*GroupPart*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12015/*GroupPart*/)(currentResultLocation, currentResult.get!(12015/*GroupPart*/)());
                NonterminalType!(12048) r;
                Location rl;
                gotoParent = parse15(r, rl, parseStart1, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12048/*repeatOrNone(GroupPart)*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12018/*Include*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12018/*Include*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12019/*IncludeNext*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12019/*IncludeNext*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12020/*LineAnnotation*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12020/*LineAnnotation*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12022/*PPElif*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12022/*PPElif*/)(currentResultLocation, currentResult.get!(12022/*PPElif*/)());
                NonterminalType!(12002) r;
                Location rl;
                gotoParent = parse20(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12002/*ConditionalElif*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12023/*PPElse*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12023/*PPElse*/)(currentResultLocation, currentResult.get!(12023/*PPElse*/)());
                NonterminalType!(12003) r;
                Location rl;
                gotoParent = parse23(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12003/*ConditionalElse*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12024/*PPEndif*/)
            {
                currentResult = ParseResultIn.create(12004/*ConditionalNext*/, currentResult.get!(12024/*PPEndif*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12025/*PPError*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12025/*PPError*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12026/*PPIf*/)
            {
                currentResult = ParseResultIn.create(12005/*ConditionalStart*/, currentResult.get!(12026/*PPIf*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12027/*PPIfDef*/)
            {
                currentResult = ParseResultIn.create(12005/*ConditionalStart*/, currentResult.get!(12027/*PPIfDef*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12028/*PPIfNDef*/)
            {
                currentResult = ParseResultIn.create(12005/*ConditionalStart*/, currentResult.get!(12028/*PPIfNDef*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12029/*PPWarning*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12029/*PPWarning*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12031/*Pragma*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12031/*Pragma*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12033/*TextLine*/)
            {
                currentResult = ParseResultIn.create(12015/*GroupPart*/, currentResult.get!(12033/*TextLine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12039/*Undef*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12039/*Undef*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12040/*VarDefine*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12040/*VarDefine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                CreatorInstance.NonterminalUnion!([12008, 12010, 12018, 12019, 12020, 12022, 12023, 12024, 12025, 12026, 12027, 12028, 12029, 12031, 12033, 12039, 12040]) r;
                Location rl;
                gotoParent = parse160(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                CreatorInstance.NonterminalUnion!([12009, 12042]) r;
                Location rl;
                gotoParent = parse157(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) ConditionalNext
    // type: unknown
    //  Conditional ->  ConditionalStart repeatOrNone(GroupPart) ConditionalNext. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse6(ref NonterminalType!(12001) result, ref Location resultLocation, Location parseStart3, ParseStackElem!(Location, NonterminalType!12005/*ConditionalStart*/) stack3, ParseStackElem!(Location, NonterminalType!12048/*repeatOrNone(GroupPart)*/) stack2, ParseStackElem!(Location, NonterminalType!12004/*ConditionalNext*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce4_Conditional/*Conditional = ConditionalStart repeatOrNone(GroupPart) ConditionalNext*/(parseStart3, stack3, stack2, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 2;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) BlockComment
    // type: unknown
    //  WSCElem ->  BlockComment. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, HeaderNameSys, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse7(ref NonterminalType!(12044) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce88_WSCElem/*WSCElem @string = BlockComment*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) EscapedNewline
    // type: unknown
    //  WSCElem ->  EscapedNewline. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, HeaderNameSys, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse9(ref NonterminalType!(12044) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce91_WSCElem/*WSCElem @string = EscapedNewline*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) LineComment
    // type: unknown
    //  WSCElem ->  LineComment. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, HeaderNameSys, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse13(ref NonterminalType!(12044) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce89_WSCElem/*WSCElem @string = LineComment*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) NL
    // type: unknown
    //  EmptyLine ->  NL. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse14(ref NonterminalType!(12009) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce25_EmptyLine/*EmptyLine = NL*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) GroupPart
    // type: unknown
    //  repeatOrNone(GroupPart) ->  repeatOrNone(GroupPart) GroupPart. {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse15(ref NonterminalType!(12048) result, ref Location resultLocation, Location parseStart2, ParseStackElem!(Location, NonterminalType!12048/*repeatOrNone(GroupPart)*/) stack2, ParseStackElem!(Location, NonterminalType!12015/*GroupPart*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce98/*repeatOrNone(GroupPart) @array = repeatOrNone(GroupPart) GroupPart*/(parseStart2, stack2, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 1;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) WS
    // type: unknown
    //  WSCElem ->  WS. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, HeaderNameSys, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse16(ref NonterminalType!(12044) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce90_WSCElem/*WSCElem @string = WS*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif
    // type: unknown
    //  ConditionalElif         ->  PPElif.repeatOrNone(GroupPart) ConditionalNext {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(GroupPart) ->        . {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(GroupPart) ->        .repeatOrNone(GroupPart) GroupPart {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse20(ref NonterminalType!(12002) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12022/*PPElif*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12002, 12048]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce99/*repeatOrNone(GroupPart) @array = @empty*/();
            currentResult = ParseResultIn.create(12048/*repeatOrNone(GroupPart)*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12048/*repeatOrNone(GroupPart)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12048/*repeatOrNone(GroupPart)*/)(currentResultLocation, currentResult.get!(12048/*repeatOrNone(GroupPart)*/)());
                CreatorInstance.NonterminalUnion!([12002, 12048]) r;
                Location rl;
                gotoParent = parse21(r, rl, parseStart1, stack1, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12002/*ConditionalElif*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart)
    // type: unknown
    //  ConditionalElif         ->  PPElif repeatOrNone(GroupPart).ConditionalNext {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(GroupPart) ->         repeatOrNone(GroupPart).GroupPart {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Conditional             ->                                .ConditionalStart repeatOrNone(GroupPart) ConditionalNext {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalElif         ->                                .PPElif repeatOrNone(GroupPart) ConditionalNext {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalElse         ->                                .PPElse repeatOrNone(GroupPart) PPEndif {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalNext         ->                                .ConditionalElif {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalNext         ->                                .ConditionalElse {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalNext         ->                                .PPEndif {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalStart        ->                                .PPIf {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalStart        ->                                .PPIfDef {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalStart        ->                                .PPIfNDef {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                .EmptyDirective {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                .FuncDefine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                .Include {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                .IncludeNext {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                .LineAnnotation {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                .PPError {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                .PPWarning {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                .Pragma {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                .Undef {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                .VarDefine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EmptyDirective          ->                                .WSC "#" WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EmptyLine               ->                                .WSC2 NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EmptyLine               ->                                .NL {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  FuncDefine              ->                                .WSC "#" WSC Identifier>>"define" WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  GroupPart               ->                                .Conditional {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  GroupPart               ->                                .ControlLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  GroupPart               ->                                .EmptyLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  GroupPart               ->                                .TextLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Include                 ->                                .WSC "#" WSC Identifier>>"include" HeaderPart WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  IncludeNext             ->                                .WSC "#" WSC Identifier>>"include_next" HeaderPart WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation          ->                                .WSC "#" WSC Identifier>>"line" WSC PpNumber WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation          ->                                .WSC "#" WSC Identifier>>"line" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation          ->                                .WSC "#" WSC PpNumber WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation          ->                                .WSC "#" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPElif                  ->                                .WSC "#" WSC Identifier>>"elif" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPElse                  ->                                .WSC "#" WSC Identifier>>"else" WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPEndif                 ->                                .WSC "#" WSC Identifier>>"endif" WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPError                 ->                                .WSC "#" WSC Identifier>>"error" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIf                    ->                                .WSC "#" WSC Identifier>>"if" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfDef                 ->                                .WSC "#" WSC Identifier>>"ifdef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfNDef                ->                                .WSC "#" WSC Identifier>>"ifndef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPWarning               ->                                .WSC "#" WSC Identifier>>"warning" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Pragma                  ->                                .WSC "#" WSC Identifier>>"pragma" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TextLine                ->                                .WSC !"#" repeat(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Undef                   ->                                .WSC "#" WSC Identifier>>"undef" WSC Identifier WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  VarDefine               ->                                .WSC "#" WSC Identifier>>"define" WSC VarDefineName WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC                     ->                                . !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    //  WSC                     ->                                .WSC2 !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    //  WSC2                    ->                                .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem                 ->                                .BlockComment {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem                 ->                                .EscapedNewline {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem                 ->                                .LineComment {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem                 ->                                .WS {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem)         ->                                .WSCElem {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem)         ->                                .repeat(WSCElem) WSCElem {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse21(ref CreatorInstance.NonterminalUnion!([12002, 12048]) result, ref Location resultLocation, Location parseStart2, ParseStackElem!(Location, NonterminalType!12022/*PPElif*/) stack2, Location parseStart1, ParseStackElem!(Location, NonterminalType!12048/*repeatOrNone(GroupPart)*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12001, 12002, 12003, 12004, 12005, 12006, 12008, 12009, 12010, 12015, 12018, 12019, 12020, 12022, 12023, 12024, 12025, 12026, 12027, 12028, 12029, 12031, 12033, 12039, 12040, 12042, 12043, 12044, 12047, 12048]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12009) r;
            Location rl;
            gotoParent = parse14(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12009/*EmptyLine*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12001/*Conditional*/)
            {
                currentResult = ParseResultIn.create(12015/*GroupPart*/, currentResult.get!(12001/*Conditional*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12002/*ConditionalElif*/)
            {
                currentResult = ParseResultIn.create(12004/*ConditionalNext*/, currentResult.get!(12002/*ConditionalElif*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12003/*ConditionalElse*/)
            {
                currentResult = ParseResultIn.create(12004/*ConditionalNext*/, currentResult.get!(12003/*ConditionalElse*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12004/*ConditionalNext*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12004/*ConditionalNext*/)(currentResultLocation, currentResult.get!(12004/*ConditionalNext*/)());
                NonterminalType!(12002) r;
                Location rl;
                gotoParent = parse22(r, rl, parseStart2, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12002/*ConditionalElif*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12005/*ConditionalStart*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12005/*ConditionalStart*/)(currentResultLocation, currentResult.get!(12005/*ConditionalStart*/)());
                NonterminalType!(12001) r;
                Location rl;
                gotoParent = parse2(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12001/*Conditional*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12006/*ControlLine*/)
            {
                currentResult = ParseResultIn.create(12015/*GroupPart*/, currentResult.get!(12006/*ControlLine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12008/*EmptyDirective*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12008/*EmptyDirective*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12009/*EmptyLine*/)
            {
                currentResult = ParseResultIn.create(12015/*GroupPart*/, currentResult.get!(12009/*EmptyLine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12010/*FuncDefine*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12010/*FuncDefine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12015/*GroupPart*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12015/*GroupPart*/)(currentResultLocation, currentResult.get!(12015/*GroupPart*/)());
                NonterminalType!(12048) r;
                Location rl;
                gotoParent = parse15(r, rl, parseStart1, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12048/*repeatOrNone(GroupPart)*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12018/*Include*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12018/*Include*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12019/*IncludeNext*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12019/*IncludeNext*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12020/*LineAnnotation*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12020/*LineAnnotation*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12022/*PPElif*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12022/*PPElif*/)(currentResultLocation, currentResult.get!(12022/*PPElif*/)());
                NonterminalType!(12002) r;
                Location rl;
                gotoParent = parse20(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12002/*ConditionalElif*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12023/*PPElse*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12023/*PPElse*/)(currentResultLocation, currentResult.get!(12023/*PPElse*/)());
                NonterminalType!(12003) r;
                Location rl;
                gotoParent = parse23(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12003/*ConditionalElse*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12024/*PPEndif*/)
            {
                currentResult = ParseResultIn.create(12004/*ConditionalNext*/, currentResult.get!(12024/*PPEndif*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12025/*PPError*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12025/*PPError*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12026/*PPIf*/)
            {
                currentResult = ParseResultIn.create(12005/*ConditionalStart*/, currentResult.get!(12026/*PPIf*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12027/*PPIfDef*/)
            {
                currentResult = ParseResultIn.create(12005/*ConditionalStart*/, currentResult.get!(12027/*PPIfDef*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12028/*PPIfNDef*/)
            {
                currentResult = ParseResultIn.create(12005/*ConditionalStart*/, currentResult.get!(12028/*PPIfNDef*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12029/*PPWarning*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12029/*PPWarning*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12031/*Pragma*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12031/*Pragma*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12033/*TextLine*/)
            {
                currentResult = ParseResultIn.create(12015/*GroupPart*/, currentResult.get!(12033/*TextLine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12039/*Undef*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12039/*Undef*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12040/*VarDefine*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12040/*VarDefine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                CreatorInstance.NonterminalUnion!([12008, 12010, 12018, 12019, 12020, 12022, 12023, 12024, 12025, 12026, 12027, 12028, 12029, 12031, 12033, 12039, 12040]) r;
                Location rl;
                gotoParent = parse160(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                CreatorInstance.NonterminalUnion!([12009, 12042]) r;
                Location rl;
                gotoParent = parse157(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) ConditionalNext
    // type: unknown
    //  ConditionalElif ->  PPElif repeatOrNone(GroupPart) ConditionalNext. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse22(ref NonterminalType!(12002) result, ref Location resultLocation, Location parseStart3, ParseStackElem!(Location, NonterminalType!12022/*PPElif*/) stack3, ParseStackElem!(Location, NonterminalType!12048/*repeatOrNone(GroupPart)*/) stack2, ParseStackElem!(Location, NonterminalType!12004/*ConditionalNext*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce5_ConditionalElif/*ConditionalElif = PPElif repeatOrNone(GroupPart) ConditionalNext*/(parseStart3, stack3, stack2, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 2;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse
    // type: unknown
    //  ConditionalElse         ->  PPElse.repeatOrNone(GroupPart) PPEndif {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(GroupPart) ->        . {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(GroupPart) ->        .repeatOrNone(GroupPart) GroupPart {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse23(ref NonterminalType!(12003) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12023/*PPElse*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12003, 12048]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce99/*repeatOrNone(GroupPart) @array = @empty*/();
            currentResult = ParseResultIn.create(12048/*repeatOrNone(GroupPart)*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12048/*repeatOrNone(GroupPart)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12048/*repeatOrNone(GroupPart)*/)(currentResultLocation, currentResult.get!(12048/*repeatOrNone(GroupPart)*/)());
                CreatorInstance.NonterminalUnion!([12003, 12048]) r;
                Location rl;
                gotoParent = parse24(r, rl, parseStart1, stack1, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12003/*ConditionalElse*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart)
    // type: unknown
    //  ConditionalElse         ->  PPElse repeatOrNone(GroupPart).PPEndif {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(GroupPart) ->         repeatOrNone(GroupPart).GroupPart {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Conditional             ->                                .ConditionalStart repeatOrNone(GroupPart) ConditionalNext {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalStart        ->                                .PPIf {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalStart        ->                                .PPIfDef {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalStart        ->                                .PPIfNDef {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                .EmptyDirective {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                .FuncDefine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                .Include {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                .IncludeNext {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                .LineAnnotation {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                .PPError {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                .PPWarning {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                .Pragma {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                .Undef {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine             ->                                .VarDefine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EmptyDirective          ->                                .WSC "#" WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EmptyLine               ->                                .WSC2 NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EmptyLine               ->                                .NL {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  FuncDefine              ->                                .WSC "#" WSC Identifier>>"define" WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  GroupPart               ->                                .Conditional {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  GroupPart               ->                                .ControlLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  GroupPart               ->                                .EmptyLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  GroupPart               ->                                .TextLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Include                 ->                                .WSC "#" WSC Identifier>>"include" HeaderPart WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  IncludeNext             ->                                .WSC "#" WSC Identifier>>"include_next" HeaderPart WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation          ->                                .WSC "#" WSC Identifier>>"line" WSC PpNumber WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation          ->                                .WSC "#" WSC Identifier>>"line" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation          ->                                .WSC "#" WSC PpNumber WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation          ->                                .WSC "#" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPEndif                 ->                                .WSC "#" WSC Identifier>>"endif" WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPError                 ->                                .WSC "#" WSC Identifier>>"error" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIf                    ->                                .WSC "#" WSC Identifier>>"if" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfDef                 ->                                .WSC "#" WSC Identifier>>"ifdef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfNDef                ->                                .WSC "#" WSC Identifier>>"ifndef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPWarning               ->                                .WSC "#" WSC Identifier>>"warning" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Pragma                  ->                                .WSC "#" WSC Identifier>>"pragma" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TextLine                ->                                .WSC !"#" repeat(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Undef                   ->                                .WSC "#" WSC Identifier>>"undef" WSC Identifier WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  VarDefine               ->                                .WSC "#" WSC Identifier>>"define" WSC VarDefineName WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC                     ->                                . !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    //  WSC                     ->                                .WSC2 !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    //  WSC2                    ->                                .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem                 ->                                .BlockComment {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem                 ->                                .EscapedNewline {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem                 ->                                .LineComment {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem                 ->                                .WS {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem)         ->                                .WSCElem {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem)         ->                                .repeat(WSCElem) WSCElem {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse24(ref CreatorInstance.NonterminalUnion!([12003, 12048]) result, ref Location resultLocation, Location parseStart2, ParseStackElem!(Location, NonterminalType!12023/*PPElse*/) stack2, Location parseStart1, ParseStackElem!(Location, NonterminalType!12048/*repeatOrNone(GroupPart)*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12001, 12003, 12005, 12006, 12008, 12009, 12010, 12015, 12018, 12019, 12020, 12024, 12025, 12026, 12027, 12028, 12029, 12031, 12033, 12039, 12040, 12042, 12043, 12044, 12047, 12048]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12009) r;
            Location rl;
            gotoParent = parse14(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12009/*EmptyLine*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12001/*Conditional*/)
            {
                currentResult = ParseResultIn.create(12015/*GroupPart*/, currentResult.get!(12001/*Conditional*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12005/*ConditionalStart*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12005/*ConditionalStart*/)(currentResultLocation, currentResult.get!(12005/*ConditionalStart*/)());
                NonterminalType!(12001) r;
                Location rl;
                gotoParent = parse2(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12001/*Conditional*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12006/*ControlLine*/)
            {
                currentResult = ParseResultIn.create(12015/*GroupPart*/, currentResult.get!(12006/*ControlLine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12008/*EmptyDirective*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12008/*EmptyDirective*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12009/*EmptyLine*/)
            {
                currentResult = ParseResultIn.create(12015/*GroupPart*/, currentResult.get!(12009/*EmptyLine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12010/*FuncDefine*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12010/*FuncDefine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12015/*GroupPart*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12015/*GroupPart*/)(currentResultLocation, currentResult.get!(12015/*GroupPart*/)());
                NonterminalType!(12048) r;
                Location rl;
                gotoParent = parse15(r, rl, parseStart1, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12048/*repeatOrNone(GroupPart)*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12018/*Include*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12018/*Include*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12019/*IncludeNext*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12019/*IncludeNext*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12020/*LineAnnotation*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12020/*LineAnnotation*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12024/*PPEndif*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12024/*PPEndif*/)(currentResultLocation, currentResult.get!(12024/*PPEndif*/)());
                NonterminalType!(12003) r;
                Location rl;
                gotoParent = parse25(r, rl, parseStart2, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12003/*ConditionalElse*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12025/*PPError*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12025/*PPError*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12026/*PPIf*/)
            {
                currentResult = ParseResultIn.create(12005/*ConditionalStart*/, currentResult.get!(12026/*PPIf*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12027/*PPIfDef*/)
            {
                currentResult = ParseResultIn.create(12005/*ConditionalStart*/, currentResult.get!(12027/*PPIfDef*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12028/*PPIfNDef*/)
            {
                currentResult = ParseResultIn.create(12005/*ConditionalStart*/, currentResult.get!(12028/*PPIfNDef*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12029/*PPWarning*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12029/*PPWarning*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12031/*Pragma*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12031/*Pragma*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12033/*TextLine*/)
            {
                currentResult = ParseResultIn.create(12015/*GroupPart*/, currentResult.get!(12033/*TextLine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12039/*Undef*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12039/*Undef*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12040/*VarDefine*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12040/*VarDefine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                CreatorInstance.NonterminalUnion!([12008, 12010, 12018, 12019, 12020, 12024, 12025, 12026, 12027, 12028, 12029, 12031, 12033, 12039, 12040]) r;
                Location rl;
                gotoParent = parse35(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                CreatorInstance.NonterminalUnion!([12009, 12042]) r;
                Location rl;
                gotoParent = parse157(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) PPEndif
    // type: unknown
    //  ConditionalElse ->  PPElse repeatOrNone(GroupPart) PPEndif. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse25(ref NonterminalType!(12003) result, ref Location resultLocation, Location parseStart3, ParseStackElem!(Location, NonterminalType!12023/*PPElse*/) stack3, ParseStackElem!(Location, NonterminalType!12048/*repeatOrNone(GroupPart)*/) stack2, ParseStackElem!(Location, NonterminalType!12024/*PPEndif*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce6_ConditionalElse/*ConditionalElse = PPElse repeatOrNone(GroupPart) PPEndif*/(parseStart3, stack3, stack2, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 2;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC
    // type: unknown
    //  EmptyDirective ->           WSC."#" WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  FuncDefine     ->           WSC."#" WSC Identifier>>"define" WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Include        ->           WSC."#" WSC Identifier>>"include" HeaderPart WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  IncludeNext    ->           WSC."#" WSC Identifier>>"include_next" HeaderPart WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->           WSC."#" WSC Identifier>>"line" WSC PpNumber WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->           WSC."#" WSC Identifier>>"line" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->           WSC."#" WSC PpNumber WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->           WSC."#" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPEndif        ->           WSC."#" WSC Identifier>>"endif" WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPError        ->           WSC."#" WSC Identifier>>"error" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIf           ->           WSC."#" WSC Identifier>>"if" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfDef        ->           WSC."#" WSC Identifier>>"ifdef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfNDef       ->           WSC."#" WSC Identifier>>"ifndef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPWarning      ->           WSC."#" WSC Identifier>>"warning" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Pragma         ->           WSC."#" WSC Identifier>>"pragma" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TextLine       ->           WSC.!"#" repeat(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Undef          ->           WSC."#" WSC Identifier>>"undef" WSC Identifier WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  VarDefine      ->           WSC."#" WSC Identifier>>"define" WSC VarDefineName WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators   ->              .!"#" "(" {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators   ->              .!"#" ")" {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators   ->              .!"#" "," {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators   ->              .!"#" Operator {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Token          ->              .!"#" TokenX WSC {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX         ->              .!"#" AllOperators {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX         -> @@disabled@@ ."#" {}
    //  TokenX         ->              .!"#" CharacterLiteral {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX         ->              .!"#" Identifier {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX         ->              .!"#" PpNumber {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX         ->              .!"#" StringLiteral {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(Token)  ->              .!"#" Token {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(Token)  ->              .!"#" repeat(Token) Token {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse35(ref CreatorInstance.NonterminalUnion!([12008, 12010, 12018, 12019, 12020, 12024, 12025, 12026, 12027, 12028, 12029, 12031, 12033, 12039, 12040]) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        bool disallowToken1/+"#"+/;
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12000, 12008, 12010, 12018, 12019, 12020, 12024, 12025, 12026, 12027, 12028, 12029, 12031, 12033, 12034, 12037, 12039, 12040, 12046]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"#"})
        {
            disallowToken1/+"#"+/ = true;
            auto next = popToken();
            CreatorInstance.NonterminalUnion!([12008, 12010, 12018, 12019, 12020, 12024, 12025, 12026, 12027, 12028, 12029, 12031, 12037, 12039, 12040]) r;
            Location rl;
            gotoParent = parse37(r, rl, parseStart1, stack1, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = r;
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"("})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse83(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{")"})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse84(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{","})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse85(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"CharacterLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse86(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse87(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Operator")
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse88(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"PpNumber")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse89(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"StringLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse90(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else
        {
            lastError = new SingleParseException!Location(text("unexpected Token \"", lexer.front.content, "\"  \"", lexer.tokenName(lexer.front.symbol), "\""),
                lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12000/*AllOperators*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12000/*AllOperators*/)(currentResultLocation, currentResult.get!(12000/*AllOperators*/)());
                NonterminalType!(12037) r;
                Location rl;
                gotoParent = parse36(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12037/*TokenX*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12034/*Token*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12034/*Token*/)(currentResultLocation, currentResult.get!(12034/*Token*/)());
                NonterminalType!(12046) r;
                Location rl;
                gotoParent = parse152(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12046/*repeat(Token)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12037/*TokenX*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12037/*TokenX*/)(currentResultLocation, currentResult.get!(12037/*TokenX*/)());
                NonterminalType!(12034) r;
                Location rl;
                gotoParent = parse93(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12034/*Token*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12046/*repeat(Token)*/)
            {
                if (disallowToken1/+"#"+/ == false)
                {
                    auto next = ParseStackElem!(Location, NonterminalType!12046/*repeat(Token)*/)(currentResultLocation, currentResult.get!(12046/*repeat(Token)*/)());
                    CreatorInstance.NonterminalUnion!([12033, 12046]) r;
                    Location rl;
                    gotoParent = parse153(r, rl, parseStart1, stack1, currentStart, next);
                    if (gotoParent < 0)
                        return gotoParent;
                    currentResult = r;
                    currentResultLocation = rl;
                }
                else if (disallowToken1/+"#"+/ == true)
                {
                    auto next = ParseStackElem!(Location, NonterminalType!12046/*repeat(Token)*/)(currentResultLocation, currentResult.get!(12046/*repeat(Token)*/)());
                    NonterminalType!(12046) r;
                    Location rl;
                    gotoParent = parse156(r, rl, currentStart, next);
                    if (gotoParent < 0)
                        return gotoParent;
                    currentResult = ParseResultIn.create(12046/*repeat(Token)*/, r);
                    currentResultLocation = rl;
                }
                else
                    assert(false);
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC AllOperators
    // type: unknown
    //  TokenX ->  AllOperators. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse36(ref NonterminalType!(12037) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12000/*AllOperators*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce68_TokenX/*TokenX @string = AllOperators*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#"
    // type: unknown
    //  EmptyDirective  ->           WSC "#".WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  FuncDefine      ->           WSC "#".WSC Identifier>>"define" WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Include         ->           WSC "#".WSC Identifier>>"include" HeaderPart WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  IncludeNext     ->           WSC "#".WSC Identifier>>"include_next" HeaderPart WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation  ->           WSC "#".WSC Identifier>>"line" WSC PpNumber WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation  ->           WSC "#".WSC Identifier>>"line" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation  ->           WSC "#".WSC PpNumber WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation  ->           WSC "#".WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPEndif         ->           WSC "#".WSC Identifier>>"endif" WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPError         ->           WSC "#".WSC Identifier>>"error" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIf            ->           WSC "#".WSC Identifier>>"if" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfDef         ->           WSC "#".WSC Identifier>>"ifdef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfNDef        ->           WSC "#".WSC Identifier>>"ifndef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPWarning       ->           WSC "#".WSC Identifier>>"warning" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Pragma          ->           WSC "#".WSC Identifier>>"pragma" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Undef           ->           WSC "#".WSC Identifier>>"undef" WSC Identifier WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  VarDefine       ->           WSC "#".WSC Identifier>>"define" WSC VarDefineName WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX          -> @@disabled@@  "#". {}
    //  WSC             ->                  . !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC             ->                  .WSC2 !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC2            ->                  .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->                  .BlockComment {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                  .EscapedNewline {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                  .LineComment {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                  .WS {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                  .WSCElem {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                  .repeat(WSCElem) WSCElem {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse37(ref CreatorInstance.NonterminalUnion!([12008, 12010, 12018, 12019, 12020, 12024, 12025, 12026, 12027, 12028, 12029, 12031, 12037, 12039, 12040]) result, ref Location resultLocation, Location parseStart2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12008, 12010, 12018, 12019, 12020, 12024, 12025, 12026, 12027, 12028, 12029, 12031, 12037, 12039, 12040, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                CreatorInstance.NonterminalUnion!([12008, 12010, 12018, 12019, 12020, 12024, 12025, 12026, 12027, 12028, 12029, 12031, 12039, 12040]) r;
                Location rl;
                gotoParent = parse38(r, rl, parseStart2, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC
    // type: unknown
    //  EmptyDirective ->  WSC "#" WSC.NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  FuncDefine     ->  WSC "#" WSC.Identifier>>"define" WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Include        ->  WSC "#" WSC.Identifier>>"include" HeaderPart WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  IncludeNext    ->  WSC "#" WSC.Identifier>>"include_next" HeaderPart WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->  WSC "#" WSC.Identifier>>"line" WSC PpNumber WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->  WSC "#" WSC.Identifier>>"line" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->  WSC "#" WSC.PpNumber WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->  WSC "#" WSC.PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPEndif        ->  WSC "#" WSC.Identifier>>"endif" WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPError        ->  WSC "#" WSC.Identifier>>"error" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIf           ->  WSC "#" WSC.Identifier>>"if" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfDef        ->  WSC "#" WSC.Identifier>>"ifdef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfNDef       ->  WSC "#" WSC.Identifier>>"ifndef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPWarning      ->  WSC "#" WSC.Identifier>>"warning" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Pragma         ->  WSC "#" WSC.Identifier>>"pragma" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Undef          ->  WSC "#" WSC.Identifier>>"undef" WSC Identifier WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  VarDefine      ->  WSC "#" WSC.Identifier>>"define" WSC VarDefineName WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EOF            ->             . !anytoken {}
    //  NewLine        ->             .EOF {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  NewLine        ->             .NL {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse38(ref CreatorInstance.NonterminalUnion!([12008, 12010, 12018, 12019, 12020, 12024, 12025, 12026, 12027, 12028, 12029, 12031, 12039, 12040]) result, ref Location resultLocation, Location parseStart3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12007, 12008, 12010, 12018, 12019, 12020, 12021, 12024, 12025, 12026, 12027, 12028, 12029, 12031, 12039, 12040]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "define")
        {
            auto next = popToken();
            CreatorInstance.NonterminalUnion!([12010, 12040]) r;
            Location rl;
            gotoParent = parse40(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = r;
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "endif")
        {
            auto next = popToken();
            NonterminalType!(12024) r;
            Location rl;
            gotoParent = parse95(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12024/*PPEndif*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "error")
        {
            auto next = popToken();
            NonterminalType!(12025) r;
            Location rl;
            gotoParent = parse98(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12025/*PPError*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "if")
        {
            auto next = popToken();
            NonterminalType!(12026) r;
            Location rl;
            gotoParent = parse102(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12026/*PPIf*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "ifdef")
        {
            auto next = popToken();
            NonterminalType!(12027) r;
            Location rl;
            gotoParent = parse106(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12027/*PPIfDef*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "ifndef")
        {
            auto next = popToken();
            NonterminalType!(12028) r;
            Location rl;
            gotoParent = parse110(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12028/*PPIfNDef*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "include")
        {
            auto next = popToken();
            NonterminalType!(12018) r;
            Location rl;
            gotoParent = parse114(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12018/*Include*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "include_next")
        {
            auto next = popToken();
            NonterminalType!(12019) r;
            Location rl;
            gotoParent = parse118(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12019/*IncludeNext*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "line")
        {
            auto next = popToken();
            NonterminalType!(12020) r;
            Location rl;
            gotoParent = parse122(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12020/*LineAnnotation*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "pragma")
        {
            auto next = popToken();
            NonterminalType!(12031) r;
            Location rl;
            gotoParent = parse131(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12031/*Pragma*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "undef")
        {
            auto next = popToken();
            NonterminalType!(12039) r;
            Location rl;
            gotoParent = parse135(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12039/*Undef*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "warning")
        {
            auto next = popToken();
            NonterminalType!(12029) r;
            Location rl;
            gotoParent = parse140(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12029/*PPWarning*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12021) r;
            Location rl;
            gotoParent = parse62(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12021/*NewLine*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"PpNumber")
        {
            auto next = popToken();
            NonterminalType!(12020) r;
            Location rl;
            gotoParent = parse144(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12020/*LineAnnotation*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else
        {
            lastError = new SingleParseException!Location(text("unexpected Token \"", lexer.front.content, "\"  \"", lexer.tokenName(lexer.front.symbol), "\""),
                lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12007/*EOF*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12007/*EOF*/)(currentResultLocation, currentResult.get!(12007/*EOF*/)());
                NonterminalType!(12021) r;
                Location rl;
                gotoParent = parse39(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12021/*NewLine*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12021/*NewLine*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12021/*NewLine*/)(currentResultLocation, currentResult.get!(12021/*NewLine*/)());
                NonterminalType!(12008) r;
                Location rl;
                gotoParent = parse151(r, rl, parseStart3, stack3, stack2, stack1/*, next*/);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12008/*EmptyDirective*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC EOF
    // type: unknown
    //  NewLine ->  EOF. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse39(ref NonterminalType!(12021) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12007/*EOF*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce51_NewLine/*NewLine @string = EOF*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier
    // type: unknown
    //  FuncDefine      ->  WSC "#" WSC Identifier>>"define".WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  VarDefine       ->  WSC "#" WSC Identifier>>"define".WSC VarDefineName WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->                                  . !WS !BlockComment !LineComment !EscapedNewline {Identifier}
    //  WSC             ->                                  .WSC2 !WS !BlockComment !LineComment !EscapedNewline {Identifier}
    //  WSC2            ->                                  .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {Identifier}
    //  WSCElem         ->                                  .BlockComment {BlockComment, EscapedNewline, Identifier, LineComment, WS}
    //  WSCElem         ->                                  .EscapedNewline {BlockComment, EscapedNewline, Identifier, LineComment, WS}
    //  WSCElem         ->                                  .LineComment {BlockComment, EscapedNewline, Identifier, LineComment, WS}
    //  WSCElem         ->                                  .WS {BlockComment, EscapedNewline, Identifier, LineComment, WS}
    //  repeat(WSCElem) ->                                  .WSCElem {BlockComment, EscapedNewline, Identifier, LineComment, WS}
    //  repeat(WSCElem) ->                                  .repeat(WSCElem) WSCElem {BlockComment, EscapedNewline, Identifier, LineComment, WS}
    private int parse40(ref CreatorInstance.NonterminalUnion!([12010, 12040]) result, ref Location resultLocation, Location parseStart4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12010, 12040, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                CreatorInstance.NonterminalUnion!([12010, 12040]) r;
                Location rl;
                gotoParent = parse41(r, rl, parseStart4, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC
    // type: unknown
    //  FuncDefine    ->  WSC "#" WSC Identifier>>"define" WSC.Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  VarDefine     ->  WSC "#" WSC Identifier>>"define" WSC.VarDefineName WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  VarDefineName ->                                      .Identifier !"(" {$end, "#", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse41(ref CreatorInstance.NonterminalUnion!([12010, 12040]) result, ref Location resultLocation, Location parseStart5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12010, 12040, 12041]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier")
        {
            auto next = popToken();
            CreatorInstance.NonterminalUnion!([12010, 12041]) r;
            Location rl;
            gotoParent = parse42(r, rl, parseStart5, stack5, stack4, stack3, stack2, stack1, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = r;
            currentResultLocation = rl;
        }
        else
        {
            lastError = new SingleParseException!Location(text("unexpected Token \"", lexer.front.content, "\"  \"", lexer.tokenName(lexer.front.symbol), "\""),
                lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12041/*VarDefineName*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12041/*VarDefineName*/)(currentResultLocation, currentResult.get!(12041/*VarDefineName*/)());
                NonterminalType!(12040) r;
                Location rl;
                gotoParent = parse79(r, rl, parseStart5, stack5, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12040/*VarDefine*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier
    // type: unknown
    //  FuncDefine    ->  WSC "#" WSC Identifier>>"define" WSC Identifier."(" FuncParams ")" WSC repeatOrNone(TokenInFunc) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  VarDefineName ->                                       Identifier. !"(" {$end, "#", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse42(ref CreatorInstance.NonterminalUnion!([12010, 12041]) result, ref Location resultLocation, Location parseStart6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12010, 12041]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce84_VarDefineName/*VarDefineName @string = Identifier !"("*/(parseStart1, stack1);
            result = ThisParseResult.create(12041/*VarDefineName*/, tmp.val);
            resultLocation = tmp.start;
            return 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"("})
        {
            auto next = popToken();
            NonterminalType!(12010) r;
            Location rl;
            gotoParent = parse43(r, rl, parseStart6, stack6, stack5, stack4, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12010/*FuncDefine*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else
        {
            auto tmp = reduce84_VarDefineName/*VarDefineName @string = Identifier !"("*/(parseStart1, stack1);
            result = ThisParseResult.create(12041/*VarDefineName*/, tmp.val);
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "("
    // type: unknown
    //  FuncDefine           ->  WSC "#" WSC Identifier>>"define" WSC Identifier "(".FuncParams ")" WSC repeatOrNone(TokenInFunc) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  FuncParam            ->                                                     .WSC {")", ","}
    //  FuncParam            ->                                                     .WSC Identifier WSC {")", ","}
    //  FuncParam            ->                                                     .WSC Operator>>"..." WSC {")", ","}
    //  FuncParams           ->                                                     .list(FuncParam, ",") {")"}
    //  WSC                  ->                                                     . !WS !BlockComment !LineComment !EscapedNewline {")", ",", Identifier, Operator}
    //  WSC                  ->                                                     .WSC2 !WS !BlockComment !LineComment !EscapedNewline {")", ",", Identifier, Operator}
    //  WSC2                 ->                                                     .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {")", ",", Identifier, Operator}
    //  WSCElem              ->                                                     .BlockComment {")", ",", BlockComment, EscapedNewline, Identifier, LineComment, Operator, WS}
    //  WSCElem              ->                                                     .EscapedNewline {")", ",", BlockComment, EscapedNewline, Identifier, LineComment, Operator, WS}
    //  WSCElem              ->                                                     .LineComment {")", ",", BlockComment, EscapedNewline, Identifier, LineComment, Operator, WS}
    //  WSCElem              ->                                                     .WS {")", ",", BlockComment, EscapedNewline, Identifier, LineComment, Operator, WS}
    //  list(FuncParam, ",") ->                                                     .FuncParam {")", ","}
    //  list(FuncParam, ",") ->                                                     .list(FuncParam, ",") "," FuncParam {")", ","}
    //  repeat(WSCElem)      ->                                                     .WSCElem {")", ",", BlockComment, EscapedNewline, Identifier, LineComment, Operator, WS}
    //  repeat(WSCElem)      ->                                                     .repeat(WSCElem) WSCElem {")", ",", BlockComment, EscapedNewline, Identifier, LineComment, Operator, WS}
    private int parse43(ref NonterminalType!(12010) result, ref Location resultLocation, Location parseStart7, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12010, 12011, 12012, 12042, 12043, 12044, 12045, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12011/*FuncParam*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12011/*FuncParam*/)(currentResultLocation, currentResult.get!(12011/*FuncParam*/)());
                NonterminalType!(12045) r;
                Location rl;
                gotoParent = parse44(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12045/*list(FuncParam, ",")*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12012/*FuncParams*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12012/*FuncParams*/)(currentResultLocation, currentResult.get!(12012/*FuncParams*/)());
                NonterminalType!(12010) r;
                Location rl;
                gotoParent = parse45(r, rl, parseStart7, stack7, stack6, stack5, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12011) r;
                Location rl;
                gotoParent = parse71(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12011/*FuncParam*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12045/*list(FuncParam, ",")*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12045/*list(FuncParam, ",")*/)(currentResultLocation, currentResult.get!(12045/*list(FuncParam, ",")*/)());
                CreatorInstance.NonterminalUnion!([12012, 12045]) r;
                Location rl;
                gotoParent = parse76(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12010/*FuncDefine*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParam
    // type: unknown
    //  list(FuncParam, ",") ->  FuncParam. {")", ","}
    private int parse44(ref NonterminalType!(12045) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12011/*FuncParam*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce92/*list(FuncParam, ",") @array = FuncParam*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams
    // type: unknown
    //  FuncDefine ->  WSC "#" WSC Identifier>>"define" WSC Identifier "(" FuncParams.")" WSC repeatOrNone(TokenInFunc) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse45(ref NonterminalType!(12010) result, ref Location resultLocation, Location parseStart8, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack8, ParseStackElem!(Location, Token) stack7, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12012/*FuncParams*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12010]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{")"})
        {
            auto next = popToken();
            NonterminalType!(12010) r;
            Location rl;
            gotoParent = parse46(r, rl, parseStart8, stack8, stack7, stack6, stack5, stack4, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = r;
            resultLocation = rl;
            return gotoParent - 1;
        }
        else
        {
            lastError = new SingleParseException!Location(text("unexpected Token \"", lexer.front.content, "\"  \"", lexer.tokenName(lexer.front.symbol), "\""),
                lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")"
    // type: unknown
    //  FuncDefine      ->  WSC "#" WSC Identifier>>"define" WSC Identifier "(" FuncParams ")".WSC repeatOrNone(TokenInFunc) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->                                                                    . !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC             ->                                                                    .WSC2 !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC2            ->                                                                    .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->                                                                    .BlockComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                                                    .EscapedNewline {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                                                    .LineComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                                                    .WS {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                                                    .WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                                                    .repeat(WSCElem) WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse46(ref NonterminalType!(12010) result, ref Location resultLocation, Location parseStart9, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack9, ParseStackElem!(Location, Token) stack8, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12012/*FuncParams*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12010, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12010) r;
                Location rl;
                gotoParent = parse47(r, rl, parseStart9, stack9, stack8, stack7, stack6, stack5, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12010/*FuncDefine*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")" WSC
    // type: unknown
    //  FuncDefine                ->  WSC "#" WSC Identifier>>"define" WSC Identifier "(" FuncParams ")" WSC.repeatOrNone(TokenInFunc) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(TokenInFunc) ->                                                                        . {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(TokenInFunc) ->                                                                        .repeatOrNone(TokenInFunc) TokenInFunc {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse47(ref NonterminalType!(12010) result, ref Location resultLocation, Location parseStart10, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack10, ParseStackElem!(Location, Token) stack9, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack8, ParseStackElem!(Location, Token) stack7, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12012/*FuncParams*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12010, 12050]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce103/*repeatOrNone(TokenInFunc) @array = @empty*/();
            currentResult = ParseResultIn.create(12050/*repeatOrNone(TokenInFunc)*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12050/*repeatOrNone(TokenInFunc)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12050/*repeatOrNone(TokenInFunc)*/)(currentResultLocation, currentResult.get!(12050/*repeatOrNone(TokenInFunc)*/)());
                CreatorInstance.NonterminalUnion!([12010, 12050]) r;
                Location rl;
                gotoParent = parse48(r, rl, parseStart10, stack10, stack9, stack8, stack7, stack6, stack5, stack4, stack3, stack2, stack1, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12010/*FuncDefine*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc)
    // type: unknown
    //  FuncDefine                ->  WSC "#" WSC Identifier>>"define" WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc).NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(TokenInFunc) ->                                                                         repeatOrNone(TokenInFunc).TokenInFunc {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EOF                       ->                                                                                                  . !anytoken {$end}
    //  NewLine                   ->                                                                                                  .EOF {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  NewLine                   ->                                                                                                  .NL {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ParamExpansion            ->                                                                                                  ."#" WSC Identifier WSC {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenInFunc               ->                                                                                                  .ParamExpansion {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenInFunc               ->                                                                                                  .TokenXInFunc WSC {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenXInFunc              ->                                                                                                  ."(" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenXInFunc              ->                                                                                                  .")" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenXInFunc              ->                                                                                                  ."," {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenXInFunc              ->                                                                                                  .CharacterLiteral {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenXInFunc              ->                                                                                                  .Identifier {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenXInFunc              ->                                                                                                  .Operator {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenXInFunc              ->                                                                                                  .PpNumber {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenXInFunc              ->                                                                                                  .StringLiteral {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse48(ref CreatorInstance.NonterminalUnion!([12010, 12050]) result, ref Location resultLocation, Location parseStart11, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack11, ParseStackElem!(Location, Token) stack10, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack9, ParseStackElem!(Location, Token) stack8, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12012/*FuncParams*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, Location parseStart1, ParseStackElem!(Location, NonterminalType!12050/*repeatOrNone(TokenInFunc)*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12007, 12010, 12021, 12030, 12035, 12038, 12050]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"#"})
        {
            auto next = popToken();
            NonterminalType!(12030) r;
            Location rl;
            gotoParent = parse49(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12030/*ParamExpansion*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"("})
        {
            auto next = popToken();
            NonterminalType!(12038) r;
            Location rl;
            gotoParent = parse57(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12038/*TokenXInFunc*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{")"})
        {
            auto next = popToken();
            NonterminalType!(12038) r;
            Location rl;
            gotoParent = parse58(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12038/*TokenXInFunc*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{","})
        {
            auto next = popToken();
            NonterminalType!(12038) r;
            Location rl;
            gotoParent = parse59(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12038/*TokenXInFunc*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"CharacterLiteral")
        {
            auto next = popToken();
            NonterminalType!(12038) r;
            Location rl;
            gotoParent = parse60(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12038/*TokenXInFunc*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier")
        {
            auto next = popToken();
            NonterminalType!(12038) r;
            Location rl;
            gotoParent = parse61(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12038/*TokenXInFunc*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12021) r;
            Location rl;
            gotoParent = parse62(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12021/*NewLine*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Operator")
        {
            auto next = popToken();
            NonterminalType!(12038) r;
            Location rl;
            gotoParent = parse63(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12038/*TokenXInFunc*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"PpNumber")
        {
            auto next = popToken();
            NonterminalType!(12038) r;
            Location rl;
            gotoParent = parse64(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12038/*TokenXInFunc*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"StringLiteral")
        {
            auto next = popToken();
            NonterminalType!(12038) r;
            Location rl;
            gotoParent = parse65(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12038/*TokenXInFunc*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12007/*EOF*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12007/*EOF*/)(currentResultLocation, currentResult.get!(12007/*EOF*/)());
                NonterminalType!(12021) r;
                Location rl;
                gotoParent = parse39(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12021/*NewLine*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12021/*NewLine*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12021/*NewLine*/)(currentResultLocation, currentResult.get!(12021/*NewLine*/)());
                NonterminalType!(12010) r;
                Location rl;
                gotoParent = parse66(r, rl, parseStart11, stack11, stack10, stack9, stack8, stack7, stack6, stack5, stack4, stack3, stack2, stack1/*, next*/);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12010/*FuncDefine*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12030/*ParamExpansion*/)
            {
                currentResult = ParseResultIn.create(12035/*TokenInFunc*/, currentResult.get!(12030/*ParamExpansion*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12035/*TokenInFunc*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12035/*TokenInFunc*/)(currentResultLocation, currentResult.get!(12035/*TokenInFunc*/)());
                NonterminalType!(12050) r;
                Location rl;
                gotoParent = parse68(r, rl, parseStart1, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12050/*repeatOrNone(TokenInFunc)*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12038/*TokenXInFunc*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12038/*TokenXInFunc*/)(currentResultLocation, currentResult.get!(12038/*TokenXInFunc*/)());
                NonterminalType!(12035) r;
                Location rl;
                gotoParent = parse69(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12035/*TokenInFunc*/, r);
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) "#"
    // type: unknown
    //  ParamExpansion  ->  "#".WSC Identifier WSC {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->     . !WS !BlockComment !LineComment !EscapedNewline {Identifier}
    //  WSC             ->     .WSC2 !WS !BlockComment !LineComment !EscapedNewline {Identifier}
    //  WSC2            ->     .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {Identifier}
    //  WSCElem         ->     .BlockComment {BlockComment, EscapedNewline, Identifier, LineComment, WS}
    //  WSCElem         ->     .EscapedNewline {BlockComment, EscapedNewline, Identifier, LineComment, WS}
    //  WSCElem         ->     .LineComment {BlockComment, EscapedNewline, Identifier, LineComment, WS}
    //  WSCElem         ->     .WS {BlockComment, EscapedNewline, Identifier, LineComment, WS}
    //  repeat(WSCElem) ->     .WSCElem {BlockComment, EscapedNewline, Identifier, LineComment, WS}
    //  repeat(WSCElem) ->     .repeat(WSCElem) WSCElem {BlockComment, EscapedNewline, Identifier, LineComment, WS}
    private int parse49(ref NonterminalType!(12030) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12030, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12030) r;
                Location rl;
                gotoParent = parse50(r, rl, parseStart1, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12030/*ParamExpansion*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) "#" WSC
    // type: unknown
    //  ParamExpansion ->  "#" WSC.Identifier WSC {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse50(ref NonterminalType!(12030) result, ref Location resultLocation, Location parseStart2, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12030]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier")
        {
            auto next = popToken();
            NonterminalType!(12030) r;
            Location rl;
            gotoParent = parse51(r, rl, parseStart2, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = r;
            resultLocation = rl;
            return gotoParent - 1;
        }
        else
        {
            lastError = new SingleParseException!Location(text("unexpected Token \"", lexer.front.content, "\"  \"", lexer.tokenName(lexer.front.symbol), "\""),
                lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) "#" WSC Identifier
    // type: unknown
    //  ParamExpansion  ->  "#" WSC Identifier.WSC {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->                    . !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC             ->                    .WSC2 !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC2            ->                    .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->                    .BlockComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                    .EscapedNewline {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                    .LineComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                    .WS {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                    .WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                    .repeat(WSCElem) WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse51(ref NonterminalType!(12030) result, ref Location resultLocation, Location parseStart3, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12030, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12030) r;
                Location rl;
                gotoParent = parse52(r, rl, parseStart3, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12030/*ParamExpansion*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) "#" WSC Identifier WSC
    // type: unknown
    //  ParamExpansion ->  "#" WSC Identifier WSC. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse52(ref NonterminalType!(12030) result, ref Location resultLocation, Location parseStart4, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce60_ParamExpansion/*ParamExpansion = "#" WSC Identifier WSC*/(parseStart4, stack4, stack3, stack2, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 3;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) "#" WSC Identifier WSC2
    // type: unknown
    //  WSC ->  WSC2. !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, HeaderNameSys, Identifier, NL, Operator, PpNumber, StringLiteral}
    private int parse53(ref NonterminalType!(12042) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12043/*WSC2*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce85_WSC/*WSC @array = WSC2 !WS !BlockComment !LineComment !EscapedNewline*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) "#" WSC Identifier WSCElem
    // type: unknown
    //  repeat(WSCElem) ->  WSCElem. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, HeaderNameSys, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse54(ref NonterminalType!(12047) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce97/*repeat(WSCElem) @array = WSCElem*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) "#" WSC Identifier repeat(WSCElem)
    // type: unknown
    //  WSC2            ->  repeat(WSCElem). !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, HeaderNameSys, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  repeat(WSCElem) ->  repeat(WSCElem).WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, HeaderNameSys, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                 .BlockComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, HeaderNameSys, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                 .EscapedNewline {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, HeaderNameSys, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                 .LineComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, HeaderNameSys, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                 .WS {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, HeaderNameSys, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse55(ref CreatorInstance.NonterminalUnion!([12043, 12047]) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce87_WSC2/*WSC2 @array = repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline*/(parseStart1, stack1);
            result = ThisParseResult.create(12043/*WSC2*/, tmp.val);
            resultLocation = tmp.start;
            return 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce87_WSC2/*WSC2 @array = repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline*/(parseStart1, stack1);
            result = ThisParseResult.create(12043/*WSC2*/, tmp.val);
            resultLocation = tmp.start;
            return 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse56(r, rl, parseStart1, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12047/*repeat(WSCElem)*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) "#" WSC Identifier repeat(WSCElem) WSCElem
    // type: unknown
    //  repeat(WSCElem) ->  repeat(WSCElem) WSCElem. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, HeaderNameSys, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse56(ref NonterminalType!(12047) result, ref Location resultLocation, Location parseStart2, ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/) stack2, ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce96/*repeat(WSCElem) @array = repeat(WSCElem) WSCElem*/(parseStart2, stack2, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 1;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) "("
    // type: unknown
    //  TokenXInFunc ->  "(". {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse57(ref NonterminalType!(12038) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce75_TokenXInFunc/*TokenXInFunc @string = "("*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) ")"
    // type: unknown
    //  TokenXInFunc ->  ")". {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse58(ref NonterminalType!(12038) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce76_TokenXInFunc/*TokenXInFunc @string = ")"*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) ","
    // type: unknown
    //  TokenXInFunc ->  ",". {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse59(ref NonterminalType!(12038) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce77_TokenXInFunc/*TokenXInFunc @string = ","*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) CharacterLiteral
    // type: unknown
    //  TokenXInFunc ->  CharacterLiteral. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse60(ref NonterminalType!(12038) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce79_TokenXInFunc/*TokenXInFunc @string = CharacterLiteral*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) Identifier
    // type: unknown
    //  TokenXInFunc ->  Identifier. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse61(ref NonterminalType!(12038) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce81_TokenXInFunc/*TokenXInFunc @string = Identifier*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) NL
    // type: unknown
    //  NewLine ->  NL. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse62(ref NonterminalType!(12021) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce50_NewLine/*NewLine @string = NL*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) Operator
    // type: unknown
    //  TokenXInFunc ->  Operator. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse63(ref NonterminalType!(12038) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce74_TokenXInFunc/*TokenXInFunc @string = Operator*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) PpNumber
    // type: unknown
    //  TokenXInFunc ->  PpNumber. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse64(ref NonterminalType!(12038) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce80_TokenXInFunc/*TokenXInFunc @string = PpNumber*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) StringLiteral
    // type: unknown
    //  TokenXInFunc ->  StringLiteral. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse65(ref NonterminalType!(12038) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce78_TokenXInFunc/*TokenXInFunc @string = StringLiteral*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) NewLine
    // type: unknown
    //  FuncDefine ->  WSC "#" WSC Identifier>>"define" WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) NewLine. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse66(ref NonterminalType!(12010) result, ref Location resultLocation, Location parseStart12, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack12, ParseStackElem!(Location, Token) stack11, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack10, ParseStackElem!(Location, Token) stack9, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack8, ParseStackElem!(Location, Token) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12012/*FuncParams*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, NonterminalType!12050/*repeatOrNone(TokenInFunc)*/) stack2/+, ParseStackElem!(Location, NonterminalType!12021/*NewLine*/) stack1+/)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce27_FuncDefine/*FuncDefine = WSC "#" WSC Identifier>>"define" WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) ^NewLine*/(parseStart12, stack12, stack11, stack10, stack9, stack8, stack7, stack6, stack5, stack4, stack3, stack2, /*dropped*/);
            result = tmp.val;
            resultLocation = tmp.start;
            return 11;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) TokenInFunc
    // type: unknown
    //  repeatOrNone(TokenInFunc) ->  repeatOrNone(TokenInFunc) TokenInFunc. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse68(ref NonterminalType!(12050) result, ref Location resultLocation, Location parseStart2, ParseStackElem!(Location, NonterminalType!12050/*repeatOrNone(TokenInFunc)*/) stack2, ParseStackElem!(Location, NonterminalType!12035/*TokenInFunc*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce102/*repeatOrNone(TokenInFunc) @array = repeatOrNone(TokenInFunc) TokenInFunc*/(parseStart2, stack2, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 1;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) TokenXInFunc
    // type: unknown
    //  TokenInFunc     ->  TokenXInFunc.WSC {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->              . !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC             ->              .WSC2 !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC2            ->              .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->              .BlockComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->              .EscapedNewline {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->              .LineComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->              .WS {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->              .WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->              .repeat(WSCElem) WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse69(ref NonterminalType!(12035) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12038/*TokenXInFunc*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12035, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12035) r;
                Location rl;
                gotoParent = parse70(r, rl, parseStart1, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12035/*TokenInFunc*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) TokenXInFunc WSC
    // type: unknown
    //  TokenInFunc ->  TokenXInFunc WSC. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse70(ref NonterminalType!(12035) result, ref Location resultLocation, Location parseStart2, ParseStackElem!(Location, NonterminalType!12038/*TokenXInFunc*/) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce65_TokenInFunc/*TokenInFunc = TokenXInFunc WSC*/(parseStart2, stack2, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 1;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" WSC
    // type: unknown
    //  FuncParam ->  WSC. {")", ","}
    //  FuncParam ->  WSC.Identifier WSC {")", ","}
    //  FuncParam ->  WSC.Operator>>"..." WSC {")", ","}
    private int parse71(ref NonterminalType!(12011) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12011]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier")
        {
            auto next = popToken();
            NonterminalType!(12011) r;
            Location rl;
            gotoParent = parse72(r, rl, parseStart1, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = r;
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Operator" && lexer.front.content == "...")
        {
            auto next = popToken();
            NonterminalType!(12011) r;
            Location rl;
            gotoParent = parse74(r, rl, parseStart1, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = r;
            resultLocation = rl;
            return gotoParent - 1;
        }
        else
        {
            auto tmp = reduce30_FuncParam/*FuncParam = WSC*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" WSC Identifier
    // type: unknown
    //  FuncParam       ->  WSC Identifier.WSC {")", ","}
    //  WSC             ->                . !WS !BlockComment !LineComment !EscapedNewline {")", ","}
    //  WSC             ->                .WSC2 !WS !BlockComment !LineComment !EscapedNewline {")", ","}
    //  WSC2            ->                .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {")", ","}
    //  WSCElem         ->                .BlockComment {")", ",", BlockComment, EscapedNewline, LineComment, WS}
    //  WSCElem         ->                .EscapedNewline {")", ",", BlockComment, EscapedNewline, LineComment, WS}
    //  WSCElem         ->                .LineComment {")", ",", BlockComment, EscapedNewline, LineComment, WS}
    //  WSCElem         ->                .WS {")", ",", BlockComment, EscapedNewline, LineComment, WS}
    //  repeat(WSCElem) ->                .WSCElem {")", ",", BlockComment, EscapedNewline, LineComment, WS}
    //  repeat(WSCElem) ->                .repeat(WSCElem) WSCElem {")", ",", BlockComment, EscapedNewline, LineComment, WS}
    private int parse72(ref NonterminalType!(12011) result, ref Location resultLocation, Location parseStart2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12011, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12011) r;
                Location rl;
                gotoParent = parse73(r, rl, parseStart2, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12011/*FuncParam*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" WSC Identifier WSC
    // type: unknown
    //  FuncParam ->  WSC Identifier WSC. {")", ","}
    private int parse73(ref NonterminalType!(12011) result, ref Location resultLocation, Location parseStart3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce28_FuncParam/*FuncParam = WSC Identifier WSC*/(parseStart3, stack3, stack2, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 2;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" WSC Operator
    // type: unknown
    //  FuncParam       ->  WSC Operator>>"...".WSC {")", ","}
    //  WSC             ->                     . !WS !BlockComment !LineComment !EscapedNewline {")", ","}
    //  WSC             ->                     .WSC2 !WS !BlockComment !LineComment !EscapedNewline {")", ","}
    //  WSC2            ->                     .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {")", ","}
    //  WSCElem         ->                     .BlockComment {")", ",", BlockComment, EscapedNewline, LineComment, WS}
    //  WSCElem         ->                     .EscapedNewline {")", ",", BlockComment, EscapedNewline, LineComment, WS}
    //  WSCElem         ->                     .LineComment {")", ",", BlockComment, EscapedNewline, LineComment, WS}
    //  WSCElem         ->                     .WS {")", ",", BlockComment, EscapedNewline, LineComment, WS}
    //  repeat(WSCElem) ->                     .WSCElem {")", ",", BlockComment, EscapedNewline, LineComment, WS}
    //  repeat(WSCElem) ->                     .repeat(WSCElem) WSCElem {")", ",", BlockComment, EscapedNewline, LineComment, WS}
    private int parse74(ref NonterminalType!(12011) result, ref Location resultLocation, Location parseStart2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12011, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12011) r;
                Location rl;
                gotoParent = parse75(r, rl, parseStart2, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12011/*FuncParam*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" WSC Operator WSC
    // type: unknown
    //  FuncParam ->  WSC Operator>>"..." WSC. {")", ","}
    private int parse75(ref NonterminalType!(12011) result, ref Location resultLocation, Location parseStart3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce29_FuncParam/*FuncParam = WSC Operator>>"..." WSC*/(parseStart3, stack3, stack2, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 2;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" list(FuncParam, ",")
    // type: unknown
    //  FuncParams           ->  list(FuncParam, ","). {")"}
    //  list(FuncParam, ",") ->  list(FuncParam, ",")."," FuncParam {")", ","}
    private int parse76(ref CreatorInstance.NonterminalUnion!([12012, 12045]) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12045/*list(FuncParam, ",")*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12012, 12045]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{","})
        {
            auto next = popToken();
            NonterminalType!(12045) r;
            Location rl;
            gotoParent = parse77(r, rl, parseStart1, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12045/*list(FuncParam, ",")*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else
        {
            auto tmp = reduce31_FuncParams/*FuncParams @array = list(FuncParam, ",")*/(parseStart1, stack1);
            result = ThisParseResult.create(12012/*FuncParams*/, tmp.val);
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" list(FuncParam, ",") ","
    // type: unknown
    //  list(FuncParam, ",") ->  list(FuncParam, ",") ",".FuncParam {")", ","}
    //  FuncParam            ->                          .WSC {")", ","}
    //  FuncParam            ->                          .WSC Identifier WSC {")", ","}
    //  FuncParam            ->                          .WSC Operator>>"..." WSC {")", ","}
    //  WSC                  ->                          . !WS !BlockComment !LineComment !EscapedNewline {")", ",", Identifier, Operator}
    //  WSC                  ->                          .WSC2 !WS !BlockComment !LineComment !EscapedNewline {")", ",", Identifier, Operator}
    //  WSC2                 ->                          .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {")", ",", Identifier, Operator}
    //  WSCElem              ->                          .BlockComment {")", ",", BlockComment, EscapedNewline, Identifier, LineComment, Operator, WS}
    //  WSCElem              ->                          .EscapedNewline {")", ",", BlockComment, EscapedNewline, Identifier, LineComment, Operator, WS}
    //  WSCElem              ->                          .LineComment {")", ",", BlockComment, EscapedNewline, Identifier, LineComment, Operator, WS}
    //  WSCElem              ->                          .WS {")", ",", BlockComment, EscapedNewline, Identifier, LineComment, Operator, WS}
    //  repeat(WSCElem)      ->                          .WSCElem {")", ",", BlockComment, EscapedNewline, Identifier, LineComment, Operator, WS}
    //  repeat(WSCElem)      ->                          .repeat(WSCElem) WSCElem {")", ",", BlockComment, EscapedNewline, Identifier, LineComment, Operator, WS}
    private int parse77(ref NonterminalType!(12045) result, ref Location resultLocation, Location parseStart2, ParseStackElem!(Location, NonterminalType!12045/*list(FuncParam, ",")*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12011, 12042, 12043, 12044, 12045, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12011/*FuncParam*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12011/*FuncParam*/)(currentResultLocation, currentResult.get!(12011/*FuncParam*/)());
                NonterminalType!(12045) r;
                Location rl;
                gotoParent = parse78(r, rl, parseStart2, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12011) r;
                Location rl;
                gotoParent = parse71(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12011/*FuncParam*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12045/*list(FuncParam, ",")*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier "(" list(FuncParam, ",") "," FuncParam
    // type: unknown
    //  list(FuncParam, ",") ->  list(FuncParam, ",") "," FuncParam. {")", ","}
    private int parse78(ref NonterminalType!(12045) result, ref Location resultLocation, Location parseStart3, ParseStackElem!(Location, NonterminalType!12045/*list(FuncParam, ",")*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12011/*FuncParam*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce93/*list(FuncParam, ",") @array = list(FuncParam, ",") "," FuncParam*/(parseStart3, stack3, stack2, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 2;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC VarDefineName
    // type: unknown
    //  VarDefine       ->  WSC "#" WSC Identifier>>"define" WSC VarDefineName.WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->                                                    . !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC             ->                                                    .WSC2 !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC2            ->                                                    .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->                                                    .BlockComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                                    .EscapedNewline {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                                    .LineComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                                    .WS {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                                    .WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                                    .repeat(WSCElem) WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse79(ref NonterminalType!(12040) result, ref Location resultLocation, Location parseStart6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, NonterminalType!12041/*VarDefineName*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12040, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12040) r;
                Location rl;
                gotoParent = parse80(r, rl, parseStart6, stack6, stack5, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12040/*VarDefine*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC VarDefineName WSC
    // type: unknown
    //  VarDefine           ->  WSC "#" WSC Identifier>>"define" WSC VarDefineName WSC.repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                                        . {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                                        .repeatOrNone(Token) Token {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse80(ref NonterminalType!(12040) result, ref Location resultLocation, Location parseStart7, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, NonterminalType!12041/*VarDefineName*/) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12040, 12049]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce101/*repeatOrNone(Token) @array = @empty*/();
            currentResult = ParseResultIn.create(12049/*repeatOrNone(Token)*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12049/*repeatOrNone(Token)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/)(currentResultLocation, currentResult.get!(12049/*repeatOrNone(Token)*/)());
                CreatorInstance.NonterminalUnion!([12040, 12049]) r;
                Location rl;
                gotoParent = parse81(r, rl, parseStart7, stack7, stack6, stack5, stack4, stack3, stack2, stack1, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12040/*VarDefine*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC VarDefineName WSC repeatOrNone(Token)
    // type: unknown
    //  VarDefine           ->  WSC "#" WSC Identifier>>"define" WSC VarDefineName WSC repeatOrNone(Token).NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                                         repeatOrNone(Token).Token {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                                            ."(" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                                            .")" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                                            ."," {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                                            .Operator {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EOF                 ->                                                                            . !anytoken {$end}
    //  NewLine             ->                                                                            .EOF {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  NewLine             ->                                                                            .NL {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Token               ->                                                                            .TokenX WSC {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                                            .AllOperators {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                                            ."#" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                                            .CharacterLiteral {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                                            .Identifier {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                                            .PpNumber {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                                            .StringLiteral {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse81(ref CreatorInstance.NonterminalUnion!([12040, 12049]) result, ref Location resultLocation, Location parseStart8, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack8, ParseStackElem!(Location, Token) stack7, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, NonterminalType!12041/*VarDefineName*/) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, Location parseStart1, ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12000, 12007, 12021, 12034, 12037, 12040, 12049]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"#"})
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse82(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"("})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse83(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{")"})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse84(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{","})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse85(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"CharacterLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse86(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse87(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12021) r;
            Location rl;
            gotoParent = parse62(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12021/*NewLine*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Operator")
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse88(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"PpNumber")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse89(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"StringLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse90(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12000/*AllOperators*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12000/*AllOperators*/)(currentResultLocation, currentResult.get!(12000/*AllOperators*/)());
                NonterminalType!(12037) r;
                Location rl;
                gotoParent = parse36(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12037/*TokenX*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12007/*EOF*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12007/*EOF*/)(currentResultLocation, currentResult.get!(12007/*EOF*/)());
                NonterminalType!(12021) r;
                Location rl;
                gotoParent = parse39(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12021/*NewLine*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12021/*NewLine*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12021/*NewLine*/)(currentResultLocation, currentResult.get!(12021/*NewLine*/)());
                NonterminalType!(12040) r;
                Location rl;
                gotoParent = parse91(r, rl, parseStart8, stack8, stack7, stack6, stack5, stack4, stack3, stack2, stack1/*, next*/);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12040/*VarDefine*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12034/*Token*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12034/*Token*/)(currentResultLocation, currentResult.get!(12034/*Token*/)());
                NonterminalType!(12049) r;
                Location rl;
                gotoParent = parse92(r, rl, parseStart1, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12049/*repeatOrNone(Token)*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12037/*TokenX*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12037/*TokenX*/)(currentResultLocation, currentResult.get!(12037/*TokenX*/)());
                NonterminalType!(12034) r;
                Location rl;
                gotoParent = parse93(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12034/*Token*/, r);
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC VarDefineName WSC repeatOrNone(Token) "#"
    // type: unknown
    //  TokenX ->  "#". {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse82(ref NonterminalType!(12037) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce73_TokenX/*TokenX @string = "#"*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC VarDefineName WSC repeatOrNone(Token) "("
    // type: unknown
    //  AllOperators ->  "(". {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse83(ref NonterminalType!(12000) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce1_AllOperators/*AllOperators @string = "("*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC VarDefineName WSC repeatOrNone(Token) ")"
    // type: unknown
    //  AllOperators ->  ")". {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse84(ref NonterminalType!(12000) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce2_AllOperators/*AllOperators @string = ")"*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC VarDefineName WSC repeatOrNone(Token) ","
    // type: unknown
    //  AllOperators ->  ",". {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse85(ref NonterminalType!(12000) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce3_AllOperators/*AllOperators @string = ","*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC VarDefineName WSC repeatOrNone(Token) CharacterLiteral
    // type: unknown
    //  TokenX ->  CharacterLiteral. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse86(ref NonterminalType!(12037) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce70_TokenX/*TokenX @string = CharacterLiteral*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC VarDefineName WSC repeatOrNone(Token) Identifier
    // type: unknown
    //  TokenX ->  Identifier. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse87(ref NonterminalType!(12037) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce72_TokenX/*TokenX @string = Identifier*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC VarDefineName WSC repeatOrNone(Token) Operator
    // type: unknown
    //  AllOperators ->  Operator. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse88(ref NonterminalType!(12000) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce0_AllOperators/*AllOperators @string = Operator*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC VarDefineName WSC repeatOrNone(Token) PpNumber
    // type: unknown
    //  TokenX ->  PpNumber. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse89(ref NonterminalType!(12037) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce71_TokenX/*TokenX @string = PpNumber*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC VarDefineName WSC repeatOrNone(Token) StringLiteral
    // type: unknown
    //  TokenX ->  StringLiteral. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse90(ref NonterminalType!(12037) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce69_TokenX/*TokenX @string = StringLiteral*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC VarDefineName WSC repeatOrNone(Token) NewLine
    // type: unknown
    //  VarDefine ->  WSC "#" WSC Identifier>>"define" WSC VarDefineName WSC repeatOrNone(Token) NewLine. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse91(ref NonterminalType!(12040) result, ref Location resultLocation, Location parseStart9, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack9, ParseStackElem!(Location, Token) stack8, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, NonterminalType!12041/*VarDefineName*/) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/) stack2/+, ParseStackElem!(Location, NonterminalType!12021/*NewLine*/) stack1+/)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce83_VarDefine/*VarDefine = WSC "#" WSC Identifier>>"define" WSC VarDefineName WSC repeatOrNone(Token) ^NewLine*/(parseStart9, stack9, stack8, stack7, stack6, stack5, stack4, stack3, stack2, /*dropped*/);
            result = tmp.val;
            resultLocation = tmp.start;
            return 8;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC VarDefineName WSC repeatOrNone(Token) Token
    // type: unknown
    //  repeatOrNone(Token) ->  repeatOrNone(Token) Token. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse92(ref NonterminalType!(12049) result, ref Location resultLocation, Location parseStart2, ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/) stack2, ParseStackElem!(Location, NonterminalType!12034/*Token*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce100/*repeatOrNone(Token) @array = repeatOrNone(Token) Token*/(parseStart2, stack2, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 1;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC VarDefineName WSC repeatOrNone(Token) TokenX
    // type: unknown
    //  Token           ->  TokenX.WSC {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->        . !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC             ->        .WSC2 !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC2            ->        .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->        .BlockComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->        .EscapedNewline {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->        .LineComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->        .WS {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->        .WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->        .repeat(WSCElem) WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse93(ref NonterminalType!(12034) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12037/*TokenX*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12034, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12034) r;
                Location rl;
                gotoParent = parse94(r, rl, parseStart1, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12034/*Token*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC VarDefineName WSC repeatOrNone(Token) TokenX WSC
    // type: unknown
    //  Token ->  TokenX WSC. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse94(ref NonterminalType!(12034) result, ref Location resultLocation, Location parseStart2, ParseStackElem!(Location, NonterminalType!12037/*TokenX*/) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce64_Token/*Token = TokenX WSC*/(parseStart2, stack2, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 1;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier
    // type: unknown
    //  PPEndif         ->  WSC "#" WSC Identifier>>"endif".WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->                                 . !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC             ->                                 .WSC2 !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC2            ->                                 .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->                                 .BlockComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                 .EscapedNewline {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                 .LineComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                 .WS {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                 .WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                 .repeat(WSCElem) WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse95(ref NonterminalType!(12024) result, ref Location resultLocation, Location parseStart4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12024, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12024) r;
                Location rl;
                gotoParent = parse96(r, rl, parseStart4, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12024/*PPEndif*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC
    // type: unknown
    //  PPEndif ->  WSC "#" WSC Identifier>>"endif" WSC.NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EOF     ->                                     . !anytoken {$end}
    //  NewLine ->                                     .EOF {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  NewLine ->                                     .NL {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse96(ref NonterminalType!(12024) result, ref Location resultLocation, Location parseStart5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12007, 12021, 12024]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12021) r;
            Location rl;
            gotoParent = parse62(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12021/*NewLine*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12007/*EOF*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12007/*EOF*/)(currentResultLocation, currentResult.get!(12007/*EOF*/)());
                NonterminalType!(12021) r;
                Location rl;
                gotoParent = parse39(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12021/*NewLine*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12021/*NewLine*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12021/*NewLine*/)(currentResultLocation, currentResult.get!(12021/*NewLine*/)());
                NonterminalType!(12024) r;
                Location rl;
                gotoParent = parse97(r, rl, parseStart5, stack5, stack4, stack3, stack2, stack1/*, next*/);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12024/*PPEndif*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC NewLine
    // type: unknown
    //  PPEndif ->  WSC "#" WSC Identifier>>"endif" WSC NewLine. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse97(ref NonterminalType!(12024) result, ref Location resultLocation, Location parseStart6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2/+, ParseStackElem!(Location, NonterminalType!12021/*NewLine*/) stack1+/)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce54_PPEndif/*PPEndif = WSC "#" WSC Identifier>>"endif" WSC ^NewLine*/(parseStart6, stack6, stack5, stack4, stack3, stack2, /*dropped*/);
            result = tmp.val;
            resultLocation = tmp.start;
            return 5;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier
    // type: unknown
    //  PPError         ->  WSC "#" WSC Identifier>>"error".WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->                                 . !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC             ->                                 .WSC2 !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC2            ->                                 .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->                                 .BlockComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                 .EscapedNewline {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                 .LineComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                 .WS {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                 .WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                 .repeat(WSCElem) WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse98(ref NonterminalType!(12025) result, ref Location resultLocation, Location parseStart4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12025, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12025) r;
                Location rl;
                gotoParent = parse99(r, rl, parseStart4, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12025/*PPError*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC
    // type: unknown
    //  PPError             ->  WSC "#" WSC Identifier>>"error" WSC.repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                     . {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                     .repeatOrNone(Token) Token {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse99(ref NonterminalType!(12025) result, ref Location resultLocation, Location parseStart5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12025, 12049]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce101/*repeatOrNone(Token) @array = @empty*/();
            currentResult = ParseResultIn.create(12049/*repeatOrNone(Token)*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12049/*repeatOrNone(Token)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/)(currentResultLocation, currentResult.get!(12049/*repeatOrNone(Token)*/)());
                CreatorInstance.NonterminalUnion!([12025, 12049]) r;
                Location rl;
                gotoParent = parse100(r, rl, parseStart5, stack5, stack4, stack3, stack2, stack1, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12025/*PPError*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC repeatOrNone(Token)
    // type: unknown
    //  PPError             ->  WSC "#" WSC Identifier>>"error" WSC repeatOrNone(Token).NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                      repeatOrNone(Token).Token {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                         ."(" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                         .")" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                         ."," {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                         .Operator {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EOF                 ->                                                         . !anytoken {$end}
    //  NewLine             ->                                                         .EOF {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  NewLine             ->                                                         .NL {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Token               ->                                                         .TokenX WSC {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                         .AllOperators {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                         ."#" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                         .CharacterLiteral {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                         .Identifier {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                         .PpNumber {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                         .StringLiteral {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse100(ref CreatorInstance.NonterminalUnion!([12025, 12049]) result, ref Location resultLocation, Location parseStart6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, Location parseStart1, ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12000, 12007, 12021, 12025, 12034, 12037, 12049]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"#"})
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse82(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"("})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse83(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{")"})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse84(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{","})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse85(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"CharacterLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse86(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse87(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12021) r;
            Location rl;
            gotoParent = parse62(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12021/*NewLine*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Operator")
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse88(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"PpNumber")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse89(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"StringLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse90(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12000/*AllOperators*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12000/*AllOperators*/)(currentResultLocation, currentResult.get!(12000/*AllOperators*/)());
                NonterminalType!(12037) r;
                Location rl;
                gotoParent = parse36(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12037/*TokenX*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12007/*EOF*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12007/*EOF*/)(currentResultLocation, currentResult.get!(12007/*EOF*/)());
                NonterminalType!(12021) r;
                Location rl;
                gotoParent = parse39(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12021/*NewLine*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12021/*NewLine*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12021/*NewLine*/)(currentResultLocation, currentResult.get!(12021/*NewLine*/)());
                NonterminalType!(12025) r;
                Location rl;
                gotoParent = parse101(r, rl, parseStart6, stack6, stack5, stack4, stack3, stack2, stack1/*, next*/);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12025/*PPError*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12034/*Token*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12034/*Token*/)(currentResultLocation, currentResult.get!(12034/*Token*/)());
                NonterminalType!(12049) r;
                Location rl;
                gotoParent = parse92(r, rl, parseStart1, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12049/*repeatOrNone(Token)*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12037/*TokenX*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12037/*TokenX*/)(currentResultLocation, currentResult.get!(12037/*TokenX*/)());
                NonterminalType!(12034) r;
                Location rl;
                gotoParent = parse93(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12034/*Token*/, r);
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC repeatOrNone(Token) NewLine
    // type: unknown
    //  PPError ->  WSC "#" WSC Identifier>>"error" WSC repeatOrNone(Token) NewLine. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse101(ref NonterminalType!(12025) result, ref Location resultLocation, Location parseStart7, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/) stack2/+, ParseStackElem!(Location, NonterminalType!12021/*NewLine*/) stack1+/)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce55_PPError/*PPError = WSC "#" WSC Identifier>>"error" WSC repeatOrNone(Token) ^NewLine*/(parseStart7, stack7, stack6, stack5, stack4, stack3, stack2, /*dropped*/);
            result = tmp.val;
            resultLocation = tmp.start;
            return 6;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier
    // type: unknown
    //  PPIf            ->  WSC "#" WSC Identifier>>"if".WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->                              . !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC             ->                              .WSC2 !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC2            ->                              .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->                              .BlockComment {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                              .EscapedNewline {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                              .LineComment {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                              .WS {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                              .WSCElem {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                              .repeat(WSCElem) WSCElem {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse102(ref NonterminalType!(12026) result, ref Location resultLocation, Location parseStart4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12026, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12026) r;
                Location rl;
                gotoParent = parse103(r, rl, parseStart4, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12026/*PPIf*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC
    // type: unknown
    //  PPIf                ->  WSC "#" WSC Identifier>>"if" WSC.repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                  . {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                  .repeatOrNone(Token) Token {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse103(ref NonterminalType!(12026) result, ref Location resultLocation, Location parseStart5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12026, 12049]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce101/*repeatOrNone(Token) @array = @empty*/();
            currentResult = ParseResultIn.create(12049/*repeatOrNone(Token)*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12049/*repeatOrNone(Token)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/)(currentResultLocation, currentResult.get!(12049/*repeatOrNone(Token)*/)());
                CreatorInstance.NonterminalUnion!([12026, 12049]) r;
                Location rl;
                gotoParent = parse104(r, rl, parseStart5, stack5, stack4, stack3, stack2, stack1, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12026/*PPIf*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC repeatOrNone(Token)
    // type: unknown
    //  PPIf                ->  WSC "#" WSC Identifier>>"if" WSC repeatOrNone(Token).NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                   repeatOrNone(Token).Token {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                      ."(" {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                      .")" {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                      ."," {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                      .Operator {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EOF                 ->                                                      . !anytoken {}
    //  NewLine             ->                                                      .EOF {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  NewLine             ->                                                      .NL {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Token               ->                                                      .TokenX WSC {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                      .AllOperators {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                      ."#" {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                      .CharacterLiteral {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                      .Identifier {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                      .PpNumber {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                      .StringLiteral {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse104(ref CreatorInstance.NonterminalUnion!([12026, 12049]) result, ref Location resultLocation, Location parseStart6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, Location parseStart1, ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12000, 12007, 12021, 12026, 12034, 12037, 12049]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"#"})
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse82(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"("})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse83(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{")"})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse84(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{","})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse85(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"CharacterLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse86(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse87(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12021) r;
            Location rl;
            gotoParent = parse62(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12021/*NewLine*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Operator")
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse88(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"PpNumber")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse89(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"StringLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse90(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else
        {
            lastError = new SingleParseException!Location(text("unexpected Token \"", lexer.front.content, "\"  \"", lexer.tokenName(lexer.front.symbol), "\""),
                lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12000/*AllOperators*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12000/*AllOperators*/)(currentResultLocation, currentResult.get!(12000/*AllOperators*/)());
                NonterminalType!(12037) r;
                Location rl;
                gotoParent = parse36(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12037/*TokenX*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12007/*EOF*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12007/*EOF*/)(currentResultLocation, currentResult.get!(12007/*EOF*/)());
                NonterminalType!(12021) r;
                Location rl;
                gotoParent = parse39(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12021/*NewLine*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12021/*NewLine*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12021/*NewLine*/)(currentResultLocation, currentResult.get!(12021/*NewLine*/)());
                NonterminalType!(12026) r;
                Location rl;
                gotoParent = parse105(r, rl, parseStart6, stack6, stack5, stack4, stack3, stack2, stack1/*, next*/);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12026/*PPIf*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12034/*Token*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12034/*Token*/)(currentResultLocation, currentResult.get!(12034/*Token*/)());
                NonterminalType!(12049) r;
                Location rl;
                gotoParent = parse92(r, rl, parseStart1, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12049/*repeatOrNone(Token)*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12037/*TokenX*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12037/*TokenX*/)(currentResultLocation, currentResult.get!(12037/*TokenX*/)());
                NonterminalType!(12034) r;
                Location rl;
                gotoParent = parse93(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12034/*Token*/, r);
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC repeatOrNone(Token) NewLine
    // type: unknown
    //  PPIf ->  WSC "#" WSC Identifier>>"if" WSC repeatOrNone(Token) NewLine. {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse105(ref NonterminalType!(12026) result, ref Location resultLocation, Location parseStart7, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/) stack2/+, ParseStackElem!(Location, NonterminalType!12021/*NewLine*/) stack1+/)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce56_PPIf/*PPIf = WSC "#" WSC Identifier>>"if" WSC repeatOrNone(Token) ^NewLine*/(parseStart7, stack7, stack6, stack5, stack4, stack3, stack2, /*dropped*/);
            result = tmp.val;
            resultLocation = tmp.start;
            return 6;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier
    // type: unknown
    //  PPIfDef         ->  WSC "#" WSC Identifier>>"ifdef".WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->                                 . !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    //  WSC             ->                                 .WSC2 !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    //  WSC2            ->                                 .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->                                 .BlockComment {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                 .EscapedNewline {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                 .LineComment {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                 .WS {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                 .WSCElem {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                 .repeat(WSCElem) WSCElem {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    private int parse106(ref NonterminalType!(12027) result, ref Location resultLocation, Location parseStart4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12027, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12027) r;
                Location rl;
                gotoParent = parse107(r, rl, parseStart4, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12027/*PPIfDef*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC
    // type: unknown
    //  PPIfDef      ->  WSC "#" WSC Identifier>>"ifdef" WSC.Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators ->                                     ."(" {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators ->                                     .")" {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators ->                                     ."," {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators ->                                     .Operator {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Token        ->                                     .TokenX WSC {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX       ->                                     .AllOperators {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX       ->                                     ."#" {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX       ->                                     .CharacterLiteral {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX       ->                                     .Identifier {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX       ->                                     .PpNumber {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX       ->                                     .StringLiteral {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse107(ref NonterminalType!(12027) result, ref Location resultLocation, Location parseStart5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12000, 12027, 12034, 12037]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"#"})
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse82(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"("})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse83(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{")"})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse84(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{","})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse85(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"CharacterLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse86(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse87(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Operator")
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse88(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"PpNumber")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse89(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"StringLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse90(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else
        {
            lastError = new SingleParseException!Location(text("unexpected Token \"", lexer.front.content, "\"  \"", lexer.tokenName(lexer.front.symbol), "\""),
                lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12000/*AllOperators*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12000/*AllOperators*/)(currentResultLocation, currentResult.get!(12000/*AllOperators*/)());
                NonterminalType!(12037) r;
                Location rl;
                gotoParent = parse36(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12037/*TokenX*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12034/*Token*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12034/*Token*/)(currentResultLocation, currentResult.get!(12034/*Token*/)());
                NonterminalType!(12027) r;
                Location rl;
                gotoParent = parse108(r, rl, parseStart5, stack5, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12037/*TokenX*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12037/*TokenX*/)(currentResultLocation, currentResult.get!(12037/*TokenX*/)());
                NonterminalType!(12034) r;
                Location rl;
                gotoParent = parse93(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12034/*Token*/, r);
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12027/*PPIfDef*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Token
    // type: unknown
    //  PPIfDef ->  WSC "#" WSC Identifier>>"ifdef" WSC Token.NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EOF     ->                                           . !anytoken {}
    //  NewLine ->                                           .EOF {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  NewLine ->                                           .NL {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse108(ref NonterminalType!(12027) result, ref Location resultLocation, Location parseStart6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, NonterminalType!12034/*Token*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12007, 12021, 12027]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12021) r;
            Location rl;
            gotoParent = parse62(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12021/*NewLine*/, r);
            currentResultLocation = rl;
        }
        else
        {
            lastError = new SingleParseException!Location(text("unexpected Token \"", lexer.front.content, "\"  \"", lexer.tokenName(lexer.front.symbol), "\""),
                lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12007/*EOF*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12007/*EOF*/)(currentResultLocation, currentResult.get!(12007/*EOF*/)());
                NonterminalType!(12021) r;
                Location rl;
                gotoParent = parse39(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12021/*NewLine*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12021/*NewLine*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12021/*NewLine*/)(currentResultLocation, currentResult.get!(12021/*NewLine*/)());
                NonterminalType!(12027) r;
                Location rl;
                gotoParent = parse109(r, rl, parseStart6, stack6, stack5, stack4, stack3, stack2, stack1/*, next*/);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12027/*PPIfDef*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Token NewLine
    // type: unknown
    //  PPIfDef ->  WSC "#" WSC Identifier>>"ifdef" WSC Token NewLine. {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse109(ref NonterminalType!(12027) result, ref Location resultLocation, Location parseStart7, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, NonterminalType!12034/*Token*/) stack2/+, ParseStackElem!(Location, NonterminalType!12021/*NewLine*/) stack1+/)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce57_PPIfDef/*PPIfDef = WSC "#" WSC Identifier>>"ifdef" WSC Token ^NewLine*/(parseStart7, stack7, stack6, stack5, stack4, stack3, stack2, /*dropped*/);
            result = tmp.val;
            resultLocation = tmp.start;
            return 6;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier
    // type: unknown
    //  PPIfNDef        ->  WSC "#" WSC Identifier>>"ifndef".WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->                                  . !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    //  WSC             ->                                  .WSC2 !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    //  WSC2            ->                                  .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->                                  .BlockComment {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                  .EscapedNewline {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                  .LineComment {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                  .WS {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                  .WSCElem {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                  .repeat(WSCElem) WSCElem {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    private int parse110(ref NonterminalType!(12028) result, ref Location resultLocation, Location parseStart4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12028, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12028) r;
                Location rl;
                gotoParent = parse111(r, rl, parseStart4, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12028/*PPIfNDef*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC
    // type: unknown
    //  PPIfNDef     ->  WSC "#" WSC Identifier>>"ifndef" WSC.Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators ->                                      ."(" {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators ->                                      .")" {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators ->                                      ."," {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators ->                                      .Operator {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Token        ->                                      .TokenX WSC {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX       ->                                      .AllOperators {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX       ->                                      ."#" {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX       ->                                      .CharacterLiteral {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX       ->                                      .Identifier {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX       ->                                      .PpNumber {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX       ->                                      .StringLiteral {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse111(ref NonterminalType!(12028) result, ref Location resultLocation, Location parseStart5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12000, 12028, 12034, 12037]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"#"})
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse82(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"("})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse83(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{")"})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse84(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{","})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse85(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"CharacterLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse86(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse87(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Operator")
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse88(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"PpNumber")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse89(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"StringLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse90(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else
        {
            lastError = new SingleParseException!Location(text("unexpected Token \"", lexer.front.content, "\"  \"", lexer.tokenName(lexer.front.symbol), "\""),
                lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12000/*AllOperators*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12000/*AllOperators*/)(currentResultLocation, currentResult.get!(12000/*AllOperators*/)());
                NonterminalType!(12037) r;
                Location rl;
                gotoParent = parse36(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12037/*TokenX*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12034/*Token*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12034/*Token*/)(currentResultLocation, currentResult.get!(12034/*Token*/)());
                NonterminalType!(12028) r;
                Location rl;
                gotoParent = parse112(r, rl, parseStart5, stack5, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12037/*TokenX*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12037/*TokenX*/)(currentResultLocation, currentResult.get!(12037/*TokenX*/)());
                NonterminalType!(12034) r;
                Location rl;
                gotoParent = parse93(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12034/*Token*/, r);
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12028/*PPIfNDef*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Token
    // type: unknown
    //  PPIfNDef ->  WSC "#" WSC Identifier>>"ifndef" WSC Token.NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EOF      ->                                            . !anytoken {}
    //  NewLine  ->                                            .EOF {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  NewLine  ->                                            .NL {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse112(ref NonterminalType!(12028) result, ref Location resultLocation, Location parseStart6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, NonterminalType!12034/*Token*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12007, 12021, 12028]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12021) r;
            Location rl;
            gotoParent = parse62(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12021/*NewLine*/, r);
            currentResultLocation = rl;
        }
        else
        {
            lastError = new SingleParseException!Location(text("unexpected Token \"", lexer.front.content, "\"  \"", lexer.tokenName(lexer.front.symbol), "\""),
                lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12007/*EOF*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12007/*EOF*/)(currentResultLocation, currentResult.get!(12007/*EOF*/)());
                NonterminalType!(12021) r;
                Location rl;
                gotoParent = parse39(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12021/*NewLine*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12021/*NewLine*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12021/*NewLine*/)(currentResultLocation, currentResult.get!(12021/*NewLine*/)());
                NonterminalType!(12028) r;
                Location rl;
                gotoParent = parse113(r, rl, parseStart6, stack6, stack5, stack4, stack3, stack2, stack1/*, next*/);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12028/*PPIfNDef*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Token NewLine
    // type: unknown
    //  PPIfNDef ->  WSC "#" WSC Identifier>>"ifndef" WSC Token NewLine. {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse113(ref NonterminalType!(12028) result, ref Location resultLocation, Location parseStart7, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, NonterminalType!12034/*Token*/) stack2/+, ParseStackElem!(Location, NonterminalType!12021/*NewLine*/) stack1+/)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce58_PPIfNDef/*PPIfNDef = WSC "#" WSC Identifier>>"ifndef" WSC Token ^NewLine*/(parseStart7, stack7, stack6, stack5, stack4, stack3, stack2, /*dropped*/);
            result = tmp.val;
            resultLocation = tmp.start;
            return 6;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier
    // type: unknown
    //  Include ->  WSC "#" WSC Identifier>>"include".HeaderPart WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    // descent HeaderPart
    private int parse114(ref NonterminalType!(12018) result, ref Location resultLocation, Location parseStart4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12017, 12018]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        {
            {
                NonterminalType!(12017) pt;
                Location rl;
                gotoParent = parseHeaderPart/*182*/(pt, rl);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent == 0);
                currentResult = ParseResultIn.create(12017/*HeaderPart*/, pt);
                currentResultLocation = rl;
            }
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12017/*HeaderPart*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12017/*HeaderPart*/)(currentResultLocation, currentResult.get!(12017/*HeaderPart*/)());
                NonterminalType!(12018) r;
                Location rl;
                gotoParent = parse115(r, rl, parseStart4, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12018/*Include*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier HeaderPart
    // type: unknown
    //  Include         ->  WSC "#" WSC Identifier>>"include" HeaderPart.WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->                                              . !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC             ->                                              .WSC2 !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC2            ->                                              .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->                                              .BlockComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                              .EscapedNewline {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                              .LineComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                              .WS {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                              .WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                              .repeat(WSCElem) WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse115(ref NonterminalType!(12018) result, ref Location resultLocation, Location parseStart5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12017/*HeaderPart*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12018, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12018) r;
                Location rl;
                gotoParent = parse116(r, rl, parseStart5, stack5, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12018/*Include*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier HeaderPart WSC
    // type: unknown
    //  Include ->  WSC "#" WSC Identifier>>"include" HeaderPart WSC.NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EOF     ->                                                  . !anytoken {$end}
    //  NewLine ->                                                  .EOF {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  NewLine ->                                                  .NL {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse116(ref NonterminalType!(12018) result, ref Location resultLocation, Location parseStart6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12017/*HeaderPart*/) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12007, 12018, 12021]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12021) r;
            Location rl;
            gotoParent = parse62(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12021/*NewLine*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12007/*EOF*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12007/*EOF*/)(currentResultLocation, currentResult.get!(12007/*EOF*/)());
                NonterminalType!(12021) r;
                Location rl;
                gotoParent = parse39(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12021/*NewLine*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12021/*NewLine*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12021/*NewLine*/)(currentResultLocation, currentResult.get!(12021/*NewLine*/)());
                NonterminalType!(12018) r;
                Location rl;
                gotoParent = parse117(r, rl, parseStart6, stack6, stack5, stack4, stack3, stack2, stack1/*, next*/);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12018/*Include*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier HeaderPart WSC NewLine
    // type: unknown
    //  Include ->  WSC "#" WSC Identifier>>"include" HeaderPart WSC NewLine. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse117(ref NonterminalType!(12018) result, ref Location resultLocation, Location parseStart7, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12017/*HeaderPart*/) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2/+, ParseStackElem!(Location, NonterminalType!12021/*NewLine*/) stack1+/)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce44_Include/*Include = WSC "#" WSC Identifier>>"include" HeaderPart WSC ^NewLine*/(parseStart7, stack7, stack6, stack5, stack4, stack3, stack2, /*dropped*/);
            result = tmp.val;
            resultLocation = tmp.start;
            return 6;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier
    // type: unknown
    //  IncludeNext ->  WSC "#" WSC Identifier>>"include_next".HeaderPart WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    // descent HeaderPart
    private int parse118(ref NonterminalType!(12019) result, ref Location resultLocation, Location parseStart4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12017, 12019]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        {
            {
                NonterminalType!(12017) pt;
                Location rl;
                gotoParent = parseHeaderPart/*182*/(pt, rl);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent == 0);
                currentResult = ParseResultIn.create(12017/*HeaderPart*/, pt);
                currentResultLocation = rl;
            }
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12017/*HeaderPart*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12017/*HeaderPart*/)(currentResultLocation, currentResult.get!(12017/*HeaderPart*/)());
                NonterminalType!(12019) r;
                Location rl;
                gotoParent = parse119(r, rl, parseStart4, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12019/*IncludeNext*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier HeaderPart
    // type: unknown
    //  IncludeNext     ->  WSC "#" WSC Identifier>>"include_next" HeaderPart.WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->                                                   . !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC             ->                                                   .WSC2 !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC2            ->                                                   .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->                                                   .BlockComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                                   .EscapedNewline {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                                   .LineComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                                   .WS {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                                   .WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                                   .repeat(WSCElem) WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse119(ref NonterminalType!(12019) result, ref Location resultLocation, Location parseStart5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12017/*HeaderPart*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12019, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12019) r;
                Location rl;
                gotoParent = parse120(r, rl, parseStart5, stack5, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12019/*IncludeNext*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier HeaderPart WSC
    // type: unknown
    //  IncludeNext ->  WSC "#" WSC Identifier>>"include_next" HeaderPart WSC.NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EOF         ->                                                       . !anytoken {$end}
    //  NewLine     ->                                                       .EOF {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  NewLine     ->                                                       .NL {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse120(ref NonterminalType!(12019) result, ref Location resultLocation, Location parseStart6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12017/*HeaderPart*/) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12007, 12019, 12021]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12021) r;
            Location rl;
            gotoParent = parse62(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12021/*NewLine*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12007/*EOF*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12007/*EOF*/)(currentResultLocation, currentResult.get!(12007/*EOF*/)());
                NonterminalType!(12021) r;
                Location rl;
                gotoParent = parse39(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12021/*NewLine*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12021/*NewLine*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12021/*NewLine*/)(currentResultLocation, currentResult.get!(12021/*NewLine*/)());
                NonterminalType!(12019) r;
                Location rl;
                gotoParent = parse121(r, rl, parseStart6, stack6, stack5, stack4, stack3, stack2, stack1/*, next*/);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12019/*IncludeNext*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier HeaderPart WSC NewLine
    // type: unknown
    //  IncludeNext ->  WSC "#" WSC Identifier>>"include_next" HeaderPart WSC NewLine. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse121(ref NonterminalType!(12019) result, ref Location resultLocation, Location parseStart7, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12017/*HeaderPart*/) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2/+, ParseStackElem!(Location, NonterminalType!12021/*NewLine*/) stack1+/)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce45_IncludeNext/*IncludeNext = WSC "#" WSC Identifier>>"include_next" HeaderPart WSC ^NewLine*/(parseStart7, stack7, stack6, stack5, stack4, stack3, stack2, /*dropped*/);
            result = tmp.val;
            resultLocation = tmp.start;
            return 6;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier
    // type: unknown
    //  LineAnnotation  ->  WSC "#" WSC Identifier>>"line".WSC PpNumber WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation  ->  WSC "#" WSC Identifier>>"line".WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->                                . !WS !BlockComment !LineComment !EscapedNewline {PpNumber}
    //  WSC             ->                                .WSC2 !WS !BlockComment !LineComment !EscapedNewline {PpNumber}
    //  WSC2            ->                                .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {PpNumber}
    //  WSCElem         ->                                .BlockComment {BlockComment, EscapedNewline, LineComment, PpNumber, WS}
    //  WSCElem         ->                                .EscapedNewline {BlockComment, EscapedNewline, LineComment, PpNumber, WS}
    //  WSCElem         ->                                .LineComment {BlockComment, EscapedNewline, LineComment, PpNumber, WS}
    //  WSCElem         ->                                .WS {BlockComment, EscapedNewline, LineComment, PpNumber, WS}
    //  repeat(WSCElem) ->                                .WSCElem {BlockComment, EscapedNewline, LineComment, PpNumber, WS}
    //  repeat(WSCElem) ->                                .repeat(WSCElem) WSCElem {BlockComment, EscapedNewline, LineComment, PpNumber, WS}
    private int parse122(ref NonterminalType!(12020) result, ref Location resultLocation, Location parseStart4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12020, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12020) r;
                Location rl;
                gotoParent = parse123(r, rl, parseStart4, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12020/*LineAnnotation*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC
    // type: unknown
    //  LineAnnotation ->  WSC "#" WSC Identifier>>"line" WSC.PpNumber WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->  WSC "#" WSC Identifier>>"line" WSC.PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse123(ref NonterminalType!(12020) result, ref Location resultLocation, Location parseStart5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12020]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"PpNumber")
        {
            auto next = popToken();
            NonterminalType!(12020) r;
            Location rl;
            gotoParent = parse124(r, rl, parseStart5, stack5, stack4, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = r;
            resultLocation = rl;
            return gotoParent - 1;
        }
        else
        {
            lastError = new SingleParseException!Location(text("unexpected Token \"", lexer.front.content, "\"  \"", lexer.tokenName(lexer.front.symbol), "\""),
                lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC PpNumber
    // type: unknown
    //  LineAnnotation  ->  WSC "#" WSC Identifier>>"line" WSC PpNumber.WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation  ->  WSC "#" WSC Identifier>>"line" WSC PpNumber.WSC StringLiteral WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->                                             . !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC             ->                                             .WSC2 !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC2            ->                                             .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->                                             .BlockComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                             .EscapedNewline {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                             .LineComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                             .WS {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                             .WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                             .repeat(WSCElem) WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse124(ref NonterminalType!(12020) result, ref Location resultLocation, Location parseStart6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12020, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12020) r;
                Location rl;
                gotoParent = parse125(r, rl, parseStart6, stack6, stack5, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12020/*LineAnnotation*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC PpNumber WSC
    // type: unknown
    //  LineAnnotation ->  WSC "#" WSC Identifier>>"line" WSC PpNumber WSC.NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->  WSC "#" WSC Identifier>>"line" WSC PpNumber WSC.StringLiteral WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EOF            ->                                                 . !anytoken {$end}
    //  NewLine        ->                                                 .EOF {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  NewLine        ->                                                 .NL {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse125(ref NonterminalType!(12020) result, ref Location resultLocation, Location parseStart7, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12007, 12020, 12021]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12021) r;
            Location rl;
            gotoParent = parse62(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12021/*NewLine*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"StringLiteral")
        {
            auto next = popToken();
            NonterminalType!(12020) r;
            Location rl;
            gotoParent = parse126(r, rl, parseStart7, stack7, stack6, stack5, stack4, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = r;
            resultLocation = rl;
            return gotoParent - 1;
        }
        else
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12007/*EOF*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12007/*EOF*/)(currentResultLocation, currentResult.get!(12007/*EOF*/)());
                NonterminalType!(12021) r;
                Location rl;
                gotoParent = parse39(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12021/*NewLine*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12021/*NewLine*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12021/*NewLine*/)(currentResultLocation, currentResult.get!(12021/*NewLine*/)());
                NonterminalType!(12020) r;
                Location rl;
                gotoParent = parse130(r, rl, parseStart7, stack7, stack6, stack5, stack4, stack3, stack2, stack1/*, next*/);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12020/*LineAnnotation*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC PpNumber WSC StringLiteral
    // type: unknown
    //  LineAnnotation  ->  WSC "#" WSC Identifier>>"line" WSC PpNumber WSC StringLiteral.WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->                                                               . !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC             ->                                                               .WSC2 !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC2            ->                                                               .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->                                                               .BlockComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                                               .EscapedNewline {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                                               .LineComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                                               .WS {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                                               .WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                                               .repeat(WSCElem) WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse126(ref NonterminalType!(12020) result, ref Location resultLocation, Location parseStart8, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack8, ParseStackElem!(Location, Token) stack7, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12020, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12020) r;
                Location rl;
                gotoParent = parse127(r, rl, parseStart8, stack8, stack7, stack6, stack5, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12020/*LineAnnotation*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC PpNumber WSC StringLiteral WSC
    // type: unknown
    //  LineAnnotation      ->  WSC "#" WSC Identifier>>"line" WSC PpNumber WSC StringLiteral WSC.repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                                                   . {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                                                   .repeatOrNone(Token) Token {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse127(ref NonterminalType!(12020) result, ref Location resultLocation, Location parseStart9, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack9, ParseStackElem!(Location, Token) stack8, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12020, 12049]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce101/*repeatOrNone(Token) @array = @empty*/();
            currentResult = ParseResultIn.create(12049/*repeatOrNone(Token)*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12049/*repeatOrNone(Token)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/)(currentResultLocation, currentResult.get!(12049/*repeatOrNone(Token)*/)());
                CreatorInstance.NonterminalUnion!([12020, 12049]) r;
                Location rl;
                gotoParent = parse128(r, rl, parseStart9, stack9, stack8, stack7, stack6, stack5, stack4, stack3, stack2, stack1, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12020/*LineAnnotation*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token)
    // type: unknown
    //  LineAnnotation      ->  WSC "#" WSC Identifier>>"line" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token).NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                                                    repeatOrNone(Token).Token {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                                                       ."(" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                                                       .")" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                                                       ."," {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                                                       .Operator {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EOF                 ->                                                                                       . !anytoken {$end}
    //  NewLine             ->                                                                                       .EOF {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  NewLine             ->                                                                                       .NL {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Token               ->                                                                                       .TokenX WSC {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                                                       .AllOperators {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                                                       ."#" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                                                       .CharacterLiteral {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                                                       .Identifier {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                                                       .PpNumber {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                                                       .StringLiteral {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse128(ref CreatorInstance.NonterminalUnion!([12020, 12049]) result, ref Location resultLocation, Location parseStart10, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack10, ParseStackElem!(Location, Token) stack9, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack8, ParseStackElem!(Location, Token) stack7, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, Location parseStart1, ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12000, 12007, 12020, 12021, 12034, 12037, 12049]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"#"})
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse82(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"("})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse83(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{")"})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse84(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{","})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse85(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"CharacterLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse86(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse87(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12021) r;
            Location rl;
            gotoParent = parse62(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12021/*NewLine*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Operator")
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse88(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"PpNumber")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse89(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"StringLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse90(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12000/*AllOperators*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12000/*AllOperators*/)(currentResultLocation, currentResult.get!(12000/*AllOperators*/)());
                NonterminalType!(12037) r;
                Location rl;
                gotoParent = parse36(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12037/*TokenX*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12007/*EOF*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12007/*EOF*/)(currentResultLocation, currentResult.get!(12007/*EOF*/)());
                NonterminalType!(12021) r;
                Location rl;
                gotoParent = parse39(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12021/*NewLine*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12021/*NewLine*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12021/*NewLine*/)(currentResultLocation, currentResult.get!(12021/*NewLine*/)());
                NonterminalType!(12020) r;
                Location rl;
                gotoParent = parse129(r, rl, parseStart10, stack10, stack9, stack8, stack7, stack6, stack5, stack4, stack3, stack2, stack1/*, next*/);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12020/*LineAnnotation*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12034/*Token*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12034/*Token*/)(currentResultLocation, currentResult.get!(12034/*Token*/)());
                NonterminalType!(12049) r;
                Location rl;
                gotoParent = parse92(r, rl, parseStart1, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12049/*repeatOrNone(Token)*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12037/*TokenX*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12037/*TokenX*/)(currentResultLocation, currentResult.get!(12037/*TokenX*/)());
                NonterminalType!(12034) r;
                Location rl;
                gotoParent = parse93(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12034/*Token*/, r);
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine
    // type: unknown
    //  LineAnnotation ->  WSC "#" WSC Identifier>>"line" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse129(ref NonterminalType!(12020) result, ref Location resultLocation, Location parseStart11, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack11, ParseStackElem!(Location, Token) stack10, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack9, ParseStackElem!(Location, Token) stack8, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/) stack2/+, ParseStackElem!(Location, NonterminalType!12021/*NewLine*/) stack1+/)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce49_LineAnnotation/*LineAnnotation = WSC "#" WSC Identifier>>"line" WSC line:PpNumber WSC filename:StringLiteral WSC repeatOrNone(Token) ^NewLine*/(parseStart11, stack11, stack10, stack9, stack8, stack7, stack6, stack5, stack4, stack3, stack2, /*dropped*/);
            result = tmp.val;
            resultLocation = tmp.start;
            return 10;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC PpNumber WSC NewLine
    // type: unknown
    //  LineAnnotation ->  WSC "#" WSC Identifier>>"line" WSC PpNumber WSC NewLine. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse130(ref NonterminalType!(12020) result, ref Location resultLocation, Location parseStart8, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack8, ParseStackElem!(Location, Token) stack7, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2/+, ParseStackElem!(Location, NonterminalType!12021/*NewLine*/) stack1+/)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce48_LineAnnotation/*LineAnnotation = WSC "#" WSC Identifier>>"line" WSC line:PpNumber WSC ^NewLine*/(parseStart8, stack8, stack7, stack6, stack5, stack4, stack3, stack2, /*dropped*/);
            result = tmp.val;
            resultLocation = tmp.start;
            return 7;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier
    // type: unknown
    //  Pragma          ->  WSC "#" WSC Identifier>>"pragma".WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->                                  . !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC             ->                                  .WSC2 !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC2            ->                                  .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->                                  .BlockComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                  .EscapedNewline {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                  .LineComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                  .WS {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                  .WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                  .repeat(WSCElem) WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse131(ref NonterminalType!(12031) result, ref Location resultLocation, Location parseStart4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12031, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12031) r;
                Location rl;
                gotoParent = parse132(r, rl, parseStart4, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12031/*Pragma*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC
    // type: unknown
    //  Pragma              ->  WSC "#" WSC Identifier>>"pragma" WSC.repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                      . {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                      .repeatOrNone(Token) Token {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse132(ref NonterminalType!(12031) result, ref Location resultLocation, Location parseStart5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12031, 12049]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce101/*repeatOrNone(Token) @array = @empty*/();
            currentResult = ParseResultIn.create(12049/*repeatOrNone(Token)*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12049/*repeatOrNone(Token)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/)(currentResultLocation, currentResult.get!(12049/*repeatOrNone(Token)*/)());
                CreatorInstance.NonterminalUnion!([12031, 12049]) r;
                Location rl;
                gotoParent = parse133(r, rl, parseStart5, stack5, stack4, stack3, stack2, stack1, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12031/*Pragma*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC repeatOrNone(Token)
    // type: unknown
    //  Pragma              ->  WSC "#" WSC Identifier>>"pragma" WSC repeatOrNone(Token).NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                       repeatOrNone(Token).Token {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                          ."(" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                          .")" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                          ."," {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                          .Operator {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EOF                 ->                                                          . !anytoken {$end}
    //  NewLine             ->                                                          .EOF {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  NewLine             ->                                                          .NL {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Token               ->                                                          .TokenX WSC {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                          .AllOperators {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                          ."#" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                          .CharacterLiteral {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                          .Identifier {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                          .PpNumber {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                          .StringLiteral {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse133(ref CreatorInstance.NonterminalUnion!([12031, 12049]) result, ref Location resultLocation, Location parseStart6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, Location parseStart1, ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12000, 12007, 12021, 12031, 12034, 12037, 12049]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"#"})
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse82(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"("})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse83(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{")"})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse84(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{","})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse85(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"CharacterLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse86(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse87(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12021) r;
            Location rl;
            gotoParent = parse62(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12021/*NewLine*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Operator")
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse88(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"PpNumber")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse89(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"StringLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse90(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12000/*AllOperators*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12000/*AllOperators*/)(currentResultLocation, currentResult.get!(12000/*AllOperators*/)());
                NonterminalType!(12037) r;
                Location rl;
                gotoParent = parse36(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12037/*TokenX*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12007/*EOF*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12007/*EOF*/)(currentResultLocation, currentResult.get!(12007/*EOF*/)());
                NonterminalType!(12021) r;
                Location rl;
                gotoParent = parse39(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12021/*NewLine*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12021/*NewLine*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12021/*NewLine*/)(currentResultLocation, currentResult.get!(12021/*NewLine*/)());
                NonterminalType!(12031) r;
                Location rl;
                gotoParent = parse134(r, rl, parseStart6, stack6, stack5, stack4, stack3, stack2, stack1/*, next*/);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12031/*Pragma*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12034/*Token*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12034/*Token*/)(currentResultLocation, currentResult.get!(12034/*Token*/)());
                NonterminalType!(12049) r;
                Location rl;
                gotoParent = parse92(r, rl, parseStart1, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12049/*repeatOrNone(Token)*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12037/*TokenX*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12037/*TokenX*/)(currentResultLocation, currentResult.get!(12037/*TokenX*/)());
                NonterminalType!(12034) r;
                Location rl;
                gotoParent = parse93(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12034/*Token*/, r);
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC repeatOrNone(Token) NewLine
    // type: unknown
    //  Pragma ->  WSC "#" WSC Identifier>>"pragma" WSC repeatOrNone(Token) NewLine. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse134(ref NonterminalType!(12031) result, ref Location resultLocation, Location parseStart7, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/) stack2/+, ParseStackElem!(Location, NonterminalType!12021/*NewLine*/) stack1+/)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce61_Pragma/*Pragma = WSC "#" WSC Identifier>>"pragma" WSC repeatOrNone(Token) ^NewLine*/(parseStart7, stack7, stack6, stack5, stack4, stack3, stack2, /*dropped*/);
            result = tmp.val;
            resultLocation = tmp.start;
            return 6;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier
    // type: unknown
    //  Undef           ->  WSC "#" WSC Identifier>>"undef".WSC Identifier WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->                                 . !WS !BlockComment !LineComment !EscapedNewline {Identifier}
    //  WSC             ->                                 .WSC2 !WS !BlockComment !LineComment !EscapedNewline {Identifier}
    //  WSC2            ->                                 .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {Identifier}
    //  WSCElem         ->                                 .BlockComment {BlockComment, EscapedNewline, Identifier, LineComment, WS}
    //  WSCElem         ->                                 .EscapedNewline {BlockComment, EscapedNewline, Identifier, LineComment, WS}
    //  WSCElem         ->                                 .LineComment {BlockComment, EscapedNewline, Identifier, LineComment, WS}
    //  WSCElem         ->                                 .WS {BlockComment, EscapedNewline, Identifier, LineComment, WS}
    //  repeat(WSCElem) ->                                 .WSCElem {BlockComment, EscapedNewline, Identifier, LineComment, WS}
    //  repeat(WSCElem) ->                                 .repeat(WSCElem) WSCElem {BlockComment, EscapedNewline, Identifier, LineComment, WS}
    private int parse135(ref NonterminalType!(12039) result, ref Location resultLocation, Location parseStart4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12039, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12039) r;
                Location rl;
                gotoParent = parse136(r, rl, parseStart4, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12039/*Undef*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC
    // type: unknown
    //  Undef ->  WSC "#" WSC Identifier>>"undef" WSC.Identifier WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse136(ref NonterminalType!(12039) result, ref Location resultLocation, Location parseStart5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12039]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier")
        {
            auto next = popToken();
            NonterminalType!(12039) r;
            Location rl;
            gotoParent = parse137(r, rl, parseStart5, stack5, stack4, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = r;
            resultLocation = rl;
            return gotoParent - 1;
        }
        else
        {
            lastError = new SingleParseException!Location(text("unexpected Token \"", lexer.front.content, "\"  \"", lexer.tokenName(lexer.front.symbol), "\""),
                lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier
    // type: unknown
    //  Undef           ->  WSC "#" WSC Identifier>>"undef" WSC Identifier.WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->                                                . !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC             ->                                                .WSC2 !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC2            ->                                                .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->                                                .BlockComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                                .EscapedNewline {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                                .LineComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                                .WS {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                                .WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                                .repeat(WSCElem) WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse137(ref NonterminalType!(12039) result, ref Location resultLocation, Location parseStart6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12039, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12039) r;
                Location rl;
                gotoParent = parse138(r, rl, parseStart6, stack6, stack5, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12039/*Undef*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier WSC
    // type: unknown
    //  Undef   ->  WSC "#" WSC Identifier>>"undef" WSC Identifier WSC.NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EOF     ->                                                    . !anytoken {$end}
    //  NewLine ->                                                    .EOF {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  NewLine ->                                                    .NL {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse138(ref NonterminalType!(12039) result, ref Location resultLocation, Location parseStart7, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12007, 12021, 12039]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12021) r;
            Location rl;
            gotoParent = parse62(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12021/*NewLine*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12007/*EOF*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12007/*EOF*/)(currentResultLocation, currentResult.get!(12007/*EOF*/)());
                NonterminalType!(12021) r;
                Location rl;
                gotoParent = parse39(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12021/*NewLine*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12021/*NewLine*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12021/*NewLine*/)(currentResultLocation, currentResult.get!(12021/*NewLine*/)());
                NonterminalType!(12039) r;
                Location rl;
                gotoParent = parse139(r, rl, parseStart7, stack7, stack6, stack5, stack4, stack3, stack2, stack1/*, next*/);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12039/*Undef*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC Identifier WSC NewLine
    // type: unknown
    //  Undef ->  WSC "#" WSC Identifier>>"undef" WSC Identifier WSC NewLine. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse139(ref NonterminalType!(12039) result, ref Location resultLocation, Location parseStart8, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack8, ParseStackElem!(Location, Token) stack7, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2/+, ParseStackElem!(Location, NonterminalType!12021/*NewLine*/) stack1+/)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce82_Undef/*Undef = WSC "#" WSC Identifier>>"undef" WSC Identifier WSC ^NewLine*/(parseStart8, stack8, stack7, stack6, stack5, stack4, stack3, stack2, /*dropped*/);
            result = tmp.val;
            resultLocation = tmp.start;
            return 7;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier
    // type: unknown
    //  PPWarning       ->  WSC "#" WSC Identifier>>"warning".WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->                                   . !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC             ->                                   .WSC2 !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC2            ->                                   .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->                                   .BlockComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                   .EscapedNewline {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                   .LineComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                   .WS {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                   .WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                   .repeat(WSCElem) WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse140(ref NonterminalType!(12029) result, ref Location resultLocation, Location parseStart4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12029, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12029) r;
                Location rl;
                gotoParent = parse141(r, rl, parseStart4, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12029/*PPWarning*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC
    // type: unknown
    //  PPWarning           ->  WSC "#" WSC Identifier>>"warning" WSC.repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                       . {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                       .repeatOrNone(Token) Token {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse141(ref NonterminalType!(12029) result, ref Location resultLocation, Location parseStart5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12029, 12049]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce101/*repeatOrNone(Token) @array = @empty*/();
            currentResult = ParseResultIn.create(12049/*repeatOrNone(Token)*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12049/*repeatOrNone(Token)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/)(currentResultLocation, currentResult.get!(12049/*repeatOrNone(Token)*/)());
                CreatorInstance.NonterminalUnion!([12029, 12049]) r;
                Location rl;
                gotoParent = parse142(r, rl, parseStart5, stack5, stack4, stack3, stack2, stack1, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12029/*PPWarning*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC repeatOrNone(Token)
    // type: unknown
    //  PPWarning           ->  WSC "#" WSC Identifier>>"warning" WSC repeatOrNone(Token).NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                        repeatOrNone(Token).Token {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                           ."(" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                           .")" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                           ."," {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                           .Operator {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EOF                 ->                                                           . !anytoken {$end}
    //  NewLine             ->                                                           .EOF {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  NewLine             ->                                                           .NL {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Token               ->                                                           .TokenX WSC {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                           .AllOperators {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                           ."#" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                           .CharacterLiteral {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                           .Identifier {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                           .PpNumber {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                           .StringLiteral {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse142(ref CreatorInstance.NonterminalUnion!([12029, 12049]) result, ref Location resultLocation, Location parseStart6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, Location parseStart1, ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12000, 12007, 12021, 12029, 12034, 12037, 12049]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"#"})
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse82(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"("})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse83(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{")"})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse84(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{","})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse85(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"CharacterLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse86(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse87(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12021) r;
            Location rl;
            gotoParent = parse62(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12021/*NewLine*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Operator")
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse88(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"PpNumber")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse89(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"StringLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse90(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12000/*AllOperators*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12000/*AllOperators*/)(currentResultLocation, currentResult.get!(12000/*AllOperators*/)());
                NonterminalType!(12037) r;
                Location rl;
                gotoParent = parse36(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12037/*TokenX*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12007/*EOF*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12007/*EOF*/)(currentResultLocation, currentResult.get!(12007/*EOF*/)());
                NonterminalType!(12021) r;
                Location rl;
                gotoParent = parse39(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12021/*NewLine*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12021/*NewLine*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12021/*NewLine*/)(currentResultLocation, currentResult.get!(12021/*NewLine*/)());
                NonterminalType!(12029) r;
                Location rl;
                gotoParent = parse143(r, rl, parseStart6, stack6, stack5, stack4, stack3, stack2, stack1/*, next*/);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12029/*PPWarning*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12034/*Token*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12034/*Token*/)(currentResultLocation, currentResult.get!(12034/*Token*/)());
                NonterminalType!(12049) r;
                Location rl;
                gotoParent = parse92(r, rl, parseStart1, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12049/*repeatOrNone(Token)*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12037/*TokenX*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12037/*TokenX*/)(currentResultLocation, currentResult.get!(12037/*TokenX*/)());
                NonterminalType!(12034) r;
                Location rl;
                gotoParent = parse93(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12034/*Token*/, r);
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC repeatOrNone(Token) NewLine
    // type: unknown
    //  PPWarning ->  WSC "#" WSC Identifier>>"warning" WSC repeatOrNone(Token) NewLine. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse143(ref NonterminalType!(12029) result, ref Location resultLocation, Location parseStart7, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/) stack2/+, ParseStackElem!(Location, NonterminalType!12021/*NewLine*/) stack1+/)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce59_PPWarning/*PPWarning = WSC "#" WSC Identifier>>"warning" WSC repeatOrNone(Token) ^NewLine*/(parseStart7, stack7, stack6, stack5, stack4, stack3, stack2, /*dropped*/);
            result = tmp.val;
            resultLocation = tmp.start;
            return 6;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC PpNumber
    // type: unknown
    //  LineAnnotation  ->  WSC "#" WSC PpNumber.WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation  ->  WSC "#" WSC PpNumber.WSC StringLiteral WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->                      . !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC             ->                      .WSC2 !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC2            ->                      .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->                      .BlockComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                      .EscapedNewline {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                      .LineComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                      .WS {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                      .WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                      .repeat(WSCElem) WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse144(ref NonterminalType!(12020) result, ref Location resultLocation, Location parseStart4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12020, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12020) r;
                Location rl;
                gotoParent = parse145(r, rl, parseStart4, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12020/*LineAnnotation*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC PpNumber WSC
    // type: unknown
    //  LineAnnotation ->  WSC "#" WSC PpNumber WSC.NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->  WSC "#" WSC PpNumber WSC.StringLiteral WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EOF            ->                          . !anytoken {$end}
    //  NewLine        ->                          .EOF {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  NewLine        ->                          .NL {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse145(ref NonterminalType!(12020) result, ref Location resultLocation, Location parseStart5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12007, 12020, 12021]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12021) r;
            Location rl;
            gotoParent = parse62(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12021/*NewLine*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"StringLiteral")
        {
            auto next = popToken();
            NonterminalType!(12020) r;
            Location rl;
            gotoParent = parse146(r, rl, parseStart5, stack5, stack4, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = r;
            resultLocation = rl;
            return gotoParent - 1;
        }
        else
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12007/*EOF*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12007/*EOF*/)(currentResultLocation, currentResult.get!(12007/*EOF*/)());
                NonterminalType!(12021) r;
                Location rl;
                gotoParent = parse39(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12021/*NewLine*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12021/*NewLine*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12021/*NewLine*/)(currentResultLocation, currentResult.get!(12021/*NewLine*/)());
                NonterminalType!(12020) r;
                Location rl;
                gotoParent = parse150(r, rl, parseStart5, stack5, stack4, stack3, stack2, stack1/*, next*/);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12020/*LineAnnotation*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC PpNumber WSC StringLiteral
    // type: unknown
    //  LineAnnotation  ->  WSC "#" WSC PpNumber WSC StringLiteral.WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->                                        . !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC             ->                                        .WSC2 !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC2            ->                                        .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->                                        .BlockComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                        .EscapedNewline {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                        .LineComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                        .WS {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                        .WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                        .repeat(WSCElem) WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse146(ref NonterminalType!(12020) result, ref Location resultLocation, Location parseStart6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12020, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12020) r;
                Location rl;
                gotoParent = parse147(r, rl, parseStart6, stack6, stack5, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12020/*LineAnnotation*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC PpNumber WSC StringLiteral WSC
    // type: unknown
    //  LineAnnotation      ->  WSC "#" WSC PpNumber WSC StringLiteral WSC.repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                            . {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                            .repeatOrNone(Token) Token {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse147(ref NonterminalType!(12020) result, ref Location resultLocation, Location parseStart7, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12020, 12049]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce101/*repeatOrNone(Token) @array = @empty*/();
            currentResult = ParseResultIn.create(12049/*repeatOrNone(Token)*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12049/*repeatOrNone(Token)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/)(currentResultLocation, currentResult.get!(12049/*repeatOrNone(Token)*/)());
                CreatorInstance.NonterminalUnion!([12020, 12049]) r;
                Location rl;
                gotoParent = parse148(r, rl, parseStart7, stack7, stack6, stack5, stack4, stack3, stack2, stack1, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12020/*LineAnnotation*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token)
    // type: unknown
    //  LineAnnotation      ->  WSC "#" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token).NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                             repeatOrNone(Token).Token {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                                ."(" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                                .")" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                                ."," {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                                .Operator {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EOF                 ->                                                                . !anytoken {$end}
    //  NewLine             ->                                                                .EOF {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  NewLine             ->                                                                .NL {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Token               ->                                                                .TokenX WSC {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                                .AllOperators {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                                ."#" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                                .CharacterLiteral {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                                .Identifier {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                                .PpNumber {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                                .StringLiteral {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse148(ref CreatorInstance.NonterminalUnion!([12020, 12049]) result, ref Location resultLocation, Location parseStart8, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack8, ParseStackElem!(Location, Token) stack7, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, Location parseStart1, ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12000, 12007, 12020, 12021, 12034, 12037, 12049]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"#"})
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse82(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"("})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse83(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{")"})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse84(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{","})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse85(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"CharacterLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse86(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse87(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12021) r;
            Location rl;
            gotoParent = parse62(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12021/*NewLine*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Operator")
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse88(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"PpNumber")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse89(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"StringLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse90(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12000/*AllOperators*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12000/*AllOperators*/)(currentResultLocation, currentResult.get!(12000/*AllOperators*/)());
                NonterminalType!(12037) r;
                Location rl;
                gotoParent = parse36(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12037/*TokenX*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12007/*EOF*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12007/*EOF*/)(currentResultLocation, currentResult.get!(12007/*EOF*/)());
                NonterminalType!(12021) r;
                Location rl;
                gotoParent = parse39(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12021/*NewLine*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12021/*NewLine*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12021/*NewLine*/)(currentResultLocation, currentResult.get!(12021/*NewLine*/)());
                NonterminalType!(12020) r;
                Location rl;
                gotoParent = parse149(r, rl, parseStart8, stack8, stack7, stack6, stack5, stack4, stack3, stack2, stack1/*, next*/);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12020/*LineAnnotation*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12034/*Token*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12034/*Token*/)(currentResultLocation, currentResult.get!(12034/*Token*/)());
                NonterminalType!(12049) r;
                Location rl;
                gotoParent = parse92(r, rl, parseStart1, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12049/*repeatOrNone(Token)*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12037/*TokenX*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12037/*TokenX*/)(currentResultLocation, currentResult.get!(12037/*TokenX*/)());
                NonterminalType!(12034) r;
                Location rl;
                gotoParent = parse93(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12034/*Token*/, r);
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine
    // type: unknown
    //  LineAnnotation ->  WSC "#" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse149(ref NonterminalType!(12020) result, ref Location resultLocation, Location parseStart9, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack9, ParseStackElem!(Location, Token) stack8, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/) stack2/+, ParseStackElem!(Location, NonterminalType!12021/*NewLine*/) stack1+/)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce47_LineAnnotation/*LineAnnotation = WSC "#" WSC line:PpNumber WSC filename:StringLiteral WSC repeatOrNone(Token) ^NewLine*/(parseStart9, stack9, stack8, stack7, stack6, stack5, stack4, stack3, stack2, /*dropped*/);
            result = tmp.val;
            resultLocation = tmp.start;
            return 8;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC PpNumber WSC NewLine
    // type: unknown
    //  LineAnnotation ->  WSC "#" WSC PpNumber WSC NewLine. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse150(ref NonterminalType!(12020) result, ref Location resultLocation, Location parseStart6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2/+, ParseStackElem!(Location, NonterminalType!12021/*NewLine*/) stack1+/)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce46_LineAnnotation/*LineAnnotation = WSC "#" WSC line:PpNumber WSC ^NewLine*/(parseStart6, stack6, stack5, stack4, stack3, stack2, /*dropped*/);
            result = tmp.val;
            resultLocation = tmp.start;
            return 5;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC "#" WSC NewLine
    // type: unknown
    //  EmptyDirective ->  WSC "#" WSC NewLine. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse151(ref NonterminalType!(12008) result, ref Location resultLocation, Location parseStart4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2/+, ParseStackElem!(Location, NonterminalType!12021/*NewLine*/) stack1+/)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce24_EmptyDirective/*EmptyDirective = WSC "#" WSC ^NewLine*/(parseStart4, stack4, stack3, stack2, /*dropped*/);
            result = tmp.val;
            resultLocation = tmp.start;
            return 3;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC Token
    // type: unknown
    //  repeat(Token) ->  Token. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse152(ref NonterminalType!(12046) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12034/*Token*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce95/*repeat(Token) @array = Token*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC repeat(Token)
    // type: unknown
    //  TextLine      ->  WSC !"#" repeat(Token).NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(Token) ->           repeat(Token).Token {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators  ->                        ."(" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators  ->                        .")" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators  ->                        ."," {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators  ->                        .Operator {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EOF           ->                        . !anytoken {$end}
    //  NewLine       ->                        .EOF {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  NewLine       ->                        .NL {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Token         ->                        .TokenX WSC {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX        ->                        .AllOperators {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX        ->                        ."#" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX        ->                        .CharacterLiteral {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX        ->                        .Identifier {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX        ->                        .PpNumber {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX        ->                        .StringLiteral {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse153(ref CreatorInstance.NonterminalUnion!([12033, 12046]) result, ref Location resultLocation, Location parseStart2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, Location parseStart1, ParseStackElem!(Location, NonterminalType!12046/*repeat(Token)*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12000, 12007, 12021, 12033, 12034, 12037, 12046]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"#"})
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse82(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"("})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse83(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{")"})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse84(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{","})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse85(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"CharacterLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse86(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse87(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12021) r;
            Location rl;
            gotoParent = parse62(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12021/*NewLine*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Operator")
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse88(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"PpNumber")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse89(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"StringLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse90(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12000/*AllOperators*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12000/*AllOperators*/)(currentResultLocation, currentResult.get!(12000/*AllOperators*/)());
                NonterminalType!(12037) r;
                Location rl;
                gotoParent = parse36(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12037/*TokenX*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12007/*EOF*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12007/*EOF*/)(currentResultLocation, currentResult.get!(12007/*EOF*/)());
                NonterminalType!(12021) r;
                Location rl;
                gotoParent = parse39(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12021/*NewLine*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12021/*NewLine*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12021/*NewLine*/)(currentResultLocation, currentResult.get!(12021/*NewLine*/)());
                NonterminalType!(12033) r;
                Location rl;
                gotoParent = parse154(r, rl, parseStart2, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12033/*TextLine*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12034/*Token*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12034/*Token*/)(currentResultLocation, currentResult.get!(12034/*Token*/)());
                NonterminalType!(12046) r;
                Location rl;
                gotoParent = parse155(r, rl, parseStart1, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12046/*repeat(Token)*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12037/*TokenX*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12037/*TokenX*/)(currentResultLocation, currentResult.get!(12037/*TokenX*/)());
                NonterminalType!(12034) r;
                Location rl;
                gotoParent = parse93(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12034/*Token*/, r);
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC repeat(Token) NewLine
    // type: unknown
    //  TextLine ->  WSC !"#" repeat(Token) NewLine. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse154(ref NonterminalType!(12033) result, ref Location resultLocation, Location parseStart3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, NonterminalType!12046/*repeat(Token)*/) stack2, ParseStackElem!(Location, NonterminalType!12021/*NewLine*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce63_TextLine/*TextLine = WSC !"#" repeat(Token) NewLine*/(parseStart3, stack3, stack2, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 2;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC repeat(Token) Token
    // type: unknown
    //  repeat(Token) ->  repeat(Token) Token. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse155(ref NonterminalType!(12046) result, ref Location resultLocation, Location parseStart2, ParseStackElem!(Location, NonterminalType!12046/*repeat(Token)*/) stack2, ParseStackElem!(Location, NonterminalType!12034/*Token*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce94/*repeat(Token) @array = repeat(Token) Token*/(parseStart2, stack2, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 1;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC repeat(Token)
    // type: unknown
    //  repeat(Token) ->  repeat(Token).Token {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators  ->               ."(" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators  ->               .")" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators  ->               ."," {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators  ->               .Operator {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Token         ->               .TokenX WSC {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX        ->               .AllOperators {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX        ->               ."#" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX        ->               .CharacterLiteral {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX        ->               .Identifier {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX        ->               .PpNumber {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX        ->               .StringLiteral {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse156(ref NonterminalType!(12046) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12046/*repeat(Token)*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12000, 12034, 12037, 12046]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"#"})
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse82(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"("})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse83(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{")"})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse84(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{","})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse85(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"CharacterLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse86(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse87(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Operator")
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse88(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"PpNumber")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse89(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"StringLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse90(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else
        {
            lastError = new SingleParseException!Location(text("unexpected Token \"", lexer.front.content, "\"  \"", lexer.tokenName(lexer.front.symbol), "\""),
                lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12000/*AllOperators*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12000/*AllOperators*/)(currentResultLocation, currentResult.get!(12000/*AllOperators*/)());
                NonterminalType!(12037) r;
                Location rl;
                gotoParent = parse36(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12037/*TokenX*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12034/*Token*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12034/*Token*/)(currentResultLocation, currentResult.get!(12034/*Token*/)());
                NonterminalType!(12046) r;
                Location rl;
                gotoParent = parse155(r, rl, parseStart1, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12037/*TokenX*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12037/*TokenX*/)(currentResultLocation, currentResult.get!(12037/*TokenX*/)());
                NonterminalType!(12034) r;
                Location rl;
                gotoParent = parse93(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12034/*Token*/, r);
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12046/*repeat(Token)*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC2
    // type: unknown
    //  EmptyLine ->  WSC2.NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC       ->  WSC2. !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    //  EOF       ->      . !anytoken {$end}
    //  NewLine   ->      .EOF {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  NewLine   ->      .NL {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse157(ref CreatorInstance.NonterminalUnion!([12009, 12042]) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12043/*WSC2*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12007, 12009, 12021, 12042]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"#"} || lexer.front.symbol == Lexer.tokenID!q{"("} || lexer.front.symbol == Lexer.tokenID!q{")"} || lexer.front.symbol == Lexer.tokenID!q{","} || lexer.front.symbol == Lexer.tokenID!"CharacterLiteral" || lexer.front.symbol == Lexer.tokenID!"Identifier" || lexer.front.symbol == Lexer.tokenID!"Operator" || lexer.front.symbol == Lexer.tokenID!"PpNumber" || lexer.front.symbol == Lexer.tokenID!"StringLiteral")
        {
            auto tmp = reduce85_WSC/*WSC @array = WSC2 !WS !BlockComment !LineComment !EscapedNewline*/(parseStart1, stack1);
            result = ThisParseResult.create(12042/*WSC*/, tmp.val);
            resultLocation = tmp.start;
            return 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12021) r;
            Location rl;
            gotoParent = parse62(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12021/*NewLine*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12007/*EOF*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12007/*EOF*/)(currentResultLocation, currentResult.get!(12007/*EOF*/)());
                NonterminalType!(12021) r;
                Location rl;
                gotoParent = parse39(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12021/*NewLine*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12021/*NewLine*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12021/*NewLine*/)(currentResultLocation, currentResult.get!(12021/*NewLine*/)());
                NonterminalType!(12009) r;
                Location rl;
                gotoParent = parse158(r, rl, parseStart1, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12009/*EmptyLine*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) PPElse repeatOrNone(GroupPart) WSC2 NewLine
    // type: unknown
    //  EmptyLine ->  WSC2 NewLine. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse158(ref NonterminalType!(12009) result, ref Location resultLocation, Location parseStart2, ParseStackElem!(Location, NonterminalType!12043/*WSC2*/) stack2, ParseStackElem!(Location, NonterminalType!12021/*NewLine*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce26_EmptyLine/*EmptyLine = WSC2 NewLine*/(parseStart2, stack2, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 1;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) WSC
    // type: unknown
    //  EmptyDirective ->           WSC."#" WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  FuncDefine     ->           WSC."#" WSC Identifier>>"define" WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Include        ->           WSC."#" WSC Identifier>>"include" HeaderPart WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  IncludeNext    ->           WSC."#" WSC Identifier>>"include_next" HeaderPart WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->           WSC."#" WSC Identifier>>"line" WSC PpNumber WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->           WSC."#" WSC Identifier>>"line" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->           WSC."#" WSC PpNumber WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->           WSC."#" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPElif         ->           WSC."#" WSC Identifier>>"elif" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPElse         ->           WSC."#" WSC Identifier>>"else" WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPEndif        ->           WSC."#" WSC Identifier>>"endif" WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPError        ->           WSC."#" WSC Identifier>>"error" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIf           ->           WSC."#" WSC Identifier>>"if" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfDef        ->           WSC."#" WSC Identifier>>"ifdef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfNDef       ->           WSC."#" WSC Identifier>>"ifndef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPWarning      ->           WSC."#" WSC Identifier>>"warning" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Pragma         ->           WSC."#" WSC Identifier>>"pragma" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TextLine       ->           WSC.!"#" repeat(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Undef          ->           WSC."#" WSC Identifier>>"undef" WSC Identifier WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  VarDefine      ->           WSC."#" WSC Identifier>>"define" WSC VarDefineName WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators   ->              .!"#" "(" {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators   ->              .!"#" ")" {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators   ->              .!"#" "," {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators   ->              .!"#" Operator {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Token          ->              .!"#" TokenX WSC {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX         ->              .!"#" AllOperators {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX         -> @@disabled@@ ."#" {}
    //  TokenX         ->              .!"#" CharacterLiteral {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX         ->              .!"#" Identifier {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX         ->              .!"#" PpNumber {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX         ->              .!"#" StringLiteral {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(Token)  ->              .!"#" Token {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(Token)  ->              .!"#" repeat(Token) Token {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse160(ref CreatorInstance.NonterminalUnion!([12008, 12010, 12018, 12019, 12020, 12022, 12023, 12024, 12025, 12026, 12027, 12028, 12029, 12031, 12033, 12039, 12040]) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        bool disallowToken1/+"#"+/;
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12000, 12008, 12010, 12018, 12019, 12020, 12022, 12023, 12024, 12025, 12026, 12027, 12028, 12029, 12031, 12033, 12034, 12037, 12039, 12040, 12046]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"#"})
        {
            disallowToken1/+"#"+/ = true;
            auto next = popToken();
            CreatorInstance.NonterminalUnion!([12008, 12010, 12018, 12019, 12020, 12022, 12023, 12024, 12025, 12026, 12027, 12028, 12029, 12031, 12037, 12039, 12040]) r;
            Location rl;
            gotoParent = parse161(r, rl, parseStart1, stack1, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = r;
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"("})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse83(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{")"})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse84(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{","})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse85(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"CharacterLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse86(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse87(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Operator")
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse88(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"PpNumber")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse89(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"StringLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse90(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else
        {
            lastError = new SingleParseException!Location(text("unexpected Token \"", lexer.front.content, "\"  \"", lexer.tokenName(lexer.front.symbol), "\""),
                lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12000/*AllOperators*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12000/*AllOperators*/)(currentResultLocation, currentResult.get!(12000/*AllOperators*/)());
                NonterminalType!(12037) r;
                Location rl;
                gotoParent = parse36(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12037/*TokenX*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12034/*Token*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12034/*Token*/)(currentResultLocation, currentResult.get!(12034/*Token*/)());
                NonterminalType!(12046) r;
                Location rl;
                gotoParent = parse152(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12046/*repeat(Token)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12037/*TokenX*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12037/*TokenX*/)(currentResultLocation, currentResult.get!(12037/*TokenX*/)());
                NonterminalType!(12034) r;
                Location rl;
                gotoParent = parse93(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12034/*Token*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12046/*repeat(Token)*/)
            {
                if (disallowToken1/+"#"+/ == false)
                {
                    auto next = ParseStackElem!(Location, NonterminalType!12046/*repeat(Token)*/)(currentResultLocation, currentResult.get!(12046/*repeat(Token)*/)());
                    CreatorInstance.NonterminalUnion!([12033, 12046]) r;
                    Location rl;
                    gotoParent = parse153(r, rl, parseStart1, stack1, currentStart, next);
                    if (gotoParent < 0)
                        return gotoParent;
                    currentResult = r;
                    currentResultLocation = rl;
                }
                else if (disallowToken1/+"#"+/ == true)
                {
                    auto next = ParseStackElem!(Location, NonterminalType!12046/*repeat(Token)*/)(currentResultLocation, currentResult.get!(12046/*repeat(Token)*/)());
                    NonterminalType!(12046) r;
                    Location rl;
                    gotoParent = parse156(r, rl, currentStart, next);
                    if (gotoParent < 0)
                        return gotoParent;
                    currentResult = ParseResultIn.create(12046/*repeat(Token)*/, r);
                    currentResultLocation = rl;
                }
                else
                    assert(false);
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) WSC "#"
    // type: unknown
    //  EmptyDirective  ->           WSC "#".WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  FuncDefine      ->           WSC "#".WSC Identifier>>"define" WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Include         ->           WSC "#".WSC Identifier>>"include" HeaderPart WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  IncludeNext     ->           WSC "#".WSC Identifier>>"include_next" HeaderPart WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation  ->           WSC "#".WSC Identifier>>"line" WSC PpNumber WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation  ->           WSC "#".WSC Identifier>>"line" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation  ->           WSC "#".WSC PpNumber WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation  ->           WSC "#".WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPElif          ->           WSC "#".WSC Identifier>>"elif" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPElse          ->           WSC "#".WSC Identifier>>"else" WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPEndif         ->           WSC "#".WSC Identifier>>"endif" WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPError         ->           WSC "#".WSC Identifier>>"error" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIf            ->           WSC "#".WSC Identifier>>"if" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfDef         ->           WSC "#".WSC Identifier>>"ifdef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfNDef        ->           WSC "#".WSC Identifier>>"ifndef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPWarning       ->           WSC "#".WSC Identifier>>"warning" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Pragma          ->           WSC "#".WSC Identifier>>"pragma" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Undef           ->           WSC "#".WSC Identifier>>"undef" WSC Identifier WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  VarDefine       ->           WSC "#".WSC Identifier>>"define" WSC VarDefineName WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX          -> @@disabled@@  "#". {}
    //  WSC             ->                  . !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC             ->                  .WSC2 !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC2            ->                  .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->                  .BlockComment {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                  .EscapedNewline {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                  .LineComment {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                  .WS {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                  .WSCElem {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                  .repeat(WSCElem) WSCElem {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse161(ref CreatorInstance.NonterminalUnion!([12008, 12010, 12018, 12019, 12020, 12022, 12023, 12024, 12025, 12026, 12027, 12028, 12029, 12031, 12037, 12039, 12040]) result, ref Location resultLocation, Location parseStart2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12008, 12010, 12018, 12019, 12020, 12022, 12023, 12024, 12025, 12026, 12027, 12028, 12029, 12031, 12037, 12039, 12040, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                CreatorInstance.NonterminalUnion!([12008, 12010, 12018, 12019, 12020, 12022, 12023, 12024, 12025, 12026, 12027, 12028, 12029, 12031, 12039, 12040]) r;
                Location rl;
                gotoParent = parse162(r, rl, parseStart2, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) WSC "#" WSC
    // type: unknown
    //  EmptyDirective ->  WSC "#" WSC.NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  FuncDefine     ->  WSC "#" WSC.Identifier>>"define" WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Include        ->  WSC "#" WSC.Identifier>>"include" HeaderPart WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  IncludeNext    ->  WSC "#" WSC.Identifier>>"include_next" HeaderPart WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->  WSC "#" WSC.Identifier>>"line" WSC PpNumber WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->  WSC "#" WSC.Identifier>>"line" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->  WSC "#" WSC.PpNumber WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->  WSC "#" WSC.PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPElif         ->  WSC "#" WSC.Identifier>>"elif" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPElse         ->  WSC "#" WSC.Identifier>>"else" WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPEndif        ->  WSC "#" WSC.Identifier>>"endif" WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPError        ->  WSC "#" WSC.Identifier>>"error" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIf           ->  WSC "#" WSC.Identifier>>"if" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfDef        ->  WSC "#" WSC.Identifier>>"ifdef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfNDef       ->  WSC "#" WSC.Identifier>>"ifndef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPWarning      ->  WSC "#" WSC.Identifier>>"warning" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Pragma         ->  WSC "#" WSC.Identifier>>"pragma" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Undef          ->  WSC "#" WSC.Identifier>>"undef" WSC Identifier WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  VarDefine      ->  WSC "#" WSC.Identifier>>"define" WSC VarDefineName WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EOF            ->             . !anytoken {}
    //  NewLine        ->             .EOF {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  NewLine        ->             .NL {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse162(ref CreatorInstance.NonterminalUnion!([12008, 12010, 12018, 12019, 12020, 12022, 12023, 12024, 12025, 12026, 12027, 12028, 12029, 12031, 12039, 12040]) result, ref Location resultLocation, Location parseStart3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12007, 12008, 12010, 12018, 12019, 12020, 12021, 12022, 12023, 12024, 12025, 12026, 12027, 12028, 12029, 12031, 12039, 12040]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "define")
        {
            auto next = popToken();
            CreatorInstance.NonterminalUnion!([12010, 12040]) r;
            Location rl;
            gotoParent = parse40(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = r;
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "elif")
        {
            auto next = popToken();
            NonterminalType!(12022) r;
            Location rl;
            gotoParent = parse163(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12022/*PPElif*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "else")
        {
            auto next = popToken();
            NonterminalType!(12023) r;
            Location rl;
            gotoParent = parse167(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12023/*PPElse*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "endif")
        {
            auto next = popToken();
            NonterminalType!(12024) r;
            Location rl;
            gotoParent = parse95(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12024/*PPEndif*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "error")
        {
            auto next = popToken();
            NonterminalType!(12025) r;
            Location rl;
            gotoParent = parse98(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12025/*PPError*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "if")
        {
            auto next = popToken();
            NonterminalType!(12026) r;
            Location rl;
            gotoParent = parse102(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12026/*PPIf*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "ifdef")
        {
            auto next = popToken();
            NonterminalType!(12027) r;
            Location rl;
            gotoParent = parse106(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12027/*PPIfDef*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "ifndef")
        {
            auto next = popToken();
            NonterminalType!(12028) r;
            Location rl;
            gotoParent = parse110(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12028/*PPIfNDef*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "include")
        {
            auto next = popToken();
            NonterminalType!(12018) r;
            Location rl;
            gotoParent = parse114(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12018/*Include*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "include_next")
        {
            auto next = popToken();
            NonterminalType!(12019) r;
            Location rl;
            gotoParent = parse118(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12019/*IncludeNext*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "line")
        {
            auto next = popToken();
            NonterminalType!(12020) r;
            Location rl;
            gotoParent = parse122(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12020/*LineAnnotation*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "pragma")
        {
            auto next = popToken();
            NonterminalType!(12031) r;
            Location rl;
            gotoParent = parse131(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12031/*Pragma*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "undef")
        {
            auto next = popToken();
            NonterminalType!(12039) r;
            Location rl;
            gotoParent = parse135(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12039/*Undef*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "warning")
        {
            auto next = popToken();
            NonterminalType!(12029) r;
            Location rl;
            gotoParent = parse140(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12029/*PPWarning*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12021) r;
            Location rl;
            gotoParent = parse62(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12021/*NewLine*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"PpNumber")
        {
            auto next = popToken();
            NonterminalType!(12020) r;
            Location rl;
            gotoParent = parse144(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12020/*LineAnnotation*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else
        {
            lastError = new SingleParseException!Location(text("unexpected Token \"", lexer.front.content, "\"  \"", lexer.tokenName(lexer.front.symbol), "\""),
                lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12007/*EOF*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12007/*EOF*/)(currentResultLocation, currentResult.get!(12007/*EOF*/)());
                NonterminalType!(12021) r;
                Location rl;
                gotoParent = parse39(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12021/*NewLine*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12021/*NewLine*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12021/*NewLine*/)(currentResultLocation, currentResult.get!(12021/*NewLine*/)());
                NonterminalType!(12008) r;
                Location rl;
                gotoParent = parse151(r, rl, parseStart3, stack3, stack2, stack1/*, next*/);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12008/*EmptyDirective*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) WSC "#" WSC Identifier
    // type: unknown
    //  PPElif          ->  WSC "#" WSC Identifier>>"elif".WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->                                . !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC             ->                                .WSC2 !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC2            ->                                .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->                                .BlockComment {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                .EscapedNewline {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                .LineComment {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                .WS {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                .WSCElem {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                .repeat(WSCElem) WSCElem {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse163(ref NonterminalType!(12022) result, ref Location resultLocation, Location parseStart4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12022, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12022) r;
                Location rl;
                gotoParent = parse164(r, rl, parseStart4, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12022/*PPElif*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC
    // type: unknown
    //  PPElif              ->  WSC "#" WSC Identifier>>"elif" WSC.repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                    . {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                    .repeatOrNone(Token) Token {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse164(ref NonterminalType!(12022) result, ref Location resultLocation, Location parseStart5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12022, 12049]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce101/*repeatOrNone(Token) @array = @empty*/();
            currentResult = ParseResultIn.create(12049/*repeatOrNone(Token)*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12049/*repeatOrNone(Token)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/)(currentResultLocation, currentResult.get!(12049/*repeatOrNone(Token)*/)());
                CreatorInstance.NonterminalUnion!([12022, 12049]) r;
                Location rl;
                gotoParent = parse165(r, rl, parseStart5, stack5, stack4, stack3, stack2, stack1, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12022/*PPElif*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC repeatOrNone(Token)
    // type: unknown
    //  PPElif              ->  WSC "#" WSC Identifier>>"elif" WSC repeatOrNone(Token).NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeatOrNone(Token) ->                                     repeatOrNone(Token).Token {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                        ."(" {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                        .")" {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                        ."," {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                                                        .Operator {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EOF                 ->                                                        . !anytoken {}
    //  NewLine             ->                                                        .EOF {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  NewLine             ->                                                        .NL {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Token               ->                                                        .TokenX WSC {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                        .AllOperators {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                        ."#" {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                        .CharacterLiteral {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                        .Identifier {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                        .PpNumber {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                                                        .StringLiteral {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse165(ref CreatorInstance.NonterminalUnion!([12022, 12049]) result, ref Location resultLocation, Location parseStart6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, Location parseStart1, ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12000, 12007, 12021, 12022, 12034, 12037, 12049]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"#"})
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse82(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"("})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse83(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{")"})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse84(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{","})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse85(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"CharacterLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse86(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse87(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12021) r;
            Location rl;
            gotoParent = parse62(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12021/*NewLine*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Operator")
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse88(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"PpNumber")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse89(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"StringLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse90(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else
        {
            lastError = new SingleParseException!Location(text("unexpected Token \"", lexer.front.content, "\"  \"", lexer.tokenName(lexer.front.symbol), "\""),
                lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12000/*AllOperators*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12000/*AllOperators*/)(currentResultLocation, currentResult.get!(12000/*AllOperators*/)());
                NonterminalType!(12037) r;
                Location rl;
                gotoParent = parse36(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12037/*TokenX*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12007/*EOF*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12007/*EOF*/)(currentResultLocation, currentResult.get!(12007/*EOF*/)());
                NonterminalType!(12021) r;
                Location rl;
                gotoParent = parse39(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12021/*NewLine*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12021/*NewLine*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12021/*NewLine*/)(currentResultLocation, currentResult.get!(12021/*NewLine*/)());
                NonterminalType!(12022) r;
                Location rl;
                gotoParent = parse166(r, rl, parseStart6, stack6, stack5, stack4, stack3, stack2, stack1/*, next*/);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12022/*PPElif*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12034/*Token*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12034/*Token*/)(currentResultLocation, currentResult.get!(12034/*Token*/)());
                NonterminalType!(12049) r;
                Location rl;
                gotoParent = parse92(r, rl, parseStart1, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12049/*repeatOrNone(Token)*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12037/*TokenX*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12037/*TokenX*/)(currentResultLocation, currentResult.get!(12037/*TokenX*/)());
                NonterminalType!(12034) r;
                Location rl;
                gotoParent = parse93(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12034/*Token*/, r);
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC repeatOrNone(Token) NewLine
    // type: unknown
    //  PPElif ->  WSC "#" WSC Identifier>>"elif" WSC repeatOrNone(Token) NewLine. {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse166(ref NonterminalType!(12022) result, ref Location resultLocation, Location parseStart7, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack7, ParseStackElem!(Location, Token) stack6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/) stack2/+, ParseStackElem!(Location, NonterminalType!12021/*NewLine*/) stack1+/)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce52_PPElif/*PPElif = WSC "#" WSC Identifier>>"elif" WSC repeatOrNone(Token) ^NewLine*/(parseStart7, stack7, stack6, stack5, stack4, stack3, stack2, /*dropped*/);
            result = tmp.val;
            resultLocation = tmp.start;
            return 6;
        }
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) WSC "#" WSC Identifier
    // type: unknown
    //  PPElse          ->  WSC "#" WSC Identifier>>"else".WSC NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             ->                                . !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC             ->                                .WSC2 !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC2            ->                                .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->                                .BlockComment {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                .EscapedNewline {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                .LineComment {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                                .WS {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                .WSCElem {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                                .repeat(WSCElem) WSCElem {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse167(ref NonterminalType!(12023) result, ref Location resultLocation, Location parseStart4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12023, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12023) r;
                Location rl;
                gotoParent = parse168(r, rl, parseStart4, stack4, stack3, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12023/*PPElse*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC
    // type: unknown
    //  PPElse  ->  WSC "#" WSC Identifier>>"else" WSC.NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EOF     ->                                    . !anytoken {}
    //  NewLine ->                                    .EOF {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  NewLine ->                                    .NL {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse168(ref NonterminalType!(12023) result, ref Location resultLocation, Location parseStart5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack5, ParseStackElem!(Location, Token) stack4, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12007, 12021, 12023]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12021) r;
            Location rl;
            gotoParent = parse62(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12021/*NewLine*/, r);
            currentResultLocation = rl;
        }
        else
        {
            lastError = new SingleParseException!Location(text("unexpected Token \"", lexer.front.content, "\"  \"", lexer.tokenName(lexer.front.symbol), "\""),
                lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12007/*EOF*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12007/*EOF*/)(currentResultLocation, currentResult.get!(12007/*EOF*/)());
                NonterminalType!(12021) r;
                Location rl;
                gotoParent = parse39(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12021/*NewLine*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12021/*NewLine*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12021/*NewLine*/)(currentResultLocation, currentResult.get!(12021/*NewLine*/)());
                NonterminalType!(12023) r;
                Location rl;
                gotoParent = parse169(r, rl, parseStart5, stack5, stack4, stack3, stack2, stack1/*, next*/);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12023/*PPElse*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile ConditionalStart repeatOrNone(GroupPart) PPElif repeatOrNone(GroupPart) WSC "#" WSC Identifier WSC NewLine
    // type: unknown
    //  PPElse ->  WSC "#" WSC Identifier>>"else" WSC NewLine. {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse169(ref NonterminalType!(12023) result, ref Location resultLocation, Location parseStart6, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack6, ParseStackElem!(Location, Token) stack5, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack4, ParseStackElem!(Location, Token) stack3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2/+, ParseStackElem!(Location, NonterminalType!12021/*NewLine*/) stack1+/)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce53_PPElse/*PPElse = WSC "#" WSC Identifier>>"else" WSC ^NewLine*/(parseStart6, stack6, stack5, stack4, stack3, stack2, /*dropped*/);
            result = tmp.val;
            resultLocation = tmp.start;
            return 5;
        }
    }
    // path: PreprocessingFile Group
    // type: unknown
    //  Group            ->  Group.GroupPart {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Group?           ->  Group. {$end}
    //  Conditional      ->       .ConditionalStart repeatOrNone(GroupPart) ConditionalNext {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalStart ->       .PPIf {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalStart ->       .PPIfDef {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ConditionalStart ->       .PPIfNDef {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine      ->       .EmptyDirective {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine      ->       .FuncDefine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine      ->       .Include {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine      ->       .IncludeNext {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine      ->       .LineAnnotation {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine      ->       .PPError {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine      ->       .PPWarning {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine      ->       .Pragma {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine      ->       .Undef {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  ControlLine      ->       .VarDefine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EmptyDirective   ->       .WSC "#" WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EmptyLine        ->       .WSC2 NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EmptyLine        ->       .NL {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  FuncDefine       ->       .WSC "#" WSC Identifier>>"define" WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  GroupPart        ->       .Conditional {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  GroupPart        ->       .ControlLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  GroupPart        ->       .EmptyLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  GroupPart        ->       .TextLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Include          ->       .WSC "#" WSC Identifier>>"include" HeaderPart WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  IncludeNext      ->       .WSC "#" WSC Identifier>>"include_next" HeaderPart WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation   ->       .WSC "#" WSC Identifier>>"line" WSC PpNumber WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation   ->       .WSC "#" WSC Identifier>>"line" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation   ->       .WSC "#" WSC PpNumber WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation   ->       .WSC "#" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPError          ->       .WSC "#" WSC Identifier>>"error" WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIf             ->       .WSC "#" WSC Identifier>>"if" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfDef          ->       .WSC "#" WSC Identifier>>"ifdef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfNDef         ->       .WSC "#" WSC Identifier>>"ifndef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPWarning        ->       .WSC "#" WSC Identifier>>"warning" WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Pragma           ->       .WSC "#" WSC Identifier>>"pragma" WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TextLine         ->       .WSC !"#" repeat(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Undef            ->       .WSC "#" WSC Identifier>>"undef" WSC Identifier WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  VarDefine        ->       .WSC "#" WSC Identifier>>"define" WSC VarDefineName WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC              ->       . !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    //  WSC              ->       .WSC2 !WS !BlockComment !LineComment !EscapedNewline {"#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    //  WSC2             ->       .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem          ->       .BlockComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem          ->       .EscapedNewline {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem          ->       .LineComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem          ->       .WS {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem)  ->       .WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem)  ->       .repeat(WSCElem) WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse170(ref CreatorInstance.NonterminalUnion!([12013, 12014]) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12013/*Group*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12001, 12005, 12006, 12008, 12009, 12010, 12013, 12014, 12015, 12018, 12019, 12020, 12025, 12026, 12027, 12028, 12029, 12031, 12033, 12039, 12040, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce34/*Group? = <Group [virtual]*/(parseStart1, stack1);
            result = ThisParseResult.create(12014/*Group?*/, tmp.val);
            resultLocation = tmp.start;
            return 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"#"} || lexer.front.symbol == Lexer.tokenID!q{"("} || lexer.front.symbol == Lexer.tokenID!q{")"} || lexer.front.symbol == Lexer.tokenID!q{","} || lexer.front.symbol == Lexer.tokenID!"CharacterLiteral" || lexer.front.symbol == Lexer.tokenID!"Identifier" || lexer.front.symbol == Lexer.tokenID!"Operator" || lexer.front.symbol == Lexer.tokenID!"PpNumber" || lexer.front.symbol == Lexer.tokenID!"StringLiteral")
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12009) r;
            Location rl;
            gotoParent = parse14(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12009/*EmptyLine*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce34/*Group? = <Group [virtual]*/(parseStart1, stack1);
            result = ThisParseResult.create(12014/*Group?*/, tmp.val);
            resultLocation = tmp.start;
            return 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12001/*Conditional*/)
            {
                currentResult = ParseResultIn.create(12015/*GroupPart*/, currentResult.get!(12001/*Conditional*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12005/*ConditionalStart*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12005/*ConditionalStart*/)(currentResultLocation, currentResult.get!(12005/*ConditionalStart*/)());
                NonterminalType!(12001) r;
                Location rl;
                gotoParent = parse2(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12001/*Conditional*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12006/*ControlLine*/)
            {
                currentResult = ParseResultIn.create(12015/*GroupPart*/, currentResult.get!(12006/*ControlLine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12008/*EmptyDirective*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12008/*EmptyDirective*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12009/*EmptyLine*/)
            {
                currentResult = ParseResultIn.create(12015/*GroupPart*/, currentResult.get!(12009/*EmptyLine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12010/*FuncDefine*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12010/*FuncDefine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12015/*GroupPart*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12015/*GroupPart*/)(currentResultLocation, currentResult.get!(12015/*GroupPart*/)());
                NonterminalType!(12013) r;
                Location rl;
                gotoParent = parse171(r, rl, parseStart1, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12013/*Group*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12018/*Include*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12018/*Include*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12019/*IncludeNext*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12019/*IncludeNext*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12020/*LineAnnotation*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12020/*LineAnnotation*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12025/*PPError*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12025/*PPError*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12026/*PPIf*/)
            {
                currentResult = ParseResultIn.create(12005/*ConditionalStart*/, currentResult.get!(12026/*PPIf*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12027/*PPIfDef*/)
            {
                currentResult = ParseResultIn.create(12005/*ConditionalStart*/, currentResult.get!(12027/*PPIfDef*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12028/*PPIfNDef*/)
            {
                currentResult = ParseResultIn.create(12005/*ConditionalStart*/, currentResult.get!(12028/*PPIfNDef*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12029/*PPWarning*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12029/*PPWarning*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12031/*Pragma*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12031/*Pragma*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12033/*TextLine*/)
            {
                currentResult = ParseResultIn.create(12015/*GroupPart*/, currentResult.get!(12033/*TextLine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12039/*Undef*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12039/*Undef*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12040/*VarDefine*/)
            {
                currentResult = ParseResultIn.create(12006/*ControlLine*/, currentResult.get!(12040/*VarDefine*/));
                currentResultLocation = currentResultLocation;
            }
            else if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                CreatorInstance.NonterminalUnion!([12008, 12010, 12018, 12019, 12020, 12025, 12026, 12027, 12028, 12029, 12031, 12033, 12039, 12040]) r;
                Location rl;
                gotoParent = parse172(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                CreatorInstance.NonterminalUnion!([12009, 12042]) r;
                Location rl;
                gotoParent = parse157(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile Group GroupPart
    // type: unknown
    //  Group ->  Group GroupPart. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse171(ref NonterminalType!(12013) result, ref Location resultLocation, Location parseStart2, ParseStackElem!(Location, NonterminalType!12013/*Group*/) stack2, ParseStackElem!(Location, NonterminalType!12015/*GroupPart*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce33_Group/*Group @array = Group GroupPart*/(parseStart2, stack2, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 1;
        }
    }
    // path: PreprocessingFile Group WSC
    // type: unknown
    //  EmptyDirective ->           WSC."#" WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  FuncDefine     ->           WSC."#" WSC Identifier>>"define" WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Include        ->           WSC."#" WSC Identifier>>"include" HeaderPart WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  IncludeNext    ->           WSC."#" WSC Identifier>>"include_next" HeaderPart WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->           WSC."#" WSC Identifier>>"line" WSC PpNumber WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->           WSC."#" WSC Identifier>>"line" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->           WSC."#" WSC PpNumber WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->           WSC."#" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPError        ->           WSC."#" WSC Identifier>>"error" WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIf           ->           WSC."#" WSC Identifier>>"if" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfDef        ->           WSC."#" WSC Identifier>>"ifdef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfNDef       ->           WSC."#" WSC Identifier>>"ifndef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPWarning      ->           WSC."#" WSC Identifier>>"warning" WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Pragma         ->           WSC."#" WSC Identifier>>"pragma" WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TextLine       ->           WSC.!"#" repeat(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Undef          ->           WSC."#" WSC Identifier>>"undef" WSC Identifier WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  VarDefine      ->           WSC."#" WSC Identifier>>"define" WSC VarDefineName WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators   ->              .!"#" "(" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators   ->              .!"#" ")" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators   ->              .!"#" "," {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators   ->              .!"#" Operator {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Token          ->              .!"#" TokenX WSC {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX         ->              .!"#" AllOperators {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX         -> @@disabled@@ ."#" {}
    //  TokenX         ->              .!"#" CharacterLiteral {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX         ->              .!"#" Identifier {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX         ->              .!"#" PpNumber {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX         ->              .!"#" StringLiteral {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(Token)  ->              .!"#" Token {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(Token)  ->              .!"#" repeat(Token) Token {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse172(ref CreatorInstance.NonterminalUnion!([12008, 12010, 12018, 12019, 12020, 12025, 12026, 12027, 12028, 12029, 12031, 12033, 12039, 12040]) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        bool disallowToken1/+"#"+/;
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12000, 12008, 12010, 12018, 12019, 12020, 12025, 12026, 12027, 12028, 12029, 12031, 12033, 12034, 12037, 12039, 12040, 12046]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"#"})
        {
            disallowToken1/+"#"+/ = true;
            auto next = popToken();
            CreatorInstance.NonterminalUnion!([12008, 12010, 12018, 12019, 12020, 12025, 12026, 12027, 12028, 12029, 12031, 12037, 12039, 12040]) r;
            Location rl;
            gotoParent = parse173(r, rl, parseStart1, stack1, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = r;
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"("})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse83(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{")"})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse84(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{","})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse85(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"CharacterLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse86(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse87(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Operator")
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse88(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"PpNumber")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse89(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"StringLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse90(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else
        {
            lastError = new SingleParseException!Location(text("unexpected Token \"", lexer.front.content, "\"  \"", lexer.tokenName(lexer.front.symbol), "\""),
                lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12000/*AllOperators*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12000/*AllOperators*/)(currentResultLocation, currentResult.get!(12000/*AllOperators*/)());
                NonterminalType!(12037) r;
                Location rl;
                gotoParent = parse36(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12037/*TokenX*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12034/*Token*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12034/*Token*/)(currentResultLocation, currentResult.get!(12034/*Token*/)());
                NonterminalType!(12046) r;
                Location rl;
                gotoParent = parse152(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12046/*repeat(Token)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12037/*TokenX*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12037/*TokenX*/)(currentResultLocation, currentResult.get!(12037/*TokenX*/)());
                NonterminalType!(12034) r;
                Location rl;
                gotoParent = parse93(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12034/*Token*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12046/*repeat(Token)*/)
            {
                if (disallowToken1/+"#"+/ == false)
                {
                    auto next = ParseStackElem!(Location, NonterminalType!12046/*repeat(Token)*/)(currentResultLocation, currentResult.get!(12046/*repeat(Token)*/)());
                    CreatorInstance.NonterminalUnion!([12033, 12046]) r;
                    Location rl;
                    gotoParent = parse153(r, rl, parseStart1, stack1, currentStart, next);
                    if (gotoParent < 0)
                        return gotoParent;
                    currentResult = r;
                    currentResultLocation = rl;
                }
                else if (disallowToken1/+"#"+/ == true)
                {
                    auto next = ParseStackElem!(Location, NonterminalType!12046/*repeat(Token)*/)(currentResultLocation, currentResult.get!(12046/*repeat(Token)*/)());
                    NonterminalType!(12046) r;
                    Location rl;
                    gotoParent = parse156(r, rl, currentStart, next);
                    if (gotoParent < 0)
                        return gotoParent;
                    currentResult = ParseResultIn.create(12046/*repeat(Token)*/, r);
                    currentResultLocation = rl;
                }
                else
                    assert(false);
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile Group WSC "#"
    // type: unknown
    //  EmptyDirective  ->           WSC "#".WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  FuncDefine      ->           WSC "#".WSC Identifier>>"define" WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Include         ->           WSC "#".WSC Identifier>>"include" HeaderPart WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  IncludeNext     ->           WSC "#".WSC Identifier>>"include_next" HeaderPart WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation  ->           WSC "#".WSC Identifier>>"line" WSC PpNumber WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation  ->           WSC "#".WSC Identifier>>"line" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation  ->           WSC "#".WSC PpNumber WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation  ->           WSC "#".WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPError         ->           WSC "#".WSC Identifier>>"error" WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIf            ->           WSC "#".WSC Identifier>>"if" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfDef         ->           WSC "#".WSC Identifier>>"ifdef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfNDef        ->           WSC "#".WSC Identifier>>"ifndef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPWarning       ->           WSC "#".WSC Identifier>>"warning" WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Pragma          ->           WSC "#".WSC Identifier>>"pragma" WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Undef           ->           WSC "#".WSC Identifier>>"undef" WSC Identifier WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  VarDefine       ->           WSC "#".WSC Identifier>>"define" WSC VarDefineName WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  TokenX          -> @@disabled@@  "#". {}
    //  WSC             ->                  . !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC             ->                  .WSC2 !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSC2            ->                  .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, NL, Operator, PpNumber, StringLiteral}
    //  WSCElem         ->                  .BlockComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                  .EscapedNewline {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                  .LineComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         ->                  .WS {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                  .WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) ->                  .repeat(WSCElem) WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse173(ref CreatorInstance.NonterminalUnion!([12008, 12010, 12018, 12019, 12020, 12025, 12026, 12027, 12028, 12029, 12031, 12037, 12039, 12040]) result, ref Location resultLocation, Location parseStart2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12008, 12010, 12018, 12019, 12020, 12025, 12026, 12027, 12028, 12029, 12031, 12037, 12039, 12040, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                CreatorInstance.NonterminalUnion!([12008, 12010, 12018, 12019, 12020, 12025, 12026, 12027, 12028, 12029, 12031, 12039, 12040]) r;
                Location rl;
                gotoParent = parse174(r, rl, parseStart2, stack2, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile Group WSC "#" WSC
    // type: unknown
    //  EmptyDirective ->  WSC "#" WSC.NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  FuncDefine     ->  WSC "#" WSC.Identifier>>"define" WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Include        ->  WSC "#" WSC.Identifier>>"include" HeaderPart WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  IncludeNext    ->  WSC "#" WSC.Identifier>>"include_next" HeaderPart WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->  WSC "#" WSC.Identifier>>"line" WSC PpNumber WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->  WSC "#" WSC.Identifier>>"line" WSC PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->  WSC "#" WSC.PpNumber WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  LineAnnotation ->  WSC "#" WSC.PpNumber WSC StringLiteral WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPError        ->  WSC "#" WSC.Identifier>>"error" WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIf           ->  WSC "#" WSC.Identifier>>"if" WSC repeatOrNone(Token) NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfDef        ->  WSC "#" WSC.Identifier>>"ifdef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPIfNDef       ->  WSC "#" WSC.Identifier>>"ifndef" WSC Token NewLine {"#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  PPWarning      ->  WSC "#" WSC.Identifier>>"warning" WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Pragma         ->  WSC "#" WSC.Identifier>>"pragma" WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  Undef          ->  WSC "#" WSC.Identifier>>"undef" WSC Identifier WSC NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  VarDefine      ->  WSC "#" WSC.Identifier>>"define" WSC VarDefineName WSC repeatOrNone(Token) NewLine {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  EOF            ->             . !anytoken {$end}
    //  NewLine        ->             .EOF {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  NewLine        ->             .NL {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse174(ref CreatorInstance.NonterminalUnion!([12008, 12010, 12018, 12019, 12020, 12025, 12026, 12027, 12028, 12029, 12031, 12039, 12040]) result, ref Location resultLocation, Location parseStart3, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack3, ParseStackElem!(Location, Token) stack2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12007, 12008, 12010, 12018, 12019, 12020, 12021, 12025, 12026, 12027, 12028, 12029, 12031, 12039, 12040]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "define")
        {
            auto next = popToken();
            CreatorInstance.NonterminalUnion!([12010, 12040]) r;
            Location rl;
            gotoParent = parse40(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = r;
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "error")
        {
            auto next = popToken();
            NonterminalType!(12025) r;
            Location rl;
            gotoParent = parse98(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12025/*PPError*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "if")
        {
            auto next = popToken();
            NonterminalType!(12026) r;
            Location rl;
            gotoParent = parse102(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12026/*PPIf*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "ifdef")
        {
            auto next = popToken();
            NonterminalType!(12027) r;
            Location rl;
            gotoParent = parse106(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12027/*PPIfDef*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "ifndef")
        {
            auto next = popToken();
            NonterminalType!(12028) r;
            Location rl;
            gotoParent = parse110(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12028/*PPIfNDef*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "include")
        {
            auto next = popToken();
            NonterminalType!(12018) r;
            Location rl;
            gotoParent = parse114(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12018/*Include*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "include_next")
        {
            auto next = popToken();
            NonterminalType!(12019) r;
            Location rl;
            gotoParent = parse118(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12019/*IncludeNext*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "line")
        {
            auto next = popToken();
            NonterminalType!(12020) r;
            Location rl;
            gotoParent = parse122(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12020/*LineAnnotation*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "pragma")
        {
            auto next = popToken();
            NonterminalType!(12031) r;
            Location rl;
            gotoParent = parse131(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12031/*Pragma*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "undef")
        {
            auto next = popToken();
            NonterminalType!(12039) r;
            Location rl;
            gotoParent = parse135(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12039/*Undef*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier" && lexer.front.content == "warning")
        {
            auto next = popToken();
            NonterminalType!(12029) r;
            Location rl;
            gotoParent = parse140(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12029/*PPWarning*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"NL")
        {
            auto next = popToken();
            NonterminalType!(12021) r;
            Location rl;
            gotoParent = parse62(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12021/*NewLine*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"PpNumber")
        {
            auto next = popToken();
            NonterminalType!(12020) r;
            Location rl;
            gotoParent = parse144(r, rl, parseStart3, stack3, stack2, stack1, next);
            if (gotoParent < 0)
                return gotoParent;
            assert(gotoParent > 0);
            result = ThisParseResult.create(12020/*LineAnnotation*/, r);
            resultLocation = rl;
            return gotoParent - 1;
        }
        else
        {
            auto tmp = reduce23_EOF/*EOF @string = !anytoken @empty*/();
            currentResult = ParseResultIn.create(12007/*EOF*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12007/*EOF*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12007/*EOF*/)(currentResultLocation, currentResult.get!(12007/*EOF*/)());
                NonterminalType!(12021) r;
                Location rl;
                gotoParent = parse39(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12021/*NewLine*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12021/*NewLine*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12021/*NewLine*/)(currentResultLocation, currentResult.get!(12021/*NewLine*/)());
                NonterminalType!(12008) r;
                Location rl;
                gotoParent = parse151(r, rl, parseStart3, stack3, stack2, stack1/*, next*/);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12008/*EmptyDirective*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: PreprocessingFile Group?
    // type: unknown
    //  PreprocessingFile ->  Group?. {$end}
    private int parse175(ref NonterminalType!(12032) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12014/*Group?*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce62_PreprocessingFile/*PreprocessingFile = Group?*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile GroupPart
    // type: unknown
    //  Group ->  GroupPart. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse176(ref NonterminalType!(12013) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12015/*GroupPart*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce32_Group/*Group @array = GroupPart*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: PreprocessingFile PreprocessingFile
    // type: unknown
    //  PreprocessingFile ->  PreprocessingFile. {$end} startElement
    private int parse177(ref NonterminalType!(12032) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12032/*PreprocessingFile*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            result = stack1.val;
            resultLocation = stack1.start;
            return 1;
        }
    }
    // path: TokenList
    // type: unknown
    //  TokenList       -> .TokenList {$end} startElement
    //  TokenList       -> .WSC repeatOrNone(Token) {$end}
    //  WSC             -> . !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    //  WSC             -> .WSC2 !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    //  WSC2            -> .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    //  WSCElem         -> .BlockComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         -> .EscapedNewline {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         -> .LineComment {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  WSCElem         -> .WS {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) -> .WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  repeat(WSCElem) -> .repeat(WSCElem) WSCElem {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    int parseTokenList/*178*/(ref NonterminalType!(12036) result, ref Location resultLocation)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12036, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12036/*TokenList*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12036/*TokenList*/)(currentResultLocation, currentResult.get!(12036/*TokenList*/)());
                NonterminalType!(12036) r;
                Location rl;
                gotoParent = parse179(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                auto tree = r;
                result = tree;
                resultLocation = rl;
                return 0;
            }
            else if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12036) r;
                Location rl;
                gotoParent = parse180(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12036/*TokenList*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        auto tree = currentResult.get!(12036);
        result = tree;
        resultLocation = currentResultLocation;
        return 0;
    }
    // path: TokenList TokenList
    // type: unknown
    //  TokenList ->  TokenList. {$end} startElement
    private int parse179(ref NonterminalType!(12036) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12036/*TokenList*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            result = stack1.val;
            resultLocation = stack1.start;
            return 1;
        }
    }
    // path: TokenList WSC
    // type: unknown
    //  TokenList           ->  WSC.repeatOrNone(Token) {$end}
    //  repeatOrNone(Token) ->     . {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    //  repeatOrNone(Token) ->     .repeatOrNone(Token) Token {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    private int parse180(ref NonterminalType!(12036) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12036, 12049]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce101/*repeatOrNone(Token) @array = @empty*/();
            currentResult = ParseResultIn.create(12049/*repeatOrNone(Token)*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12049/*repeatOrNone(Token)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/)(currentResultLocation, currentResult.get!(12049/*repeatOrNone(Token)*/)());
                CreatorInstance.NonterminalUnion!([12036, 12049]) r;
                Location rl;
                gotoParent = parse181(r, rl, parseStart1, stack1, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12036/*TokenList*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: TokenList WSC repeatOrNone(Token)
    // type: unknown
    //  TokenList           ->  WSC repeatOrNone(Token). {$end}
    //  repeatOrNone(Token) ->      repeatOrNone(Token).Token {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    //  AllOperators        ->                         ."(" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                         .")" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                         ."," {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  AllOperators        ->                         .Operator {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  Token               ->                         .TokenX WSC {$end, "#", "(", ")", ",", CharacterLiteral, Identifier, Operator, PpNumber, StringLiteral}
    //  TokenX              ->                         .AllOperators {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                         ."#" {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                         .CharacterLiteral {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                         .Identifier {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                         .PpNumber {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    //  TokenX              ->                         .StringLiteral {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, Operator, PpNumber, StringLiteral, WS}
    private int parse181(ref CreatorInstance.NonterminalUnion!([12036, 12049]) result, ref Location resultLocation, Location parseStart2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, Location parseStart1, ParseStackElem!(Location, NonterminalType!12049/*repeatOrNone(Token)*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12000, 12034, 12036, 12037, 12049]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            auto tmp = reduce67_TokenList/*TokenList @start = WSC repeatOrNone(Token)*/(parseStart2, stack2, stack1);
            result = ThisParseResult.create(12036/*TokenList*/, tmp.val);
            resultLocation = tmp.start;
            return 1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"#"})
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse82(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{"("})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse83(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{")"})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse84(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!q{","})
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse85(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"CharacterLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse86(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse87(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Operator")
        {
            auto next = popToken();
            NonterminalType!(12000) r;
            Location rl;
            gotoParent = parse88(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12000/*AllOperators*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"PpNumber")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse89(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"StringLiteral")
        {
            auto next = popToken();
            NonterminalType!(12037) r;
            Location rl;
            gotoParent = parse90(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12037/*TokenX*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce67_TokenList/*TokenList @start = WSC repeatOrNone(Token)*/(parseStart2, stack2, stack1);
            result = ThisParseResult.create(12036/*TokenList*/, tmp.val);
            resultLocation = tmp.start;
            return 1;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12000/*AllOperators*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12000/*AllOperators*/)(currentResultLocation, currentResult.get!(12000/*AllOperators*/)());
                NonterminalType!(12037) r;
                Location rl;
                gotoParent = parse36(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12037/*TokenX*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12034/*Token*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12034/*Token*/)(currentResultLocation, currentResult.get!(12034/*Token*/)());
                NonterminalType!(12049) r;
                Location rl;
                gotoParent = parse92(r, rl, parseStart1, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = ThisParseResult.create(12049/*repeatOrNone(Token)*/, r);
                resultLocation = rl;
                return gotoParent - 1;
            }
            else if (currentResult.nonterminalID == 12037/*TokenX*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12037/*TokenX*/)(currentResultLocation, currentResult.get!(12037/*TokenX*/)());
                NonterminalType!(12034) r;
                Location rl;
                gotoParent = parse93(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12034/*Token*/, r);
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult;
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: HeaderPart
    // type: unknown
    //  HeaderPart      -> .HeaderPart {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS} startElement
    //  HeaderPart      -> .WSC HeaderName {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  WSC             -> . !WS !BlockComment !LineComment !EscapedNewline {HeaderNameSys, Identifier, StringLiteral}
    //  WSC             -> .WSC2 !WS !BlockComment !LineComment !EscapedNewline {HeaderNameSys, Identifier, StringLiteral}
    //  WSC2            -> .repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline {HeaderNameSys, Identifier, StringLiteral}
    //  WSCElem         -> .BlockComment {BlockComment, EscapedNewline, HeaderNameSys, Identifier, LineComment, StringLiteral, WS}
    //  WSCElem         -> .EscapedNewline {BlockComment, EscapedNewline, HeaderNameSys, Identifier, LineComment, StringLiteral, WS}
    //  WSCElem         -> .LineComment {BlockComment, EscapedNewline, HeaderNameSys, Identifier, LineComment, StringLiteral, WS}
    //  WSCElem         -> .WS {BlockComment, EscapedNewline, HeaderNameSys, Identifier, LineComment, StringLiteral, WS}
    //  repeat(WSCElem) -> .WSCElem {BlockComment, EscapedNewline, HeaderNameSys, Identifier, LineComment, StringLiteral, WS}
    //  repeat(WSCElem) -> .repeat(WSCElem) WSCElem {BlockComment, EscapedNewline, HeaderNameSys, Identifier, LineComment, StringLiteral, WS}
    int parseHeaderPart/*182*/(ref NonterminalType!(12017) result, ref Location resultLocation)
    {
        alias ThisParseResult = typeof(result);
        const bool allowToken0Orig = lexer.allowToken!"HeaderNameSys";
        lexer.allowToken!"HeaderNameSys" = true;
        scope(exit)
            lexer.allowToken!"HeaderNameSys" = allowToken0Orig;
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12017, 12042, 12043, 12044, 12047]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"BlockComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse7(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"EscapedNewline")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse9(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"LineComment")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse13(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"WS")
        {
            auto next = popToken();
            NonterminalType!(12044) r;
            Location rl;
            gotoParent = parse16(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12044/*WSCElem*/, r);
            currentResultLocation = rl;
        }
        else
        {
            auto tmp = reduce86_WSC/*WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty*/();
            currentResult = ParseResultIn.create(12042/*WSC*/, tmp.val);
            currentResultLocation = tmp.start;
            gotoParent = 0;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12017/*HeaderPart*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12017/*HeaderPart*/)(currentResultLocation, currentResult.get!(12017/*HeaderPart*/)());
                NonterminalType!(12017) r;
                Location rl;
                gotoParent = parse183(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                auto tree = r;
                result = tree;
                resultLocation = rl;
                return 0;
            }
            else if (currentResult.nonterminalID == 12042/*WSC*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12042/*WSC*/)(currentResultLocation, currentResult.get!(12042/*WSC*/)());
                NonterminalType!(12017) r;
                Location rl;
                gotoParent = parse184(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12017/*HeaderPart*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12043/*WSC2*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12043/*WSC2*/)(currentResultLocation, currentResult.get!(12043/*WSC2*/)());
                NonterminalType!(12042) r;
                Location rl;
                gotoParent = parse53(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12042/*WSC*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12044/*WSCElem*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12044/*WSCElem*/)(currentResultLocation, currentResult.get!(12044/*WSCElem*/)());
                NonterminalType!(12047) r;
                Location rl;
                gotoParent = parse54(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = ParseResultIn.create(12047/*repeat(WSCElem)*/, r);
                currentResultLocation = rl;
            }
            else if (currentResult.nonterminalID == 12047/*repeat(WSCElem)*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12047/*repeat(WSCElem)*/)(currentResultLocation, currentResult.get!(12047/*repeat(WSCElem)*/)());
                CreatorInstance.NonterminalUnion!([12043, 12047]) r;
                Location rl;
                gotoParent = parse55(r, rl, currentStart, next);
                if (gotoParent < 0)
                    return gotoParent;
                currentResult = r;
                currentResultLocation = rl;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        auto tree = currentResult.get!(12017);
        result = tree;
        resultLocation = currentResultLocation;
        return 0;
    }
    // path: HeaderPart HeaderPart
    // type: unknown
    //  HeaderPart ->  HeaderPart. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS} startElement
    private int parse183(ref NonterminalType!(12017) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12017/*HeaderPart*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        const bool allowToken0Orig = lexer.allowToken!"HeaderNameSys";
        lexer.allowToken!"HeaderNameSys" = true;
        scope(exit)
            lexer.allowToken!"HeaderNameSys" = allowToken0Orig;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty || lexer.front.symbol == Lexer.tokenID!q{"#"} || lexer.front.symbol == Lexer.tokenID!q{"("} || lexer.front.symbol == Lexer.tokenID!q{")"} || lexer.front.symbol == Lexer.tokenID!q{","} || lexer.front.symbol == Lexer.tokenID!"BlockComment" || lexer.front.symbol == Lexer.tokenID!"CharacterLiteral" || lexer.front.symbol == Lexer.tokenID!"EscapedNewline" || lexer.front.symbol == Lexer.tokenID!"Identifier" || lexer.front.symbol == Lexer.tokenID!"LineComment" || lexer.front.symbol == Lexer.tokenID!"NL" || lexer.front.symbol == Lexer.tokenID!"Operator" || lexer.front.symbol == Lexer.tokenID!"PpNumber" || lexer.front.symbol == Lexer.tokenID!"StringLiteral" || lexer.front.symbol == Lexer.tokenID!"WS")
        {
            result = stack1.val;
            resultLocation = stack1.start;
            return 1;
        }
        else
        {
            result = stack1.val;
            resultLocation = stack1.start;
            return 1;
        }
    }
    // path: HeaderPart WSC
    // type: unknown
    //  HeaderPart ->  WSC.HeaderName {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  HeaderName ->     .HeaderNameSys {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  HeaderName ->     .Identifier {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    //  HeaderName ->     .StringLiteral {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse184(ref NonterminalType!(12017) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        alias ParseResultIn = CreatorInstance.NonterminalUnion!([12016, 12017]);
        ParseResultIn currentResult;
        Location currentResultLocation;
        int gotoParent = -1;
        Location currentStart = lexer.front.currentLocation;
        if (lexer.empty)
        {
            lastError = new SingleParseException!Location("EOF", lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"HeaderNameSys")
        {
            auto next = popToken();
            NonterminalType!(12016) r;
            Location rl;
            gotoParent = parse185(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12016/*HeaderName*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"Identifier")
        {
            auto next = popToken();
            NonterminalType!(12016) r;
            Location rl;
            gotoParent = parse186(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12016/*HeaderName*/, r);
            currentResultLocation = rl;
        }
        else if (lexer.front.symbol == Lexer.tokenID!"StringLiteral")
        {
            auto next = popToken();
            NonterminalType!(12016) r;
            Location rl;
            gotoParent = parse187(r, rl, currentStart, next);
            if (gotoParent < 0)
                return gotoParent;
            currentResult = ParseResultIn.create(12016/*HeaderName*/, r);
            currentResultLocation = rl;
        }
        else
        {
            lastError = new SingleParseException!Location(text("unexpected Token \"", lexer.front.content, "\"  \"", lexer.tokenName(lexer.front.symbol), "\""),
                lexer.front.currentLocation, lexer.front.currentTokenEnd);
            return -1;
        }

        while (gotoParent == 0)
        {
            if (currentResult.nonterminalID == 12016/*HeaderName*/)
            {
                auto next = ParseStackElem!(Location, NonterminalType!12016/*HeaderName*/)(currentResultLocation, currentResult.get!(12016/*HeaderName*/)());
                NonterminalType!(12017) r;
                Location rl;
                gotoParent = parse188(r, rl, parseStart1, stack1, next);
                if (gotoParent < 0)
                    return gotoParent;
                assert(gotoParent > 0);
                result = r;
                resultLocation = rl;
                return gotoParent - 1;
            }
            else
                assert(0, text("no jump ", currentResult.nonterminalID, " ", allNonterminals[currentResult.nonterminalID].name));
        }

        result = currentResult.get!(12017/*HeaderPart*/);
        resultLocation = currentResultLocation;
        return gotoParent - 1;
    }
    // path: HeaderPart WSC HeaderNameSys
    // type: unknown
    //  HeaderName ->  HeaderNameSys. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse185(ref NonterminalType!(12016) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce40_HeaderName/*HeaderName = HeaderNameSys*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: HeaderPart WSC Identifier
    // type: unknown
    //  HeaderName ->  Identifier. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse186(ref NonterminalType!(12016) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce42_HeaderName/*HeaderName = Identifier*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: HeaderPart WSC StringLiteral
    // type: unknown
    //  HeaderName ->  StringLiteral. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse187(ref NonterminalType!(12016) result, ref Location resultLocation, Location parseStart1, ParseStackElem!(Location, Token) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce41_HeaderName/*HeaderName = StringLiteral*/(parseStart1, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 0;
        }
    }
    // path: HeaderPart WSC HeaderName
    // type: unknown
    //  HeaderPart ->  WSC HeaderName. {$end, "#", "(", ")", ",", BlockComment, CharacterLiteral, EscapedNewline, Identifier, LineComment, NL, Operator, PpNumber, StringLiteral, WS}
    private int parse188(ref NonterminalType!(12017) result, ref Location resultLocation, Location parseStart2, ParseStackElem!(Location, NonterminalType!12042/*WSC*/) stack2, ParseStackElem!(Location, NonterminalType!12016/*HeaderName*/) stack1)
    {
        alias ThisParseResult = typeof(result);
        Location currentStart = lexer.front.currentLocation;
        {
            auto tmp = reduce43_HeaderPart/*HeaderPart @enableToken(HeaderNameSys) = WSC HeaderName*/(parseStart2, stack2, stack1);
            result = tmp.val;
            resultLocation = tmp.start;
            return 1;
        }
    }
}

immutable allTokens = [
    /* 11000: */ immutable(Token)("$end", []),
    /* 11001: */ immutable(Token)(q{"#"}, []),
    /* 11002: */ immutable(Token)(q{"("}, []),
    /* 11003: */ immutable(Token)(q{")"}, []),
    /* 11004: */ immutable(Token)(q{","}, []),
    /* 11005: */ immutable(Token)("BlockComment", ["minimalMatch"]),
    /* 11006: */ immutable(Token)("CharacterLiteral", []),
    /* 11007: */ immutable(Token)("EscapedNewline", []),
    /* 11008: */ immutable(Token)("HeaderNameSys", ["inContextOnly"]),
    /* 11009: */ immutable(Token)("Identifier", ["lowPrio"]),
    /* 11010: */ immutable(Token)("LineComment", []),
    /* 11011: */ immutable(Token)("NL", []),
    /* 11012: */ immutable(Token)("Operator", []),
    /* 11013: */ immutable(Token)("PpNumber", []),
    /* 11014: */ immutable(Token)("StringLiteral", ["minimalMatch"]),
    /* 11015: */ immutable(Token)("WS", []),
];

immutable allNonterminals = [
    /* 12000: */ immutable(Nonterminal)("AllOperators", NonterminalFlags.string, ["string"], [], 13000, 4),
    /* 12001: */ immutable(Nonterminal)("Conditional", NonterminalFlags.nonterminal, [], [12001], 13004, 1),
    /* 12002: */ immutable(Nonterminal)("ConditionalElif", NonterminalFlags.nonterminal, [], [12002], 13005, 1),
    /* 12003: */ immutable(Nonterminal)("ConditionalElse", NonterminalFlags.nonterminal, [], [12003], 13006, 1),
    /* 12004: */ immutable(Nonterminal)("ConditionalNext", NonterminalFlags.nonterminal, [], [12002, 12003, 12024], 13007, 3),
    /* 12005: */ immutable(Nonterminal)("ConditionalStart", NonterminalFlags.nonterminal, [], [12026, 12027, 12028], 13010, 3),
    /* 12006: */ immutable(Nonterminal)("ControlLine", NonterminalFlags.nonterminal, [], [12008, 12010, 12018, 12019, 12020, 12025, 12029, 12031, 12039, 12040], 13013, 10),
    /* 12007: */ immutable(Nonterminal)("EOF", NonterminalFlags.empty | NonterminalFlags.string, ["string"], [], 13023, 1),
    /* 12008: */ immutable(Nonterminal)("EmptyDirective", NonterminalFlags.nonterminal, [], [12008], 13024, 1),
    /* 12009: */ immutable(Nonterminal)("EmptyLine", NonterminalFlags.nonterminal, [], [12009], 13025, 2),
    /* 12010: */ immutable(Nonterminal)("FuncDefine", NonterminalFlags.nonterminal, [], [12010], 13027, 1),
    /* 12011: */ immutable(Nonterminal)("FuncParam", NonterminalFlags.nonterminal, [], [12011], 13028, 3),
    /* 12012: */ immutable(Nonterminal)("FuncParams", NonterminalFlags.array | NonterminalFlags.arrayOfNonterminal | NonterminalFlags.arrayOfString, ["array"], [12011], 13031, 1),
    /* 12013: */ immutable(Nonterminal)("Group", NonterminalFlags.array | NonterminalFlags.arrayOfNonterminal, ["array"], [12001, 12008, 12009, 12010, 12018, 12019, 12020, 12025, 12029, 12031, 12033, 12039, 12040], 13032, 2),
    /* 12014: */ immutable(Nonterminal)("Group?", NonterminalFlags.empty | NonterminalFlags.array | NonterminalFlags.arrayOfNonterminal, [], [12001, 12008, 12009, 12010, 12018, 12019, 12020, 12025, 12029, 12031, 12033, 12039, 12040], 13034, 2),
    /* 12015: */ immutable(Nonterminal)("GroupPart", NonterminalFlags.nonterminal, [], [12001, 12008, 12009, 12010, 12018, 12019, 12020, 12025, 12029, 12031, 12033, 12039, 12040], 13036, 4),
    /* 12016: */ immutable(Nonterminal)("HeaderName", NonterminalFlags.nonterminal, [], [12016], 13040, 3),
    /* 12017: */ immutable(Nonterminal)("HeaderPart", NonterminalFlags.nonterminal, ["enableToken(HeaderNameSys)"], [12017], 13043, 1),
    /* 12018: */ immutable(Nonterminal)("Include", NonterminalFlags.nonterminal, [], [12018], 13044, 1),
    /* 12019: */ immutable(Nonterminal)("IncludeNext", NonterminalFlags.nonterminal, [], [12019], 13045, 1),
    /* 12020: */ immutable(Nonterminal)("LineAnnotation", NonterminalFlags.nonterminal, [], [12020], 13046, 4),
    /* 12021: */ immutable(Nonterminal)("NewLine", NonterminalFlags.string, ["string"], [], 13050, 2),
    /* 12022: */ immutable(Nonterminal)("PPElif", NonterminalFlags.nonterminal, [], [12022], 13052, 1),
    /* 12023: */ immutable(Nonterminal)("PPElse", NonterminalFlags.nonterminal, [], [12023], 13053, 1),
    /* 12024: */ immutable(Nonterminal)("PPEndif", NonterminalFlags.nonterminal, [], [12024], 13054, 1),
    /* 12025: */ immutable(Nonterminal)("PPError", NonterminalFlags.nonterminal, [], [12025], 13055, 1),
    /* 12026: */ immutable(Nonterminal)("PPIf", NonterminalFlags.nonterminal, [], [12026], 13056, 1),
    /* 12027: */ immutable(Nonterminal)("PPIfDef", NonterminalFlags.nonterminal, [], [12027], 13057, 1),
    /* 12028: */ immutable(Nonterminal)("PPIfNDef", NonterminalFlags.nonterminal, [], [12028], 13058, 1),
    /* 12029: */ immutable(Nonterminal)("PPWarning", NonterminalFlags.nonterminal, [], [12029], 13059, 1),
    /* 12030: */ immutable(Nonterminal)("ParamExpansion", NonterminalFlags.nonterminal, [], [12030], 13060, 1),
    /* 12031: */ immutable(Nonterminal)("Pragma", NonterminalFlags.nonterminal, [], [12031], 13061, 1),
    /* 12032: */ immutable(Nonterminal)("PreprocessingFile", NonterminalFlags.nonterminal, [], [12032], 13062, 1),
    /* 12033: */ immutable(Nonterminal)("TextLine", NonterminalFlags.nonterminal, [], [12033], 13063, 1),
    /* 12034: */ immutable(Nonterminal)("Token", NonterminalFlags.nonterminal, [], [12034], 13064, 1),
    /* 12035: */ immutable(Nonterminal)("TokenInFunc", NonterminalFlags.nonterminal, [], [12030, 12035], 13065, 2),
    /* 12036: */ immutable(Nonterminal)("TokenList", NonterminalFlags.nonterminal, ["start"], [12036], 13067, 1),
    /* 12037: */ immutable(Nonterminal)("TokenX", NonterminalFlags.string, ["string"], [], 13068, 6),
    /* 12038: */ immutable(Nonterminal)("TokenXInFunc", NonterminalFlags.string, ["string"], [], 13074, 8),
    /* 12039: */ immutable(Nonterminal)("Undef", NonterminalFlags.nonterminal, [], [12039], 13082, 1),
    /* 12040: */ immutable(Nonterminal)("VarDefine", NonterminalFlags.nonterminal, [], [12040], 13083, 1),
    /* 12041: */ immutable(Nonterminal)("VarDefineName", NonterminalFlags.string, ["string"], [], 13084, 1),
    /* 12042: */ immutable(Nonterminal)("WSC", NonterminalFlags.empty | NonterminalFlags.array | NonterminalFlags.arrayOfString, ["array"], [], 13085, 2),
    /* 12043: */ immutable(Nonterminal)("WSC2", NonterminalFlags.array | NonterminalFlags.arrayOfString, ["array"], [], 13087, 1),
    /* 12044: */ immutable(Nonterminal)("WSCElem", NonterminalFlags.string, ["string"], [], 13088, 4),
    /* 12045: */ immutable(Nonterminal)("list(FuncParam, \",\")", NonterminalFlags.array | NonterminalFlags.arrayOfNonterminal | NonterminalFlags.arrayOfString, ["array"], [12011], 13092, 2),
    /* 12046: */ immutable(Nonterminal)("repeat(Token)", NonterminalFlags.array | NonterminalFlags.arrayOfNonterminal, ["array"], [12034], 13094, 2),
    /* 12047: */ immutable(Nonterminal)("repeat(WSCElem)", NonterminalFlags.array | NonterminalFlags.arrayOfString, ["array"], [], 13096, 2),
    /* 12048: */ immutable(Nonterminal)("repeatOrNone(GroupPart)", NonterminalFlags.empty | NonterminalFlags.array | NonterminalFlags.arrayOfNonterminal, ["array"], [12001, 12008, 12009, 12010, 12018, 12019, 12020, 12025, 12029, 12031, 12033, 12039, 12040], 13098, 2),
    /* 12049: */ immutable(Nonterminal)("repeatOrNone(Token)", NonterminalFlags.empty | NonterminalFlags.array | NonterminalFlags.arrayOfNonterminal, ["array"], [12034], 13100, 2),
    /* 12050: */ immutable(Nonterminal)("repeatOrNone(TokenInFunc)", NonterminalFlags.empty | NonterminalFlags.array | NonterminalFlags.arrayOfNonterminal, ["array"], [12030, 12035], 13102, 2),
];

immutable allProductions = [
    // 13000: AllOperators @string = Operator
    immutable(Production)(immutable(NonterminalID)(12000), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 12), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13001: AllOperators @string = "("
    immutable(Production)(immutable(NonterminalID)(12000), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 2), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13002: AllOperators @string = ")"
    immutable(Production)(immutable(NonterminalID)(12000), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 3), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13003: AllOperators @string = ","
    immutable(Production)(immutable(NonterminalID)(12000), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 4), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13004: Conditional = ConditionalStart repeatOrNone(GroupPart) ConditionalNext
    immutable(Production)(immutable(NonterminalID)(12001), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 5), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 48), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 4), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13005: ConditionalElif = PPElif repeatOrNone(GroupPart) ConditionalNext
    immutable(Production)(immutable(NonterminalID)(12002), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 22), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 48), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 4), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13006: ConditionalElse = PPElse repeatOrNone(GroupPart) PPEndif
    immutable(Production)(immutable(NonterminalID)(12003), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 23), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 48), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 24), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13007: ConditionalNext = <ConditionalElif
    immutable(Production)(immutable(NonterminalID)(12004), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 2), "", "", true, false, [], [])
            ], [], [], false, false),
    // 13008: ConditionalNext = <ConditionalElse
    immutable(Production)(immutable(NonterminalID)(12004), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 3), "", "", true, false, [], [])
            ], [], [], false, false),
    // 13009: ConditionalNext = <PPEndif
    immutable(Production)(immutable(NonterminalID)(12004), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 24), "", "", true, false, [], [])
            ], [], [], false, false),
    // 13010: ConditionalStart = <PPIf
    immutable(Production)(immutable(NonterminalID)(12005), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 26), "", "", true, false, [], [])
            ], [], [], false, false),
    // 13011: ConditionalStart = <PPIfDef
    immutable(Production)(immutable(NonterminalID)(12005), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 27), "", "", true, false, [], [])
            ], [], [], false, false),
    // 13012: ConditionalStart = <PPIfNDef
    immutable(Production)(immutable(NonterminalID)(12005), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 28), "", "", true, false, [], [])
            ], [], [], false, false),
    // 13013: ControlLine = <Include
    immutable(Production)(immutable(NonterminalID)(12006), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 18), "", "", true, false, [], [])
            ], [], [], false, false),
    // 13014: ControlLine = <IncludeNext
    immutable(Production)(immutable(NonterminalID)(12006), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 19), "", "", true, false, [], [])
            ], [], [], false, false),
    // 13015: ControlLine = <VarDefine
    immutable(Production)(immutable(NonterminalID)(12006), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 40), "", "", true, false, [], [])
            ], [], [], false, false),
    // 13016: ControlLine = <FuncDefine
    immutable(Production)(immutable(NonterminalID)(12006), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 10), "", "", true, false, [], [])
            ], [], [], false, false),
    // 13017: ControlLine = <Undef
    immutable(Production)(immutable(NonterminalID)(12006), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 39), "", "", true, false, [], [])
            ], [], [], false, false),
    // 13018: ControlLine = <LineAnnotation
    immutable(Production)(immutable(NonterminalID)(12006), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 20), "", "", true, false, [], [])
            ], [], [], false, false),
    // 13019: ControlLine = <PPError
    immutable(Production)(immutable(NonterminalID)(12006), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 25), "", "", true, false, [], [])
            ], [], [], false, false),
    // 13020: ControlLine = <PPWarning
    immutable(Production)(immutable(NonterminalID)(12006), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 29), "", "", true, false, [], [])
            ], [], [], false, false),
    // 13021: ControlLine = <Pragma
    immutable(Production)(immutable(NonterminalID)(12006), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 31), "", "", true, false, [], [])
            ], [], [], false, false),
    // 13022: ControlLine = <EmptyDirective
    immutable(Production)(immutable(NonterminalID)(12006), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 8), "", "", true, false, [], [])
            ], [], [], false, false),
    // 13023: EOF @string = !anytoken @empty
    immutable(Production)(immutable(NonterminalID)(12007), [], ["empty"], [], true, false),
    // 13024: EmptyDirective = WSC "#" WSC ^NewLine
    immutable(Production)(immutable(NonterminalID)(12008), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 1), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 21), "", "", false, true, [], [])
            ], [], [], false, false),
    // 13025: EmptyLine = NL
    immutable(Production)(immutable(NonterminalID)(12009), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 11), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13026: EmptyLine = WSC2 NewLine
    immutable(Production)(immutable(NonterminalID)(12009), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 43), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 21), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13027: FuncDefine = WSC "#" WSC Identifier>>"define" WSC Identifier "(" FuncParams ")" WSC repeatOrNone(TokenInFunc) ^NewLine
    immutable(Production)(immutable(NonterminalID)(12010), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 1), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "\"define\"", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 2), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 12), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 3), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 50), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 21), "", "", false, true, [], [])
            ], [], [], false, false),
    // 13028: FuncParam = WSC Identifier WSC
    immutable(Production)(immutable(NonterminalID)(12011), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13029: FuncParam = WSC Operator>>"..." WSC
    immutable(Production)(immutable(NonterminalID)(12011), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 12), "\"...\"", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13030: FuncParam = WSC
    immutable(Production)(immutable(NonterminalID)(12011), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13031: FuncParams @array = list(FuncParam, ",")
    immutable(Production)(immutable(NonterminalID)(12012), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 45), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13032: Group @array = GroupPart
    immutable(Production)(immutable(NonterminalID)(12013), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 15), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13033: Group @array = Group GroupPart
    immutable(Production)(immutable(NonterminalID)(12013), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 13), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 15), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13034: Group? = <Group [virtual]
    immutable(Production)(immutable(NonterminalID)(12014), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 13), "", "", true, false, [], [])
            ], [], [], false, true),
    // 13035: Group? = [virtual]
    immutable(Production)(immutable(NonterminalID)(12014), [], [], [], false, true),
    // 13036: GroupPart = <Conditional
    immutable(Production)(immutable(NonterminalID)(12015), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 1), "", "", true, false, [], [])
            ], [], [], false, false),
    // 13037: GroupPart = <ControlLine
    immutable(Production)(immutable(NonterminalID)(12015), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 6), "", "", true, false, [], [])
            ], [], [], false, false),
    // 13038: GroupPart = <TextLine
    immutable(Production)(immutable(NonterminalID)(12015), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 33), "", "", true, false, [], [])
            ], [], [], false, false),
    // 13039: GroupPart = <EmptyLine
    immutable(Production)(immutable(NonterminalID)(12015), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 9), "", "", true, false, [], [])
            ], [], [], false, false),
    // 13040: HeaderName = HeaderNameSys
    immutable(Production)(immutable(NonterminalID)(12016), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 8), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13041: HeaderName = StringLiteral
    immutable(Production)(immutable(NonterminalID)(12016), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 14), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13042: HeaderName = Identifier
    immutable(Production)(immutable(NonterminalID)(12016), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13043: HeaderPart @enableToken(HeaderNameSys) = WSC HeaderName
    immutable(Production)(immutable(NonterminalID)(12017), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 16), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13044: Include = WSC "#" WSC Identifier>>"include" HeaderPart WSC ^NewLine
    immutable(Production)(immutable(NonterminalID)(12018), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 1), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "\"include\"", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 17), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 21), "", "", false, true, [], [])
            ], [], [], false, false),
    // 13045: IncludeNext = WSC "#" WSC Identifier>>"include_next" HeaderPart WSC ^NewLine
    immutable(Production)(immutable(NonterminalID)(12019), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 1), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "\"include_next\"", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 17), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 21), "", "", false, true, [], [])
            ], [], [], false, false),
    // 13046: LineAnnotation = WSC "#" WSC line:PpNumber WSC ^NewLine
    immutable(Production)(immutable(NonterminalID)(12020), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 1), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 13), "", "line", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 21), "", "", false, true, [], [])
            ], [], [], false, false),
    // 13047: LineAnnotation = WSC "#" WSC line:PpNumber WSC filename:StringLiteral WSC repeatOrNone(Token) ^NewLine
    immutable(Production)(immutable(NonterminalID)(12020), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 1), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 13), "", "line", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 14), "", "filename", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 49), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 21), "", "", false, true, [], [])
            ], [], [], false, false),
    // 13048: LineAnnotation = WSC "#" WSC Identifier>>"line" WSC line:PpNumber WSC ^NewLine
    immutable(Production)(immutable(NonterminalID)(12020), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 1), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "\"line\"", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 13), "", "line", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 21), "", "", false, true, [], [])
            ], [], [], false, false),
    // 13049: LineAnnotation = WSC "#" WSC Identifier>>"line" WSC line:PpNumber WSC filename:StringLiteral WSC repeatOrNone(Token) ^NewLine
    immutable(Production)(immutable(NonterminalID)(12020), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 1), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "\"line\"", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 13), "", "line", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 14), "", "filename", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 49), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 21), "", "", false, true, [], [])
            ], [], [], false, false),
    // 13050: NewLine @string = NL
    immutable(Production)(immutable(NonterminalID)(12021), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 11), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13051: NewLine @string = EOF
    immutable(Production)(immutable(NonterminalID)(12021), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 7), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13052: PPElif = WSC "#" WSC Identifier>>"elif" WSC repeatOrNone(Token) ^NewLine
    immutable(Production)(immutable(NonterminalID)(12022), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 1), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "\"elif\"", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 49), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 21), "", "", false, true, [], [])
            ], [], [], false, false),
    // 13053: PPElse = WSC "#" WSC Identifier>>"else" WSC ^NewLine
    immutable(Production)(immutable(NonterminalID)(12023), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 1), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "\"else\"", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 21), "", "", false, true, [], [])
            ], [], [], false, false),
    // 13054: PPEndif = WSC "#" WSC Identifier>>"endif" WSC ^NewLine
    immutable(Production)(immutable(NonterminalID)(12024), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 1), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "\"endif\"", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 21), "", "", false, true, [], [])
            ], [], [], false, false),
    // 13055: PPError = WSC "#" WSC Identifier>>"error" WSC repeatOrNone(Token) ^NewLine
    immutable(Production)(immutable(NonterminalID)(12025), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 1), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "\"error\"", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 49), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 21), "", "", false, true, [], [])
            ], [], [], false, false),
    // 13056: PPIf = WSC "#" WSC Identifier>>"if" WSC repeatOrNone(Token) ^NewLine
    immutable(Production)(immutable(NonterminalID)(12026), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 1), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "\"if\"", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 49), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 21), "", "", false, true, [], [])
            ], [], [], false, false),
    // 13057: PPIfDef = WSC "#" WSC Identifier>>"ifdef" WSC Token ^NewLine
    immutable(Production)(immutable(NonterminalID)(12027), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 1), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "\"ifdef\"", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 34), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 21), "", "", false, true, [], [])
            ], [], [], false, false),
    // 13058: PPIfNDef = WSC "#" WSC Identifier>>"ifndef" WSC Token ^NewLine
    immutable(Production)(immutable(NonterminalID)(12028), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 1), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "\"ifndef\"", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 34), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 21), "", "", false, true, [], [])
            ], [], [], false, false),
    // 13059: PPWarning = WSC "#" WSC Identifier>>"warning" WSC repeatOrNone(Token) ^NewLine
    immutable(Production)(immutable(NonterminalID)(12029), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 1), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "\"warning\"", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 49), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 21), "", "", false, true, [], [])
            ], [], [], false, false),
    // 13060: ParamExpansion = "#" WSC Identifier WSC
    immutable(Production)(immutable(NonterminalID)(12030), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 1), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13061: Pragma = WSC "#" WSC Identifier>>"pragma" WSC repeatOrNone(Token) ^NewLine
    immutable(Production)(immutable(NonterminalID)(12031), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 1), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "\"pragma\"", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 49), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 21), "", "", false, true, [], [])
            ], [], [], false, false),
    // 13062: PreprocessingFile = Group?
    immutable(Production)(immutable(NonterminalID)(12032), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 14), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13063: TextLine = WSC !"#" repeat(Token) NewLine
    immutable(Production)(immutable(NonterminalID)(12033), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 46), "", "", false, false, [], [immutable(Symbol)(true, 1)]),
                immutable(SymbolInstance)(immutable(Symbol)(false, 21), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13064: Token = TokenX WSC
    immutable(Production)(immutable(NonterminalID)(12034), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 37), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13065: TokenInFunc = TokenXInFunc WSC
    immutable(Production)(immutable(NonterminalID)(12035), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 38), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13066: TokenInFunc = <ParamExpansion
    immutable(Production)(immutable(NonterminalID)(12035), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 30), "", "", true, false, [], [])
            ], [], [], false, false),
    // 13067: TokenList @start = WSC repeatOrNone(Token)
    immutable(Production)(immutable(NonterminalID)(12036), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 49), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13068: TokenX @string = AllOperators
    immutable(Production)(immutable(NonterminalID)(12037), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 0), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13069: TokenX @string = StringLiteral
    immutable(Production)(immutable(NonterminalID)(12037), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 14), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13070: TokenX @string = CharacterLiteral
    immutable(Production)(immutable(NonterminalID)(12037), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 6), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13071: TokenX @string = PpNumber
    immutable(Production)(immutable(NonterminalID)(12037), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 13), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13072: TokenX @string = Identifier
    immutable(Production)(immutable(NonterminalID)(12037), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13073: TokenX @string = "#"
    immutable(Production)(immutable(NonterminalID)(12037), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 1), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13074: TokenXInFunc @string = Operator
    immutable(Production)(immutable(NonterminalID)(12038), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 12), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13075: TokenXInFunc @string = "("
    immutable(Production)(immutable(NonterminalID)(12038), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 2), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13076: TokenXInFunc @string = ")"
    immutable(Production)(immutable(NonterminalID)(12038), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 3), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13077: TokenXInFunc @string = ","
    immutable(Production)(immutable(NonterminalID)(12038), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 4), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13078: TokenXInFunc @string = StringLiteral
    immutable(Production)(immutable(NonterminalID)(12038), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 14), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13079: TokenXInFunc @string = CharacterLiteral
    immutable(Production)(immutable(NonterminalID)(12038), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 6), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13080: TokenXInFunc @string = PpNumber
    immutable(Production)(immutable(NonterminalID)(12038), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 13), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13081: TokenXInFunc @string = Identifier
    immutable(Production)(immutable(NonterminalID)(12038), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13082: Undef = WSC "#" WSC Identifier>>"undef" WSC Identifier WSC ^NewLine
    immutable(Production)(immutable(NonterminalID)(12039), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 1), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "\"undef\"", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 21), "", "", false, true, [], [])
            ], [], [], false, false),
    // 13083: VarDefine = WSC "#" WSC Identifier>>"define" WSC VarDefineName WSC repeatOrNone(Token) ^NewLine
    immutable(Production)(immutable(NonterminalID)(12040), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 1), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "\"define\"", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 41), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 42), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 49), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 21), "", "", false, true, [], [])
            ], [], [], false, false),
    // 13084: VarDefineName @string = Identifier !"("
    immutable(Production)(immutable(NonterminalID)(12041), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 9), "", "", false, false, [], [])
            ], [], [const(Symbol)(true, 2)], false, false),
    // 13085: WSC @array = WSC2 !WS !BlockComment !LineComment !EscapedNewline
    immutable(Production)(immutable(NonterminalID)(12042), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 43), "", "", false, false, [], [])
            ], [], [const(Symbol)(true, 15), const(Symbol)(true, 5), const(Symbol)(true, 10), const(Symbol)(true, 7)], false, false),
    // 13086: WSC @array = !WS !BlockComment !LineComment !EscapedNewline @empty
    immutable(Production)(immutable(NonterminalID)(12042), [], ["empty"], [const(Symbol)(true, 15), const(Symbol)(true, 5), const(Symbol)(true, 10), const(Symbol)(true, 7)], false, false),
    // 13087: WSC2 @array = repeat(WSCElem) !WS !BlockComment !LineComment !EscapedNewline
    immutable(Production)(immutable(NonterminalID)(12043), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 47), "", "", false, false, [], [])
            ], [], [const(Symbol)(true, 15), const(Symbol)(true, 5), const(Symbol)(true, 10), const(Symbol)(true, 7)], false, false),
    // 13088: WSCElem @string = BlockComment
    immutable(Production)(immutable(NonterminalID)(12044), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 5), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13089: WSCElem @string = LineComment
    immutable(Production)(immutable(NonterminalID)(12044), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 10), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13090: WSCElem @string = WS
    immutable(Production)(immutable(NonterminalID)(12044), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 15), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13091: WSCElem @string = EscapedNewline
    immutable(Production)(immutable(NonterminalID)(12044), [
                immutable(SymbolInstance)(immutable(Symbol)(true, 7), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13092: list(FuncParam, ",") @array = FuncParam
    immutable(Production)(immutable(NonterminalID)(12045), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 11), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13093: list(FuncParam, ",") @array = list(FuncParam, ",") "," FuncParam
    immutable(Production)(immutable(NonterminalID)(12045), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 45), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(true, 4), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 11), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13094: repeat(Token) @array = repeat(Token) Token
    immutable(Production)(immutable(NonterminalID)(12046), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 46), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 34), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13095: repeat(Token) @array = Token
    immutable(Production)(immutable(NonterminalID)(12046), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 34), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13096: repeat(WSCElem) @array = repeat(WSCElem) WSCElem
    immutable(Production)(immutable(NonterminalID)(12047), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 47), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 44), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13097: repeat(WSCElem) @array = WSCElem
    immutable(Production)(immutable(NonterminalID)(12047), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 44), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13098: repeatOrNone(GroupPart) @array = repeatOrNone(GroupPart) GroupPart
    immutable(Production)(immutable(NonterminalID)(12048), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 48), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 15), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13099: repeatOrNone(GroupPart) @array = @empty
    immutable(Production)(immutable(NonterminalID)(12048), [], ["empty"], [], false, false),
    // 13100: repeatOrNone(Token) @array = repeatOrNone(Token) Token
    immutable(Production)(immutable(NonterminalID)(12049), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 49), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 34), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13101: repeatOrNone(Token) @array = @empty
    immutable(Production)(immutable(NonterminalID)(12049), [], ["empty"], [], false, false),
    // 13102: repeatOrNone(TokenInFunc) @array = repeatOrNone(TokenInFunc) TokenInFunc
    immutable(Production)(immutable(NonterminalID)(12050), [
                immutable(SymbolInstance)(immutable(Symbol)(false, 50), "", "", false, false, [], []),
                immutable(SymbolInstance)(immutable(Symbol)(false, 35), "", "", false, false, [], [])
            ], [], [], false, false),
    // 13103: repeatOrNone(TokenInFunc) @array = @empty
    immutable(Production)(immutable(NonterminalID)(12050), [], ["empty"], [], false, false),
];

immutable GrammarInfo grammarInfo = immutable(GrammarInfo)(
        startTokenID, startNonterminalID, startProductionID,
        allTokens, allNonterminals, allProductions);

Creator.Type parse(Creator, alias Lexer, string startNonterminal = "PreprocessingFile")(ref Lexer lexer, Creator creator)
{
    alias Location = typeof(Lexer.init.front.currentLocation);
    auto parser = Parser!(Creator, Lexer)(
            creator,
            &lexer);
    ParameterTypeTuple!(__traits(getMember, parser, "parse" ~ startNonterminal))[0] parseResult;
    Location parseResultLocation;
    int gotoParent = __traits(getMember, parser, "parse" ~ startNonterminal)(parseResult, parseResultLocation);
    if (gotoParent < 0)
    {
        assert(parser.lastError !is null);
        throw parser.lastError;
    }
    else
        assert(parser.lastError is null);
    auto result = parseResult;
    creator.adjustStart(result, parseResultLocation);
    return result;
}

Creator.Type parse(Creator, alias Lexer, string startNonterminal = "PreprocessingFile")(string input, Creator creator, typeof(Lexer.init.front.currentLocation) startLocation = typeof(Lexer.init.front.currentLocation).init)
{
    alias Location = typeof(Lexer.init.front.currentLocation);
    Lexer lexer = Lexer(input, startLocation);
    auto result = parse!(Creator, Lexer, startNonterminal)(lexer, creator);
    if (!lexer.empty)
    {
        throw new SingleParseException!Location("input left after parse",
                lexer.front.currentLocation, lexer.front.currentTokenEnd);
    }
    return result;
}
