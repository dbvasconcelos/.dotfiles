# .dotfiles

Personal Linux Customization

The configuration follows the stow[https://www.gnu.org/software/stow/] software approach of linked files.

The files are linked relative to the user home folder.

For example:

    .dotfiles/
        program-1/
            .program-1.conf
        program-2/
            .config/
                program-2/
                    [some files...]
            .local/
                share/
                    program-2/
                        [some files...]
        program-3/
            .program-3/
                [some files...]

Will result in:

    $HOME/
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

## Install

To install the configuration files run ```make install```

## Uninstall

To uninstall the configuration files run ```make uninstall```
