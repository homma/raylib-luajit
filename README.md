#### About

Using raylib library from LuaJIT on macOS

#### Prerequisites

- macOS
- [clang](https://clang.llvm.org)
- [luajit](https://luajit.org) (ex. `brew install luajit`)
- [raylib](https://www.raylib.com) (ex. `brew install raylib`)

#### Preparation

generate necessary files as below.

````
$ ./gen_raylib_cdef.sh
$ ./ext/gen_raylib_color.sh
````

#### Usage

````
$ luajit samples/window.lua
````

#### Licenses

- `LICENSE.raylib-luajit` for files except under ext/ directory
- `LICENSE.raylib` for files under ext/ directory
