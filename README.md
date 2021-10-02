# .dotfiles

Personal Linux Customization

These configurations follows the stow software approach of linked files.

The files structure follows how it is supposed to be relative to the user home folder.

For example:

.dotfiles/
    program1/
        .program1conf
    program2/
        .config/
            program2/
                [...some files]
        .local/
            share/
                program2/
                    [...some files]
    program3/
        .program3/
            [...some files]
        .program3conf

Will result in:

/home/user/
    .config/
        program2/
            [...some files]
    .local/
        share/
            program2/
                [...some files]
    .program3/
        [...some files]
    .program3conf

## Installation

To install the configuration files run the make install command

## Removal

To uninstall the configuration files run the make clean command
