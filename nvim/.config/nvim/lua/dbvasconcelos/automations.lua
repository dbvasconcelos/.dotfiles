local group = vim.api.nvim_create_augroup("vimrc", { clear = true })

-- Disable auto comment
vim.api.nvim_create_autocmd(
	{ "BufNew", "BufEnter" },
	{ command = "setlocal formatoptions-=cro", group = group }
)
-- Automatically deletes all trailing whitespace and newlines at end of file on save
vim.api.nvim_create_autocmd("BufWritePre", { command = [[ %s/\s\+$//e ]], group = group })
vim.api.nvim_create_autocmd("BufWritePre", { command = [[ %s/\n\+\%$//e ]], group = group })

-- Update binds when sxhkdrc is updated
vim.api.nvim_create_autocmd(
	"BufWritePost",
	{ pattern = "sxhkdrc", command = "!pkill -USR1 -x sxhkd", group = group }
)

-- Run xrdb whenever Xdefaults or Xresources are updated
vim.api.nvim_create_autocmd(
	"BufWritePost",
	{ pattern = { "xresources", "xdefaults" }, command = "!xrdb %", group = group }
)

-- Restart dunst when config is updated
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "dunstrc",
	command = "!killall dunst; notify-send 'Dunst' 'Notifications Settings Updated'",
	group = group,
})

-- Restart picom when config is updated
vim.api.nvim_create_autocmd(
	"BufWritePost",
	{ pattern = "picom.conf", command = "!killall -s USR1 picom; picom -b", group = group }
)

-- Restart bspwm when config is updated
vim.api.nvim_create_autocmd(
	"BufWritePost",
	{ pattern = { "bspwmrc", "**/polybar/config" }, command = "!bspc wm -r", group = group }
)

-- When bookmarks files are updated, renew configs with new material
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "user-bookmarks.files", "user-bookmarks.dirs" },
	command = "!bookmarkgen",
	group = group,
})

-- Highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
	group = group,
})

-- Update tmux when updating configuration
vim.api.nvim_create_autocmd(
	"BufWritePost",
	{ pattern = "tmux.conf", command = "!tmux source-file %", group = group }
)
