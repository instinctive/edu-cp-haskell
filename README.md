# Competitive Programming in Haskell

Haskell is a fun language, but out of the box most of the base library is
hidden.  This means the single-file programs written in Competitive Programming
(CP) for [Google Code Jam](https://codingcompetitions.withgoogle.com/codejam)
or [CodeChef](https://www.codechef.com/) often begin with many lines of
`LANGUAGE` pragmas and `import` statements.

For years I just wrapped all that boilerplate in `vim` fold markers, copying an
ever-expanding header to each solution file.

But no more! My new technique is to abuse the `CPP` pragma to `#include`
boilerplate code. Disgusting, yes, but it gets the job done.

## Project Structure

For our purposes, a "project" is a set of CP solutions. Here's the file
structure, showing the solutions to two problems from CodeChef's START43
contest:

```
$ tree chef/START43/
chef/START43/
├── etc -> ../../etc
├── src
│   ├── dispal.hs
│   └── permand.hs
├── test
│   ├── dispal.i
│   ├── dispal.o
│   ├── permand.i
│   └── permand.o
├── Makefile -> etc/Makefile
└── Solutions
```

Solutions are found in the `src` directory: `src/dispal` and `src/permand`.
For example, here's a solution to
[DISPAL](https://www.codechef.com/submit-v2/DISPAL):

```haskell
#include "include/prelude.hs"

main = getInt >>= flip replicateM_ docase

docase = do
    [n,x] <- getInts
    maybe (print $ -1) putStrLn $ solve n x

solve n x = ...
```

The base library function `replicateM_` is not exposed by default, and the code
also uses two utility functions `getInt` and `getInts`. These functions are
made available via the `#import` statement at the top of the file.

The `test` directory contains the input and output files for "golden" tests.
These are generally supplied with the problem description.

## Workflow

Notice that there is no `.cabal` file in this directory. The `.cabal` file will
be auto-generated by the `Makefile`, after which the usual `cabal` commands
will be available. The `Makefile` will also take care of the testing.

```
$ cd chef/START43
$ make
Testing...
OK: dispal
OK: permand
$ cabal repl dispal -v0
ghci> solve 5 3
Just "bcacb"
```

## Configuration

To make all this work, the `Solutions` file must be configured:

```
$ cat Solutions
let solutions = 
    [ "dispal"
    , "permand"
    ]
in ./etc/Config solutions
```

This is a `dhall` file. The `Makefile` uses `dhall` to generate the `.cabal`
file and to run the tests.

## Submitting Code to be Judged

The CP sites require all the code to be in a single file. Whenever this tooling
compiles the code, it also writes a complete version of the code to the `out`
directory.

Here is a before and after look at the directory structure:

```
$ tree                        $ tree                      
.                             .                           
├── etc -> ../../etc          ├── etc -> ../../etc        
│                             ├── out                     
│                             │   ├── dispal.hs           
│                             │   └── permand.hs          
├── src                       ├── src                     
│   ├── dispal.hs             │   ├── dispal.hs           
│   └── permand.hs            │   └── permand.hs          
├── test                      ├── test                    
│   ├── dispal.i              │   ├── dispal.i            
│   ├── dispal.o              │   ├── dispal.o            
│   │                         │   ├── dispal.t            
│   ├── permand.i             │   ├── permand.i           
│   └── permand.o             │   ├── permand.o           
│                             │   └── permand.t           
├── Makefile -> etc/Makefile  ├── Makefile -> etc/Makefile
└── Solutions                 ├── Solutions               
                              └── Solutions.cabal         
```

The files in the `out` directory can be submitted to the competition.
