#!/bin/bash

#
# Copyright (c) 2019 Amine Ben Hassouna <amine.benhassouna@gmail.com>
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


# ----------------------------
# Script to rename the project
# ----------------------------

# Autodetect the git repository
PROJECT_GIT_REPO_AUTO=$(git remote get-url origin 2> /dev/null)
if echo "${PROJECT_GIT_REPO_AUTO}" | grep -o "^git@.*:" > /dev/null 2>&1; then
    # Convert to https
    PROJECT_GIT_REPO_AUTO_=$(echo "${PROJECT_GIT_REPO_AUTO}" | cut -d'@' -f 2)
    PROJECT_GIT_REPO_AUTO_HOST=$(echo "${PROJECT_GIT_REPO_AUTO_}" | cut -d':' -f 1)
    PROJECT_GIT_REPO_AUTO_PATH=$(echo "${PROJECT_GIT_REPO_AUTO_}" | cut -d':' -f 2)
    PROJECT_GIT_REPO_AUTO="https://${PROJECT_GIT_REPO_AUTO_HOST}/${PROJECT_GIT_REPO_AUTO_PATH}"
fi

# Specify the git repository
echo "Please enter the git repository path (No semicolons):"
echo -e "Press enter to keep the autodetected git repository:\n\e[32m${PROJECT_GIT_REPO_AUTO}\e[0m"
read PROJECT_GIT_REPO
if [ -z "$PROJECT_GIT_REPO" ]; then
    PROJECT_GIT_REPO="${PROJECT_GIT_REPO_AUTO}"
fi
echo


# Autodetect the project and executable name
PROJECT_EXECUTABLE_NAME_AUTO="$(echo "${PROJECT_GIT_REPO}" | rev | cut -d'/' -f 1 | rev | cut -d'.' -f 1)"
PROJECT_NAME_AUTO=$(echo "${PROJECT_EXECUTABLE_NAME_AUTO}" | sed 's/-/ /g')
PROJECT_NAME_AUTO="${PROJECT_NAME_AUTO^}"

# Specify the project name
echo "Please enter the project name (No slashes '/'):"
echo -e "Press enter to keep the autodetected project name: \e[32m'${PROJECT_NAME_AUTO}'\e[0m"
read PROJECT_NAME
if [ -z "$PROJECT_NAME" ]; then
    PROJECT_NAME="${PROJECT_NAME_AUTO}"
fi
echo

# Specify the executable name
echo "Please enter the project executable name (No spaces, no slashes '/')"
echo -e "Press enter to keep the autodetected executable name: \e[32m'${PROJECT_EXECUTABLE_NAME_AUTO}'\e[0m"
read PROJECT_EXECUTABLE_NAME
if [ -z "$PROJECT_EXECUTABLE_NAME" ]; then
    PROJECT_EXECUTABLE_NAME="${PROJECT_EXECUTABLE_NAME_AUTO}"
fi
echo


# Display a summary for confirmation
echo
echo "This script will rename your project, like the following:"
echo -e "Project git repository:  \e[32m'${PROJECT_GIT_REPO}'\e[0m"
echo -e "Project name:            \e[32m'${PROJECT_NAME}'\e[0m"
echo -e "Project executable name: \e[32m'${PROJECT_EXECUTABLE_NAME}'\e[0m"
echo
echo -e "\e[31mDo you confirm your modifications ? [y/N]\e[0m"
read RENAME_PROJECT
if [ -n "$RENAME_PROJECT" ] && [ "$(echo "$RENAME_PROJECT" | tr a-z A-Z)" = "Y" ]; then
    sed -i "s/Basic C SDL2 project/${PROJECT_NAME}/g" README.md rename_project.sh
    sed -i "s/basic-c-sdl-project/${PROJECT_EXECUTABLE_NAME}/g" README.md IDE_USAGE.md CMakeLists.txt rename_project.sh
    sed -i "s;https://gitlab.com/aminosbh/basic-c-sdl-project.git;${PROJECT_GIT_REPO};g" README.md rename_project.sh
    echo -e "\e[32mThe project was successfully renamed\e[0m"
else
    echo -e "\e[33mOperation aborted\e[0m"
fi

