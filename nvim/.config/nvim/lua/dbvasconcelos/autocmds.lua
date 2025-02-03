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
	pattern = {
		"checkhealth",
		"git",
		"help",
		"lspinfo",
		"neotest-output",
		"neotest-output-panel",
		"neotest-summary",
		"man",
		"notify",
		"qf",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.schedule(function()
			vim.keymap.set("n", "q", function()
				vim.cmd("close")
				pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
			end, { buffer = event.buf, silent = true, desc = "Quit buffer" })
		end)
	end,
	group = group,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	desc = "Auto create parent dirs when saving a file",
	callback = function(event)
		if event.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
	group = group,
})

-- Dunst Live Conf
vim.api.nvim_create_autocmd("BufWritePost", {
	desc = "Restart dunst when config is updated",
	command = "!systemctl --user restart dunst; notify-send 'Dunst' 'Notifications Settings Updated'",
	pattern = "dunstrc",
	group = group,
})

-- Waybar Live Conf
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*/waybar/config",
	command = "!systemctl --user restart waybar",
	group = group,
	desc = "Restart waybar when config is updated",
})
