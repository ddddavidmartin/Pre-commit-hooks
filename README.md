This repository contains some useful and documented pre-commit hooks to use with git.

Included hooks
============
hook | description
------------ | -------------
pre-commit | Allow to run multiple pre-commit hooks as specified in the script.
pre-commit-compile | Compile the project and abort commit if it fails.
pre-commit-default | The default git pre-commit hook checking for example for trailing whitespaces.
pre-commit-uncrustify | Run [Uncrustify](http://uncrustify.sourceforge.net/) on your sourcefiles and abort the commit if style violations have been detected. Generate a patch to fix these violations.

Features
=========
* Shell agnostic, should work with any Posix compliant shell
* Robust against whitespaces and special characters in file names and directories
* Tested on Linux and Mac OS

Example
=======
Everything is explained more easily with a few pictures. For example the [Uncrustify](http://uncrustify.sourceforge.net/) hook.

* Add or edit a file and work on some code

![Work on code](example_pictures/work_on_code.png)

* Add changes

![Add changes](example_pictures/add_file.png)

* Attempt to commit changes

![Commit changes](example_pictures/commit_changes.png)

* Apply the automatically created patch to fix the formatting

![Apply patch](example_pictures/apply_patch.png)

* Commit again

![Commit changes again](example_pictures/commit_changes_again.png)
