#!/bin/bash

# Joseph Harriott  Thu 09 May 2024

# fix some awkward nodes : fickle tricky stuff left in other people's remotes

if [[ $repository =~ nonexistant ]]; then
    false
elif [[ $repository =~ clifm ]]; then
    # aux is an illegal name on  MSWin
    [ -s "misc/codecov/aux.c.gcov" ] &&
        mv misc/codecov/aux.c.gcov misc/codecov/aux-rNT.c.gcov
    [ -s "src/aux.c" ] && mv src/aux.c src/aux-rNT.c
    [ -s "src/aux.h" ] && mv src/aux.h src/aux-rNT.h
    # fd aux $DCGRs
elif [[ $repository =~ (jekyll|protesilaos) ]]; then
    fd -tl -HL -x unlink {} \; -x touch {}
elif [[ $repository =~ LaTeX-examples ]]; then
    # Case conflicts...
    sy=publications/hasy/symbols
    for cc in $sy/AE $sy/O; do
        [ -s $cc.pdf ] && mv $cc.pdf $cc-caps.pdf
    done
fi
cd $DCGRs

