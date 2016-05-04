# Cpp Boilerplate with Catch && Cxxopts

This is my boilerplate for C++ projects using Catch for testing and Cxxopts for option parsing.

## Folder strucutre

```
|-- apps/
|    | # Here goes your executable files. 
|    | # Each file here will generate a correspondent exec file in bin/
|-- bin/
|    | # Compiled binaries will go here
|-- build/
|    | # Build temp folder
|-- include/
|    |-- catch.hpp # Catch test library
|    |-- cxxopts.hpp # Cxxopts option parser library
|    | # Other header files should go here
|-- src/
|    | # Place your non-exec files here
|-- test/
|    |-- main.cpp # Main Catch test executable
|    | # Create your test files here
|-- Makefile # See this file for more detail on building
|-- README.md
+-- run_tests # Test helper to build and pass Catch params to it

``` 

## Running tests

This project uses [Catch](https://github.com/philsquared/Catch) for testing. You can run `./run_tests`. If you want to pass Catch parameters, you just pass it to `./run_tests`

## Building

This project uses `make` to build. So to run, just type `make` in the shell.

If you want to create an executable bundled with stdlib (to increase portability) you can run `make bin/dist/yourbinary`

For now, all files from src/ are linked in all test and executable files. If you want to change this, you can change the Makefile

## Creating binaries

Just create a `.cpp` file in `apps/` and you can use [Cxxopts](https://github.com/jarro2783/cxxopts)
