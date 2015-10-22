#!/bin/sh

# Install git pre-commit hooks.
# The root directory of the target local git repository is expected as a parameter.

# This file is part of a set of unofficial pre-commit hooks available
# at github.
# Link:    https://github.com/githubbrowser/Pre-commit-hooks
# Contact: David Martin, david.martin.mailbox@googlemail.com


###########################################################
# CONFIGURATION:
# select which pre-commit hooks are going to be installed
#HOOKS="pre-commit pre-commit-compile pre-commit-uncrustify"
HOOKS="pre-commit pre-commit-compile pre-commit-uncrustify"
###########################################################
# There should be no need to change anything below this line.

. "$(dirname -- "$0")/canonicalize_filename.sh"

# exit on error
set -e

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT="$(canonicalize_filename "$0")"

# Absolute path this script is in, e.g. /home/user/bin/
SCRIPTPATH="$(dirname -- "$SCRIPT")"

# copy hooks to the directory specified as parameter
copy_hooks() {
    echo "Copying hooks to destination directory:"
    for hook in $HOOKS
    do
        echo "Copying $hook to $1/hooks."
        cp -i -- "$SCRIPTPATH/$hook" "$1/hooks" || true
    done

    echo ""
    echo "Checking if hooks are executable:"
    for hook in $HOOKS
    do
        if [ ! -x "$1/hooks/$hook" ] ; then
            echo "$hook is not executable. Fix it by calling"
            echo "chmod +x $1/hooks/$hook"
        else
            echo "$hook OK."
        fi
    done
}


echo ""
echo "Git pre-commit hook installation."
echo ""
if [ $# = 1 ] ; then
    if [ -e "$1/.git" ] ; then
        if [ -d "$1/.git" ] ; then
            GIT_FOLDER=$1/.git
        else
            GIT_FOLDER=$1/`cat $1/.git | awk '{ print ($2) }'`
        fi
        # create hooks subfolder if it does not yet exist
        mkdir -p -- "$GIT_FOLDER/hooks"

        echo "Copying prerequisites."
        cp -i -- "$SCRIPTPATH/canonicalize_filename.sh" "$GIT_FOLDER/hooks/" || true
        echo ""
        copy_hooks "$GIT_FOLDER"
        echo ""
        echo "Finished installation."
    else
        echo "Error: $1/.git does not exist."
        echo "Are you sure $1 is the root directory of your local git repository?"
    fi
else
    echo "Call this script with the destination git repository as parameter."
fi
