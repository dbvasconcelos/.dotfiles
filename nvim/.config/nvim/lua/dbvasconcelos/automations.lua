local group = vim.api.nvim_create_augroup("vimrc", { clear = true })

vim.api.nvim_create_autocmd(
	{ "BufNew", "BufEnter" },
	{ command = "setlocal formatoptions-=cro", group = group, desc = "Disable auto comment" }
)

vim.api.nvim_create_autocmd(
	"BufWritePre",
	{ command = [[ %s/\s\+$//e ]], group = group, desc = "Delete trailing whitespaces" }
)

vim.api.nvim_create_autocmd(
	"BufWritePre",
	{ command = [[ %s/\n\+\%$//e ]], group = group, desc = "Delete trailing newlines" }
)

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*sxhkdrc",
	command = "!killall -s USR1 sxhkd && notify-send 'Sxhkd' 'Hotkeys Updated'",
	group = group,
	desc = "Update bindings when sxhkdrc is updated",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "xresources", "xdefaults" },
	command = "!xrdb %",
	group = group,
	desc = "Run xrdb whenever Xdefaults or Xresources are updated",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "dunstrc",
	command = "!killall dunst; notify-send 'Dunst' 'Notifications Settings Updated'",
	group = group,
	desc = "Restart dunst when config is updated",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "picom.conf",
	command = "!killall -s USR1 picom; picom -b",
	group = group,
	desc = "Restart picom when config is updated",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "bspwmrc",
	command = "!bspc wm -r",
	group = group,
	desc = "Restart bspwm when config is updated",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "**/polybar/config.ini",
	command = "!polybar-msg cmd restart",
	group = group,
	desc = "Restart polybar when config is updated",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "user-bookmarks.files", "user-bookmarks.dirs" },
	command = "!bookmarkgen",
	group = group,
	desc = "When bookmarks files are updated, renew configs with new material",
})

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = group,
	desc = "Highlight yanks",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "tmux.conf",
	command = "!tmux source-file %",
	group = group,
	desc = "Update tmux when updating configuration",
})
