#!/bin/sh
[ $# -ne 0 ] || return
termux-clipboard-set "$1"
termux-toast -s -g top "Copied to clipboard: $1"

if [ $(expr "$1" : "http[s]\?://youtu.be/.\+") -ne 0 ]
then
    TITLE=$(youtube-dl --get-filename --output '%(title)s' "$1")
    CHOICE=$($HOME/bin/choose -t "$TITLE" Music Talking Video)
    case "$CHOICE" in
        0) echo Downloading music...
        cd $HOME/storage/music
        youtube-dl --format "bestaudio/best"\
    	    --no-overwrites \
    	    --output '%(title)s.%(ext)s' "$1"
        ;;
        1) echo Downloading podcast...
        cd $HOME/storage/music/podcast
        youtube-dl --format "worstaudio/worst"\
        	--no-overwrites \
        	--output '%(title)s.%(ext)s' "$1"
        ;;
        2) echo Downloading video...
        cd $HOME/storage/movies
        youtube-dl -f "best[height<400]/best[height<500]/best[height<700]/best"\
        	--no-overwrites \
        	--output '%(title)s.%(ext)s' "$1"
        ;;
        *) false
    esac
    [ $? -eq 0 ] && termux-toast -g top "Got: $TITLE" || termux-toast -g top "Nothing downloaded"

elif [ $(expr "$1" : "http[s]\?://github.com/[a-zA-Z0-9-]\+/.\+") -ne 0 ]
then
    TITLE=${1##*/}
    CHOICE=$($HOME/bin/choose -t "$TITLE"  "Git Clone")
    case "$CHOICE" in
    0) echo Cloning git repository...
        cd /data/data/com.termux/files/home/repositories
        git clone "$1"
    ;;
    *) false
    esac
    [ $? -eq 0 ] && termux-toast -g top "Got: $TITLE" || termux-toast -g top "Nothing downloaded"
fi

