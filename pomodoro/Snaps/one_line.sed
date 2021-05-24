#!/bin/sed -nf

# =============== ATTENTION ===============
# The only purpose of the script was 
# to ease converting simple formatted code
# into a single line for further use 
# in blocks of the Automate app on Android.
# Some tricky cases I left untuched.
# E.g. recognition of strings wrapped with 
# ' or " and written in several lines,
# or <<EOF (here-document) cases will be
# stitched incorrectly with semicolons
# in place of \n.
# =========================================

/^#/ ! {
# If not a commentary line
# then clean spaces and hold.
    s/^\ *//
    s/\ *$//
    s/\ \+/\ /g
    H
}

$ {
# At the end grab holden code,
# sub newlines with semicolons
# and clean unwanted 
# then print.
    g
    s/\\\n//g
    s/{\ *\n/{ /g
    s/&&\ *\n/\&\& /g
    s/||\ *\n/|| /g
    s/\n/;/g
    s/;\ *then\ *;/;then\ /g
    s/;\ *else\ *;/;else\ /g
    s/;\ *do\ *;/;do\ /g
    s/;\ *case\ \(.*\)\ in\ *;/;case \1 in\ /g
    s/;;;*/;;/g
    s/);/)\ /g
    s/{/{\ /g
    s/^;*//
    p
}

