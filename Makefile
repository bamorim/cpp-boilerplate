#
# TODO: Add APPS for compiling executables from a different folder, skipping .o objects
# 

CC := g++
CFLAGS := -std=c++14 -Wall -O3
LIB := -Llib
DISTFLAGS := -static-libstdc++
INC := -I include

SRCDIR := src
BUILDDIR := build
TESTDIR := test
APPSDIR := apps
INCDIR := include

SRCEXT := cpp
HEADEXT := hpp

SOURCES := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT))
TESTS := $(shell find $(TESTDIR) -type f -name *.$(SRCEXT))
APPS := $(shell find $(APPSDIR) -type f -name *.$(SRCEXT))

OBJECTS := $(patsubst %,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))
TESTOBJECTS := $(patsubst %,$(BUILDDIR)/%,$(TESTS:.$(SRCEXT)=.o))
BINARIES := $(patsubst $(APPSDIR)/%,bin/%,$(APPS:.$(SRCEXT)=))

COMPILE := $(CC) $(CFLAGS) $(INC) -c 
MAKEDEPS := $(COMPILE) -MMD
LINKEDIT := $(CC) $(CFLAGS) $(LIB)

all: $(BINARIES)

bin/%: $(BUILDDIR)/$(APPSDIR)/%.o $(OBJECTS)
	@echo " Compiling app: $@"
	$(LINKEDIT) -o $@ $^

# Standalone distributable file
bin/dist/%: $(BUILDDIR)/$(APPSDIR)/%.o $(OBJECTS)
	@mkdir -p bin/dist/
	@echo " Compiling distributable app: $@"
	$(LINKEDIT) $(DISTFLAGS) -o $@ $^

bin/test: $(OBJECTS) $(TESTOBJECTS)
	@echo " Linking test executable..."
	@$(LINKEDIT) -o $@ $^

$(BUILDDIR)/%.o: %.$(SRCEXT)
	@echo " Compiling object: $@"
	@mkdir -p $(dir $@)
	@$(MAKEDEPS) -o $@ $<
	@$(COMPILE) -o $@ $<

test: bin/test
	@echo " Running tests..."
	@./bin/test

.PHONY: test

clean:
	@echo " Cleaning..."
	@rm -rf $(BUILDDIR) $(BINTESTDIR)

# Look at http://make.mad-scientist.net/papers/advanced-auto-dependency-generation/ for further info on make deps and those included files
-include $(wildcard $(BUILDDIR)/**/*.d)
