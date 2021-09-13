# CMake sdl project - IDE usage

There is many IDEs that support CMake projects. It could be natively or via plugins.<br>
This is a short tutorial on how we can use some IDEs to open a CMake project on linux:

- [Qt Creator](#open-the-project-with-qt-creator)
- [Code::Blocks](#open-the-project-with-codeblocks)
- [Eclipse](#open-the-project-with-eclipse-cc)

## Open the project with Qt Creator

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


## Open the project with Code::blocks

[Code::Blocks][] is a well-known cross-platform C/C++ and Fortran IDE.
It handle CMake projects by wrapping them into native Code::Blocks projects.

*Install Code::Blocks*

```sh
sudo apt install codeblocks
```

*Prepare the Code::Blocks project:*

```sh
# Create a folder for the Code::Blocks project
cd sdl2-pointerless
mkdir -p build/codeblocks
cd build/codeblocks

# Generate a Code::Blocks project
cmake ../.. -G "CodeBlocks - Unix Makefiles"
```

*Open the project:*<br>
Run Code::Blocks, and open the project in `sdl2-pointerless/build/codeblocks`.<br>
Finally, build and run the project.


## Open the project with Eclipse C/C++

[Eclipse][] is a well-known IDE, widely used in Java projects development, but
it also supports other programming languages, like in this case C/C++.
It handle CMake projects by wrapping them into native Eclipse projects.

*Download Eclipse C/C++:*

Online installer: https://www.eclipse.org/downloads<br>
Offline package: https://www.eclipse.org/downloads/packages

*Prepare the Eclipse project:*

```sh
# Create a folder for the Eclipse project outside this project
cd sdl2-pointerless
mkdir ../eclipse-sdl2-pointerless
cd ../eclipse-sdl2-pointerless

# Generate an Eclipse project
cmake ../sdl2-pointerless -G "Eclipse CDT4 - Unix Makefiles"
```
*Open the project:*<br>
Run Eclipse, and open the project in `eclipse-sdl2-pointerless`.<br>
Create a new run configuration: Go to `Run` &gt; `Run configurations` &gt;
`C\C++ Application` and specify the C/C++ Application using `Search Project...`<br>
Finally, build and run the project.



[Qt Creator]: https://doc.qt.io/qtcreator
[Code::Blocks]: http://www.codeblocks.org
[Eclipse]: https://www.eclipse.org
