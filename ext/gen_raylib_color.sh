#!/bin/sh -x

# extract color names from the header file

# we assume it is installed with Homebrew (brew install raylib)
RAYLIB_INCLUDE=$(brew --prefix raylib)/include/

# raylib header file
RAYLIB_HEADER=${RAYLIB_INCLUDE}/raylib.h

OUTPUT=$(dirname ${0})/rlcolor.lua
rm ${OUTPUT}

cat <<END >> ${OUTPUT}
-- this file is generated from raylib.h

local rlcolor = {}
END

grep '^#define' ${RAYLIB_HEADER} \
| grep Color \
| sed 's#//.*$##' \
| sed 's/#define /rlcolor./' \
| sed 's/CLITERAL(Color)/= /' >> ${OUTPUT}

cat <<END >> ${OUTPUT}
return rlcolor
END

