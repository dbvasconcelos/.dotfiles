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
	pattern = "dunstrc",
	command = "!killall dunst; notify-send 'Dunst' 'Notifications Settings Updated'",
	group = group,
	desc = "Restart dunst when config is updated",
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

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"checkhealth",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
	group = group,
	desc = "Close filetypes with <q>",
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	callback = function(event)
		if event.match:match("^%w%w+://") then
			return
		end
		local file = vim.loop.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
	group = group,
	desc = "Auto create dir when saving a file, in case some intermediate directory does not exist",
})
