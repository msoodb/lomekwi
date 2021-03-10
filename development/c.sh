#!/bin/bash

""" History """
1936 Alan            Turing state machine
1940 Tommy           Flowers
1957 John Backus     FORTRAN
1958 ACM/GAMM        ALGOL
1963 Strachey        CPL
1967 Martin Richards BCPL
1969 Ken Thompson    B
1972 Dennis Ritchie  C
1978 K&R             C C78, K&R C
1989 ANSI/ISO        C C89/90, ANSI C, Standard C
1999 ISO             C C99
2011 ISO             C C11
2018 ISO             C C18

""" Language Level """
C                       Programming language  High-level
asm                     Assembly language     Mid-level
Machine code x86, x64   Machine Language      Low-Level

""" Standard headers """
<stdio.h> 		Defines core input and output functions
<stdlib.h> 		Defines numeric conversion functions, pseudo-random numbers generation functions, memory allocation, process control functions
<time.h> 		Defines date- and time-handling functions
<assert.h> 		Contains the assert macro, used to assist with detecting logical errors and other types of bugs in debugging versions of a program.
<ctype.h> 		Defines set of functions used to classify characters by their types or to convert between upper and lower case.
<errno.h> 		For testing error codes reported by library functions.
<float.h> 		Defines macro constants specifying the implementation-specific properties of the floating-point library.
<limits.h> 		Defines macro constants specifying the implementation-specific properties of the integer types.
<locale.h> 		Defines localization functions.
<math.h> 		Defines common mathematical functions.
<setjmp.h> 		Declares the macros setjmp and longjmp, which are used for non-local exits.
<signal.h> 		Defines signal-handling functions.
<stdarg.h> 		For accessing a varying number of arguments passed to functions.
<stddef.h> 		Defines several useful types and macros.
<string.h> 		Defines string-handling functions
<iso646.h> 	NA1 	Defines several macros that implement alternative ways to express several standard tokens. For programming in ISO 646 variant character sets.
<wchar.h> 	NA1 	Defines wide-string-handling functions
<wctype.h> 	NA1 	Defines set of functions used to classify wide characters by their types or to convert between upper and lower case
<tgmath.h> 	C99 	Defines type-generic mathematical functions.
<complex.h>* 	C99 	A set of functions for manipulating complex numbers.
<fenv.h> 	C99 	Defines a set of functions for controlling floating-point environment.
<inttypes.h> 	C99 	Defines exact-width integer types.
<stdbool.h> 	C99 	Defines a boolean data type.
<stdint.h> 	C99 	Defines exact-width integer types.
<threads.h>* 	C11 	Defines functions for managing multiple threads, mutexes and condition variables
<uchar.h> 	C11 	Types and functions for manipulating Unicode characters
<stdatomic.h>* 	C11 	For atomic operations on data shared between threads.
<stdalign.h> 	C11 	For querying and specifying the alignment of objects.
<stdnoreturn.h>	C11 	For specifying non-returning functions

""" 
* complex.h, stdatomic.h, and threads.h are conditional features that implementations are not required to support.
* Normative Addendum 1 (also known as NA1, C94, and C95) is a standardized amendment to the C standard published in 1995 by ISO.
  The amendment was added in order to address the growing international need for international character sets support in C.
  The amendment is formally known as ISO/IEC 9899/AMD1:1995 (also ISO/IEC 9899 AM1). NA1 added three new headers that added support for wide-characters, wide-strings, and international keyboard. 
"""

""" C POSIX library """
<stdio.h> 		Defines core input and output functions
<stdlib.h> 		Defines numeric conversion functions, pseudo-random numbers generation functions, memory allocation, process control functions
<time.h> 		Defines date- and time-handling functions
<assert.h> 		Contains the assert macro, used to assist with detecting logical errors and other types of bugs in debugging versions of a program.
<ctype.h> 		Defines set of functions used to classify characters by their types or to convert between upper and lower case.
<errno.h> 		For testing error codes reported by library functions.
<float.h> 		Defines macro constants specifying the implementation-specific properties of the floating-point library.
<limits.h> 		Defines macro constants specifying the implementation-specific properties of the integer types.
<locale.h> 		Defines localization functions.
<math.h> 		Defines common mathematical functions.
<setjmp.h> 		Declares the macros setjmp and longjmp, which are used for non-local exits.
<signal.h> 		Defines signal-handling functions.
<stdarg.h> 		For accessing a varying number of arguments passed to functions.
<stddef.h> 		Defines several useful types and macros.
<string.h> 		Defines string-handling functions
<iso646.h> 	NA1 	Defines several macros that implement alternative ways to express several standard tokens. For programming in ISO 646 variant character sets.
<wchar.h> 	NA1 	Defines wide-string-handling functions
<wctype.h> 	NA1 	Defines set of functions used to classify wide characters by their types or to convert between upper and lower case
<tgmath.h> 	C99 	Defines type-generic mathematical functions.
<complex.h>* 	C99 	A set of functions for manipulating complex numbers.
<fenv.h> 	C99 	Defines a set of functions for controlling floating-point environment.
<inttypes.h> 	C99 	Defines exact-width integer types.
<stdbool.h> 	C99 	Defines a boolean data type.
<stdint.h> 	C99 	Defines exact-width integer types.
<aio.h> 	        Asynchronous input and output
<arpa/inet.h> 	        Functions for manipulating numeric IP addresses (part of Berkeley sockets)
<cpio.h> 	        Magic numbers for the cpio archive format
<dirent.h>  	        Allows the opening and listing of directories
<dlfcn.h> 	        Dynamic linking
<fcntl.h> 	        File opening, locking and other operations
<fmtmsg.h> 	        Message display structures
<fnmatch.h> 	        Filename matching
<ftw.h> 	        File tree traversal
<glob.h> 	        Pathname "globbing" (pattern-matching)
<grp.h> 	        User group information and control
<iconv.h> 	        Codeset conversion facility
<langinfo.h> 	        Language information constants – builds on C localization functions
<libgen.h> 	        Pathname manipulation
<monetary.h> 	        String formatting of monetary units
<mqueue.h> 	        Message queue
<ndbm.h> 	        NDBM database operations
<net/if.h> 	        Listing of local network interfaces
<netdb.h> 	        Translating protocol and host names into numeric addresses (part of Berkeley sockets)
<netinet/in.h> 	        Defines Internet protocol and address family (part of Berkeley sockets)
<netinet/tcp.h>         Additional TCP control options (part of Berkeley sockets)
<nl_types.h> 	        Localization message catalog functions
<poll.h> 	        Asynchronous file descriptor multiplexing
<pthread.h> 	        Defines an API for creating and manipulating POSIX threads
<pwd.h> 	        passwd (user information) access and control
<regex.h> 	        Regular expression matching
<sched.h> 	        Execution scheduling
<search.h> 	        Search tables
<semaphore.h> 	        POSIX semaphores
<spawn.h> 	        Process spawning
<strings.h> 	        Case-insensitive string comparisons
<stropts.h> 	        Stream manipulation, including ioctl
<sys/ipc.h> 	        Inter-process communication (IPC)
<sys/mman.h> 	        Memory management, including POSIX shared memory and memory mapped files
<sys/msg.h> 	        POSIX message queues
<sys/resource.h>        Resource usage, priorities, and limiting
<sys/select.h> 	        Synchronous I/O multiplexing
<sys/sem.h> 	        XSI (SysV style) semaphores
<sys/shm.h> 	        XSI (SysV style) shared memory
<sys/socket.h> 	        Main Berkeley sockets header
<sys/stat.h> 	        File information (stat et al.)
<sys/statvfs.h>         File System information
<sys/time.h> 	        Time and date functions and structures
<sys/times.h> 	        File access and modification times
<sys/types.h> 	        Various data types used elsewhere
<sys/uio.h> 	        Vectored I/O operations
<sys/un.h> 	        Unix domain sockets
<sys/utsname.h>	        Operating system information, including uname
<sys/wait.h> 	        Status of terminated child processes (see wait)
<syslog.h> 	        System error logging
<tar.h> 	        Magic numbers for the tar archive format
<termios.h> 	        Allows terminal I/O interfaces
<trace.h> 	        Tracing of runtime behavior (DEPRECATED)
<ulimit.h> 	        Resource limiting (DEPRECATED in favor of <sys/resource.h>)
<unistd.h> 	        Various essential POSIX functions and constants
<utime.h> 	        inode access and modification times
<utmpx.h> 	        User accounting database functions
<wordexp.h> 	        Word-expansion like the shell would perform

"""
https://stackoverflow.com/questions/9376837/difference-between-c-standard-library-and-c-posix-library
https://pubs.opengroup.org/onlinepubs/9699919799/help/codes.html#CX
https://stackoverflow.com/questions/34644220/posix-sigevent-not-compiling-with-c11
"""

""" Utilities """
gcc      <source>
nm       <object>
file     <source>
time     <prog>
valgrind <prog>
strace   <prog>
ldd      <prog>
od       <prog>
size     <prog>
cat      /proc/<process>/maps

""" GNU Toolchain """
1- GNU Compiler Collection (GCC): a compiler suite that supports many languages, such as C/C++ and Objective-C/C++.
2- GNU Make: an automation tool for compiling and building applications.
3- GNU Binutils: a suite of binary utility tools, including linker and assembler.
4- GNU Debugger (GDB).
5- GNU Autotools: A build system including Autoconf, Autoheader, Automake and Libtool.
6- GNU Bison: a parser generator (similar to lex and yacc).

""" File Types """
Headers          .h
Source           .c
Static Libraries .a
Shared Library   .so
Because of the advantage of dynamic linking, GCC, by default, links to the shared library if it is available.

""" Command """
gcc --version
gcc -v
gcc --help
man gcc
man gcc | col -b > gcc.txt
whereis gcc
touch hello.c
gcc hello.c
gcc -Wall -g -v -o hello hello.c

""" COMPILATION """
Preprocessor  "cc -E <sourcefile.c>"  .c    Pure C file    Preprocessing
Compiler      "cc -S <sourcefile.c>"  .s    Assembly code  Compilation Lexical/Syntax/Semantic Analyzer, Pre Optimization, Code Generation, Post Optimize
Assembler     "cc -c <sourcefile.c>"  .o    Object file    Assembl
Linker        "cc -o <sourcefile.c>"  .out  Executable     Linking
  
""" Searching for Header Files and Libraries (-I, -L and -l) """
-Idir
-Ldir
-l libxxx.a

""" GCC Environment Variables """
PATH: For searching the executables and run-time shared libraries .so
CPATH: For searching the include-paths for headers. It is searched after paths specified in -I<dir> options. C_INCLUDE_PATH and CPLUS_INCLUDE_PATH can be used to specify C and C++ headers if the particular language was indicated in pre-processing.
LIBRARY_PATH: For searching library-paths for link libraries. It is searched after paths specified in -L<dir> options.


""" Makefile """




