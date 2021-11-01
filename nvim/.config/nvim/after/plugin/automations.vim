" Nvim's automation settings

augroup vimrc
	" Remove all vimrc autocommands to avoid duplicates
	autocmd!

	" Disable auto comment
	autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

	" Auto source when updating vim config
	autocmd! BufWritePost *.vim source % | echom "Reloaded nvim"

	" Automatically deletes all trailing whitespace and newlines at end of file on save
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritepre * %s/\n\+\%$//e

	" Update binds when sxhkdrc is updated
	autocmd BufWritePost sxhkdrc !pkill -USR1 -x sxhkd

	" Run xrdb whenever Xdefaults or Xresources are updated
	autocmd BufWritePost xresources,xdefaults !xrdb %

	" Restart dunst when config is updated
	autocmd BufWritePost dunstrc !killall dunst

	" Update system configuration file after changing local copy
	autocmd BufWritePost ~/.local/etc/* !copy-sys-file '%:p'

	" When bookmarks files are updated, renew configs with new material
	autocmd BufWritePost user-bookmarks.files,user-bookmarks.dirs !bookmarkgen

	" Highlight yanks
	autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }

    " Update tmux when updating configuration
    autocmd BufWritePost tmux.conf !tmux source-file %

augroup end
