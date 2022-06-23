require("dapui").setup()
require("dap-go").setup()
require("nvim-dap-virtual-text").setup({
	enabled_commands = false,
	highlight_new_as_changed = true,
})

vim.keymap.set("n", "<F1>", "<cmd>lua require'dap'.step_back()<cr>", { desc = "Step into (Debug)" })
vim.keymap.set("n", "<F2>", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step into (Debug)" })
vim.keymap.set("n", "<F3>", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Step over (Debug)" })
vim.keymap.set("n", "<F4>", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Step out (Debug)" })
vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", { desc = "Continue (Debug)" })
vim.keymap.set(
    "n",
    "<F6>",
    "<cmd>lua require'dap'.run_to_cursor()<cr>",
    { desc = "Run to cursor (Debug)" }
)

vim.fn.sign_define(
	"DapBreakpoint",
	{ text = "", texthl = "LspDiagnosticsSignError", linehl = "", numhl = "" }
)
vim.fn.sign_define(
	"DapBreakpointCondition",
	{ text = "", texthl = "LspDiagnosticsSignWarn", linehl = "", numhl = "" }
)
vim.fn.sign_define(
	"DapBreakpointRejected",
	{ text = "", texthl = "LspDiagnosticsSignHint", linehl = "", numhl = "" }
)
vim.fn.sign_define("DapStopped", {
	text = "",
	texthl = "LspDiagnosticsSignInformation",
	linehl = "DiagnosticUnderlineInfo",
	numhl = "LspDiagnosticsSignInformation",
})
