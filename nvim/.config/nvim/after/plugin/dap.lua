require("dap")
require("dapui").setup()
require("dap-go").setup()

vim.fn.sign_define(
	"DapBreakpoint",
	{ text = "", texthl = "LspDiagnosticsSignError", linehl = "", numhl = "" }
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

require("nvim-dap-virtual-text").setup({
	enabled_commands = false,
	highlight_new_as_changed = true,
})
