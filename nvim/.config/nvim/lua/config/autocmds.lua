local autocmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup("automations", { clear = true })

autocmd("BufWritePre", {
	desc = "Delete trailing whitespaces",
	group = group,
	command = [[ %s/\s\+$//e ]],
})

autocmd("BufWritePre", {
	desc = "Delete trailing newlines",
	group = group,
	command = [[ %s/\n\+\%$//e ]],
})

autocmd("TextYankPost", {
	desc = "Highlight yanks",
	group = group,
	callback = function()
		vim.hl.on_yank()
	end,
})

autocmd("VimResized", {
	desc = "Auto-resize splits",
	group = group,
	command = "wincmd =",
})

autocmd("BufReadPost", {
	desc = "Return to last edit position",
	group = group,
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
			return
		end
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

autocmd({ "BufWritePre" }, {
	desc = "Auto create parent dirs when saving a file",
	group = group,
	callback = function(event)
		if event.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

autocmd({ "BufWinEnter" }, {
	desc = "Disable auto comment line",
	group = group,
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

autocmd("FileType", {
	desc = "Close filetypes with <q>",
	group = group,
	pattern = {
		"checkhealth",
		"git",
		"help",
		"lspinfo",
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
})

autocmd("BufWritePost", {
	desc = "Restart dunst when config is updated",
	group = group,
	pattern = "dunstrc",
	command = "!systemctl --user restart dunst; notify-send 'Dunst' 'Notifications Settings Updated'",
})

autocmd("BufWritePost", {
	desc = "Restart waybar when config is updated",
	group = group,
	pattern = "*/waybar/config",
	command = "!systemctl --user restart waybar",
})
