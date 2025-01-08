# Variables
OBJ_DIR=obj
TARGET = cpptod
D_SOURCES = cpptod.d convert.d dsourceprinter.d formatwriter.d grammarcpreproc.d grammarcpreproc_lexer.d grammarcpp.d grammarcpp_lexer.d
D_OBJECTS = $(D_SOURCES:%.d=obj/%.o)

# Compiler and flags
DC = ldc2
RELEASE = -O2 -release
DFLAGS = --gc -I~/.dub/packages/libdparse/0.24.0/libdparse/src -I~/.dub/packages/dparsergen/0.1.2/dparsergen/core
LFLAGS = ~/.dub/packages/libdparse/0.24.0/libdparse/libdparse.a ~/.dub/packages/dparsergen/0.1.2/dparsergen/libdparsergen_core.a

# Default target
all:  $(TARGET)

test: all
	./cpptod test.cpp
	cat test.d

# Build the target executable
$(TARGET): $(D_OBJECTS)
	$(DC) $(DFLAGS) $(LFLAGS) -of=$(TARGET) $(D_OBJECTS)

grammarcpreproc.d: grammarcpreproc.ebnf
	dparsergen_generator grammarcpreproc.ebnf -o grammarcpreproc.d --lexer grammarcpreproc_lexer.d

grammarcpp.d: grammarcpp.ebnf
	dparsergen_generator grammarcpp.ebnf --glr --mergesimilarstates --optempty -o grammarcpp.d --lexer grammarcpp_lexer.d

# This rule in necessary because dsourceprinter uses variadic templates from formatwrite
$(OBJ_DIR)/dsourceprinter.o: dsourceprinter.d formatwriter.d
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
