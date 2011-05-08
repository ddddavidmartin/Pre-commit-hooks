#!/bin/sh

# Install git pre-commit hooks.
# The root directory of the target local git repository is expected as a parameter.

# This script is part of the pre-commit hooks available at github.
# Link:    https://github.com/githubbrowser/Pre-commit-hooks
# Contact: David Martin, david.martin.mailbox@googlemail.com

###########################################################
# Settings:
# select which pre-commit hooks are going to be installed
HOOKS="pre-commit pre-commit-default pre-commit-compile"
###########################################################

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)

# Absolute path this script is in, e.g. /home/user/bin/
SCRIPTPATH=$(dirname $SCRIPT)


# copy hooks to the directory specified as parameter
copy_hooks() {
    # create hooks subfolder if it does not yet exist
    mkdir -p $1/hooks

    for hook in $HOOKS
    do
        echo "Copying $hook to $1/hooks."
        cp -i $SCRIPTPATH/$hook $1/hooks
    done
}


echo "Git pre-commit hook installation."
if [ $# = 1 ] ; then
    if [ -d "$1/.git" ] ; then
        copy_hooks $1/.git
        echo "Make sure all copied files are executable."
    else
        echo "Error: $1/.git does not exist."
        echo "Are you sure $1 is the root directory of your local git repository?"
    fi
else
    echo "Call this script with the destination git repository as parameter."
fi
