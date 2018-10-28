# Basic C SDL project

This project is a basic C [SDL][] project that uses [CMake][] as a build system.

## Dependencies

- [Git][]
- C Compiler (gcc, ...)
- [CMake][]
- [SDL2][SDL] library

**On Debian/Ubuntu based distributions, use the following command:**

```sh
sudo apt install git-core build-essential pkg-config cmake cmake-data libsdl2-dev
```

**Optional packages:**

- [SDL2_image][] library
- [SDL2_ttf][] library
- [SDL2_gfx][] library

```sh
sudo apt install libsdl2-image-dev libsdl2-ttf-dev libsdl2-gfx-dev
```

## Build instructions

```sh
# Clone this repo
git clone git@gitlab.com:aminosbh/basic-c-sdl-project.git
cd basic-c-sdl-project

# Create a build folder
mkdir build
cd build

# Build
cmake ..
make

# Run
./basic-c-sdl-project
```

***Note:*** To use SDL2_image, SDL2_ttf or SDL2_gfx, you should uncomment
some instructions in the CMakeLists.txt file and re-execute `cmake ..` and `make`

### Open the project with an IDE under Linux

#### Open with Qt Creator

[Qt Creator][] is a cross-platform C/C++ IDE, originally dedicated for the Qt framework.
It handle natively CMake projects and provide an efficient code completion.

*Install Qt creator:*

Install from Debian/Ubuntu repo:

```sh
sudo apt install qtcreator
```

Online installer: https://www.qt.io/download-thank-you?hsLang=en<br>
Offline installer: https://www.qt.io/offline-installers

*Open the project:*<br>
Run Qt Creator, use `Open Files or Project ...` and select the `CMakeLists.txt`
file of the cloned project.<br>
Finally, build and run the project.


#### Open with Code::blocks

[Code::Blocks][] is a well-known cross-platform C/C++ and Fortran IDE.
It handle CMake projects by wrapping them into native Code::Blocks projects.

*Install Code::Blocks*

```sh
sudo apt install codeblocks
```

*Prepare the Code::Blocks project:*

```sh
# Create a folder for the Code::Blocks project
cd basic-c-sdl-project
mkdir -p build/codeblocks
cd build/codeblocks

# Generate a Code::Blocks project
cmake ../.. -G "CodeBlocks - Unix Makefiles"
```

*Open the project:*<br>
Run Code::Blocks, and open the project in `basic-c-sdl-project/build/codeblocks`.<br>
Finally, build and run the project.


## License

This project is distributed under the terms of the MIT license
[&lt;LICENSE&gt;](LICENSE).



[SDL]: https://www.libsdl.org
[CMake]: https://cmake.org
[Git]: https://git-scm.com
[SDL2_image]: https://www.libsdl.org/projects/SDL_image
[SDL2_ttf]: https://www.libsdl.org/projects/SDL_ttf
[SDL2_gfx]: http://www.ferzkopp.net/wordpress/2016/01/02/sdl_gfx-sdl2_gfx
[Qt Creator]: https://doc.qt.io/qtcreator
[Code::Blocks]: http://www.codeblocks.org
