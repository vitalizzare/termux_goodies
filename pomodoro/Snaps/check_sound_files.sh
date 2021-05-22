#!/bin/sh
BASE_DIR=Pomodoro_sounds
SOUNDS="work.ogg relax.ogg twit.ogg done.ogg" 
if [ -d "$BASE_DIR" ]
then
    cd "$BASE_DIR"
    for sound in $SOUNDS
    do
        [ -f $sound ] || exit 2
    done
    exit 0
else
    mkdir "$BASE_DIR"
    exit 1
fi

