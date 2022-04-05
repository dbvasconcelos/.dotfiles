# .dotfiles

Personal Linux Customization

These configurations follows the stow[https://www.gnu.org/software/stow/] software approach of linked files.

The files structure follows how it is supposed to be relative to the user home folder.

For example:

.dotfiles/
    program-1/
        .program-1.conf
    program-2/
        .config/
            program-2/
                [...some files]
        .local/
            share/
                program-2/
                    [...some files]
    program-3/
        .program-3/
            [...some files]

Will result in:

/home/user/
    .program-1.conf
    .config/
        program-2/
            [...some files]
    .local/
        share/
            program-2/
                [...some files]
    .program-3/
        [...some files]

## Installation

To install the configuration files run ```make install```

## Removal

To uninstall the configuration files run ```make clean```
