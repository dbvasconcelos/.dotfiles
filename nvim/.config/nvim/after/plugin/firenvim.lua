vim.g.firenvim_config = {
	localSettings = {
		[ [[.*]] ] = {
			cmdline = "firenvim",
			priority = 0,
			selector = 'textarea:not([readonly]):not([class="handsontableInput"]), div[role="textbox"]',
			takeover = "never",
		},
		[ [[.*docs\.google\.com.*]] ] = {
			priority = 9,
			takeover = "never",
		},
	},
}

if vim.g.started_by_firenvim then
	vim.cmd("TZMinimalist")

	local group = vim.api.nvim_create_augroup("firenvim", {})

	vim.api.nvim_create_autocmd("BufEnter", {
		pattern = "github.com_*.txt",
		command = "set filetype=markdown",
		group = group,
		desc = "github textareas filetype",
	})

	vim.api.nvim_create_autocmd("BufEnter", {
		pattern = "web.whatsapp.com_*.txt",
		callback = function()
			vim.keymap.set("i", "<cr>", "<esc>:w<cr>:call firenvim#press_keys('<LT>CR>')<cr>ggdGa")
		end,
		group = group,
		desc = "whatsapp textareas send on enter",
	})
end
