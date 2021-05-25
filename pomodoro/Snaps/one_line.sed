#!/bin/sed -nf

# ============== ATTENTION ==============
# The script's sole purpose is to make it
# easy to convert simple formatted code
# to one line for later use in blocks
# of the Automate app on Android. It is
# far not perfect. So, check the result
# before use.
# =======================================

/^\ *$/ b end

/^#/ ! {
# If not a commentary line
# then clean spaces and hold.
    s/^\ *//
    s/\ *$//
    s/\ \+/\ /g
    H
}

:end
$ {
# At the end grab holden code,
# sub newlines with semicolons
# and clean unwanted 
# then print.
    g
    s/\\\n//g
    s/^ *//g
    s/ *$//g
    s/\(;\|\n\) *then\n/\1then /g
    s/\(;\|\n\) *else\n/\1else /g
    s/\(;\|\n\) *do\n/\1do /g
    s/ in\n/ in /g
    s/ in \([^\n]\+)\)\n/ in \1 /g
    s/{ *\n/{ /g
    s/( *\n/(/g
    s/&& *\n/\&\& /g
    s/|| *\n/|| /g
    s/\n\? *;;\ *\n/;;/g
    s/; *\n/;/g
    s/\(;;.*)\) *\n/\1 /g
    s/\n/;/g
    s/^;*//
    p
}

