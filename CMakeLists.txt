#
# Copyright (c) 2018 Amine Ben Hassouna <amine.benhassouna@gmail.com>
#
# Permission is hereby granted, free of charge, to any
# person obtaining a copy of this software and associated
# documentation files (the "Software"), to deal in the
# Software without restriction, including without
# limitation the rights to use, copy, modify, merge,
# publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software
# is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice
# shall be included in all copies or substantial portions
# of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF
# ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
# TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
# SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
# IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE.
#

# Define the project name
project(basic-c-sdl-project)

# Set the cmake minimum version to 3.5.1
cmake_minimum_required(VERSION 3.5.1)

# Add all headers files under the include directory
include_directories(include)

# Add all c source files under the src directory
file(GLOB SOURCES "src/*.c")
add_executable(${PROJECT_NAME} ${SOURCES})

# Load CMake module : FindPkgConfig
include(FindPkgConfig)

# Add SDL2 library
pkg_search_module(SDL2 REQUIRED sdl2)
include_directories(${SDL2_INCLUDE_DIRS})
target_link_libraries(${PROJECT_NAME} ${SDL2_LIBRARIES})

# Add SDL2_image library
#pkg_search_module(SDL2IMAGE REQUIRED SDL2_image>=2.0.0)
#include_directories(${SDL2IMAGE_INCLUDE_DIRS})
#target_link_libraries(${PROJECT_NAME} ${SDL2IMAGE_LIBRARIES})

# Add SDL2_ttf library
#pkg_search_module(SDL2TTF REQUIRED SDL2_ttf>=2.0.0)
#include_directories(${SDL2TTF_INCLUDE_DIRS})
#target_link_libraries(${PROJECT_NAME} ${SDL2TTF_LIBRARIES})

# Add SDL2_gfx library
#pkg_search_module(SDL2GFX REQUIRED SDL2_gfx)
#include_directories(${SDL2GFX_INCLUDE_DIRS})
#target_link_libraries(${PROJECT_NAME} ${SDL2GFX_LIBRARIES})

