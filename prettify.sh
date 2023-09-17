#!/bin/sh

# @author Daisuke Homma

INDENT_TYPE=Spaces
INDENT_WIDTH=2
QUOTE_STYLE=AutoPreferSingle
CALL_PARENTHESES=None
COLUMN_WIDTH=80

stylua -v ${PWD}/*.lua \
--indent-type ${INDENT_TYPE} \
--indent-width ${INDENT_WIDTH} \
--quote-style ${QUOTE_STYLE} \
--call-parentheses ${CALL_PARENTHESES} \
--column-width ${COLUMN_WIDTH}
