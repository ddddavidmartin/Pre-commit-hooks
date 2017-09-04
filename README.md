This repository contains some useful and documented pre-commit hooks to use with git.

**NOTE:** The scripts in this repository are currently not actively being developed. They have served me well though and work as they are. [pre-commit.com](http://pre-commit.com/) looks like a well-maintained alternative with a similar approach. Also, live linters like [w0rp/ale](https://github.com/w0rp/ale) are pretty awesome!

## Table of contents

* [Included hooks](#included-hooks)
* [Features](#features)
* [Usage Example](#usage-example)
* [Installation](#installation)
* [Contributions](#contributions)
* [License](#license)

## Included hooks

hook | description
------------ | -------------
[pre-commit](pre-commit) | Allow to run multiple pre-commit hooks as specified in the script.
[pre-commit-compile](pre-commit-compile) | Compile the project and abort commit if it fails.
[pre-commit-uncrustify](pre-commit-uncrustify) | Run [Uncrustify](http://uncrustify.sourceforge.net/) on your sourcefiles and abort the commit if style violations have been detected. Generate a patch to fix these violations.

## Features

* Shell agnostic, should work with any Posix compliant shell
* Robust against whitespaces and special characters in file names and directories
* Tested on Linux and Mac OS
* The hooks can easily be extended and run side by side with existing ones

## Usage example

Sometimes pictures say more than a thousand words. Below is an exemplary workflow using the [Uncrustify](http://uncrustify.sourceforge.net/) hook.

* Add or edit a file and work on some code

![Work on code](example_pictures/work_on_code.png)

* Stage changes

![Add changes](example_pictures/add_file.png)

* Attempt to commit changes

![Commit changes](example_pictures/commit_changes.png)

* Apply the automatically created patch to fix the formatting

![Apply patch](example_pictures/apply_patch.png)

* Commit again

![Commit changes again](example_pictures/commit_changes_again.png)

## Installation

1. Clone the repository

    ```
    git clone git://github.com/githubbrowser/Pre-commit-hooks.git
    cd Pre-commit-hooks
    ```

2. Every script comes with a `<script>.example.cfg` configuration file. Here you will find relevant configuration options. For starters create a `pre-commit.cfg` and update the configuration section in it with the hooks that you want to install and use.

    ```
    cp pre-commit.example.cfg pre-commit.cfg
    vim pre-commit.cfg  # update with desired hooks
    ```

3. Copy the pre-commit hooks into your repository. Note that the script will ask before overwriting any existing hooks. By default it installs the example config for each hook.

    ```
    ./install_hooks.sh /path/to/repository
    ```

4. The pre-commit hooks live in the `.git/hooks` subdirectory of your git repository. Update their configuration files if required and you are good to go. By default the hooks will abort the commit and print a notice if any required configuration is missing.

5. Work on your code as usual and the hooks should be run automatically when calling `git commit`.

6. Profit!

## Contributions

Thanks to [everyone](https://github.com/githubbrowser/Pre-commit-hooks/graphs/contributors) who contributed with fixes, ideas and extensions!

Feel free to open issues or pull requests if you come across something that can be improved or does not work. Input is always appreciated.

## License

Licensed as per [LICENSE file](LICENSE).
