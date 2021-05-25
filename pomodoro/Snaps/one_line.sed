#!/bin/sed -nf

# ============== ATTENTION ==============
# The script's sole purpose is to make it
# easy to convert simple formatted code
# to one line for later use in blocks
# of the Automate app on Android. It is
# far not perfect. So, check the result
# before use.
# =======================================

# if empty line then skip the next block
/^ *$/ b end

/^#/ ! {
# If not a commentary line
# (and not an empty line)
# then clean spaces and hold.
    s/^ *//
    s/ *$//
    s/ \+/ /g
    H
}

:end
$ {
# At the end grab holded code, then
# substitude newlines with semicolons
# when needed and, then print.
    g
    s/\\\n//g
    # clean trailing ;
    s_\([^;]\);\n_\1\n_g
    # clean trailing spaces
    s/ *$//
    # clean \n after then,else,do
    s_\(;\|\n\) *then\n_\1then _g
    s_\(;\|\n\) *else\n_\1else _g
    s_\(;\|\n\) *do\n_\1do _g
    # clean \n after case-in
    s: in\n: in :g
    # clean \n after the first case
    s: in \([^\n]\+)\)\n: in \1 :g
    # clean \n befor&after ;;
    s_\n\? *;;\n_;;_g
    # clean \n after other cases
    s_\(;;[^\n]\+)\) *\n_\1 _g
    # replace \n with space in {\n
    s:{\n:{ :g
    s_(\n_(_g
    # connect logical && ||
    s:&&\n:\&\& :g
    s:||\n:|| :g
    # the rest \n replace with ;
    s/\n/;/g
    # clean ; at the beginnign
    s/^;*//
    p
}

