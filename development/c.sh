#!/bin/bash

""" History """
1936 Alan            Turing state machine
1940 Tommy           Flowers
1957 John Backus     FORTRAN
1958 ACM/GAMM        ALGOL
1963 Strachey        CPL
1967 Martin Richards BCPL
1969 Ken Thompson    B
1972 Dennis Ritchie  C K&R
1989 ANSI/ISO        C C89/90, ANSI C, Standard C
1999 ISO             C C99
2011 ISO             C C11
2018 ISO             C C18

""" Language Level """
C                       Programming language  High-level
asm                     Assembly language     Mid-level
Machine code x86, x64   Machine Language      Low-Level


""" COMPILATION """
Preprocessor  "cc -E <sourcefile.c>"  .c    Pure C file    Preprocess
Compiler      "cc -S <sourcefile.c>"  .s    Assembly code  Lexical/Syntax/Semantic Analyzer, Pre Optimization, Code Generation, Post Optimize
Assembler     "cc -c <sourcefile.c>"  .obj  Object file
Linker        "cc -o <sourcefile.c>"  .out  Executable  
loader        "./a.out"

""" Tools """
cc  <source>
time <prog>
valgrind <prog>
strace <prog>
ldd <prog>
od <prog>
size <program>
cat /proc/<process>/maps

""" Makefile """




