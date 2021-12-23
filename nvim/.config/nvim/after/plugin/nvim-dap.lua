local dap = require("dap")

vim.cmd([[nnoremap <silent> <F5> :lua require'dap'.step_into()<CR>]])
vim.cmd([[nnoremap <silent> <F6> :lua require'dap'.step_over()<CR>]])
vim.cmd([[nnoremap <silent> <F8> :lua require'dap'.continue()<CR>]])
vim.cmd([[nnoremap <silent> <leader>db :lua require'dap'.toggle_breakpoint()<CR>]])
vim.cmd([[nnoremap <silent> <leader>de :lua require'dap'.repl.open()<CR>]])
vim.cmd([[nnoremap <silent> <leader>di :lua require('dap.ui.variables').hover()<CR>]])

vim.g.dap_virtual_text = true

dap.adapters.go = function(callback, _)
	local handle
	local port = 38697
	handle, _ = vim.loop.spawn(
		"dlv",
		{ args = { "dap", "-l", "127.0.0.1:" .. port }, detached = true },
		function(code)
			handle:close()
			print("Delve exited with exit code: " .. code)
		end
	)
	callback({ type = "server", host = "127.0.0.1", port = port })
end
-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = { { type = "go", name = "Debug", request = "launch", program = "${file}" } }
