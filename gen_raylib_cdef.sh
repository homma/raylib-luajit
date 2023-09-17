#!/bin/sh -x

# generates cdef file to be used by luajit ffi

# system include path
BASE=/Library/Developer/CommandLineTools
SDK_INCLUDE=${BASE}/SDKs/MacOSX.sdk/usr/include

# toolchain include path
CLANG_VER=$(clang -dumpversion)
TOOL_INCLUDE=${BASE}/usr/lib/clang/${CLANG_VER}/include

# raylib include path
# we assume it is installed with Homebrew (brew install raylib)
RAYLIB_INCLUDE=$(brew --prefix raylib)/include/

# raylib header file
TARGET=${RAYLIB_INCLUDE}/raylib.h

mkdir -p ext
OUTPUT=ext/raylib.cdef
rm ${OUTPUT}

echo '/* this file is generated from raylib.h */' >> ${OUTPUT}

# generates cdefs from header files
clang -cc1 -ast-print \
-I ${SDK_INCLUDE} -I ${TOOL_INCLUDE} -I ${RAYLIB_INCLUDE} \
${TARGET} \
| sed 's/_Nullable//' \
| sed 's/__attribute__((.*))//' >> ${OUTPUT}
