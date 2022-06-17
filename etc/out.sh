#!/usr/bin/env bash
#
# This is an extra pre-processing step that runs after CPP.
#
#       --ghc-options -F -pgmF <this>
#
# This splits the CPP output, sending one copy unaltered to GHC.
# The other copy is witten to the 'out/' directory after stripping
# file line directives and repeated blank lines.

mkdir -p out; cat $2 | tee $3 | grep -v "^#" | cat -s > out/$(basename -- $1)
