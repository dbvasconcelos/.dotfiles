local group = vim.api.nvim_create_augroup("automations", { clear = true })

vim.api.nvim_create_autocmd("BufWinEnter", {
	desc = "Disable auto comment",
	command = "set formatoptions-=cro",
	group = group,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Delete trailing whitespaces",
	command = [[ %s/\s\+$//e ]],
	group = group,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Delete trailing newlines",
	command = [[ %s/\n\+\%$//e ]],
	group = group,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanks",
	callback = function()
		vim.highlight.on_yank()
	end,
	group = group,
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Close filetypes with <q>",
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
	pattern = {
		"checkhealth",
		"git",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
	},
	group = group,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	desc = "Auto create parent dirs when saving a file",
	callback = function(event)
		if event.match:match("^%w%w+://") then
			return
		end
		local file = vim.loop.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
	group = group,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	desc = "Regenerate when bookmarks files are updated",
	command = "!bookmarkgen",
	pattern = { "user-bookmarks.files", "user-bookmarks.dirs" },
	group = group,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	desc = "Restart dunst when config is updated",
	command = "!killall dunst; notify-send 'Dunst' 'Notifications Settings Updated'",
	pattern = "dunstrc",
	group = group,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*/waybar/config", "*/waybar/style.css" },
	command = "!killall -SIGUSR2 waybar",
	group = group,
	desc = "Restart waybar when config is updated",
})
