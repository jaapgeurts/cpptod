# Variables
OBJ_DIR=obj
TARGET = cpptod
PARSER_SRC=grammarcpp.ebnf grammarcpreprocdirect.ebnf
PARSER_OUT=grammarcpp.d grammarcpp_lexer.d
D_SOURCES = $(PARSER_OUT) cpptod.d convert.d dsourceprinter.d formatwriter.d
# grammarcpreproc_lexer.d grammarcpreproc.d
D_OBJECTS = $(D_SOURCES:%.d=obj/%.o)

# Compiler and flags
DC = ldc2
RELEASE = -O2 -release
DEBUG = -g
BUILDTYPE = $(DEBUG)
DFLAGS = $(BUILDTYPE) --gc -I~/.dub/packages/libdparse/0.24.0/libdparse/src -I~/.dub/packages/dparsergen/0.1.2/dparsergen/core
LFLAGS = ~/.dub/packages/libdparse/0.24.0/libdparse/libdparse.a ~/.dub/packages/dparsergen/0.1.2/dparsergen/libdparsergen_core.a

#.PHONY: genlexerparser

# Default target
all:  $(TARGET)

test: all
	./cpptod test.cpp
	cat test.d

# Build the target executable
$(TARGET): $(D_OBJECTS)
	$(DC) $(DFLAGS) $(LFLAGS) -of=$(TARGET) $(D_OBJECTS)

$(PARSER_OUT): $(PARSER_SRC)
	dparsergen_generator grammarcpp.ebnf --glr --mergesimilarstates --optempty -o grammarcpp.d --lexer grammarcpp_lexer.d

# 	dparsergen_generator grammarcpreproc.ebnf -o grammarcpreproc.d --lexer grammarcpreproc_lexer.d

# This rule in necessary because dsourceprinter uses variadic templates from formatwrite
$(OBJ_DIR)/dsourceprinter.o: dsourceprinter.d formatwriter.d
	mkdir -p $(OBJ_DIR)
	$(DC) $(DFLAGS) -c -of=$@ $<

$(OBJ_DIR)/cpptod.o: cpptod.d $(PARSER_OUT)
	mkdir -p $(OBJ_DIR)
	$(DC) $(DFLAGS) -c -of=$@ $<

# Compile .d source files to .o object files
$(OBJ_DIR)/%.o: %.d
	mkdir -p $(OBJ_DIR)
	$(DC) $(DFLAGS) -c -of=$@ $<

# Clean up build artifacts
clean:
	rm -rf $(OBJ_DIR) $(TARGET) grammarcpreproc.d grammarcpp.d

.PHONY: all clean
