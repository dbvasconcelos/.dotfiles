return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = {
				enabled_commands = false,
				highlight_new_as_changed = true,
			},
		},
		{
			"rcarriga/nvim-dap-ui",
			keys = {
				{
					"<leader>du",
					function()
						require("dapui").toggle({})
					end,
					desc = "UI Toggle",
				},
				{
					"<leader>de",
					function()
						require("dapui").eval()
					end,
					desc = "Eval",
					mode = { "n", "v" },
				},
			},
			opts = {},
			config = function(_, opts)
				local dap = require("dap")
				local dapui = require("dapui")
				dapui.setup(opts)
				dap.listeners.after.event_initialized["dapui_config"] = function()
					dapui.open({})
				end
				dap.listeners.before.event_terminated["dapui_config"] = function()
					dapui.close({})
				end
				dap.listeners.before.event_exited["dapui_config"] = function()
					dapui.close({})
				end
			end,
		},
		{
			"folke/which-key.nvim",
			opts = {
				defaults = {
					["<leader>d"] = { name = "+debug" },
				},
			},
		},
		{
			"jay-babu/mason-nvim-dap.nvim",
			dependencies = "williamboman/mason.nvim",
			opts = {
				ensure_installed = {
					"delve",
				},
			},
		},
	},
	config = function()
		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = " ", texthl = "LspDiagnosticsSignError", linehl = "", numhl = "" }
		)
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = " ", texthl = "LspDiagnosticsSignWarn", linehl = "", numhl = "" }
		)
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{ text = " ", texthl = "LspDiagnosticsSignHint", linehl = "", numhl = "" }
		)
		vim.fn.sign_define("DapStopped", {
			text = "",
			texthl = "LspDiagnosticsSignInformation",
			linehl = "DiagnosticUnderlineInfo",
			numhl = "LspDiagnosticsSignInformation",
		})
	end,
	keys = {
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle Breakpoint",
		},
		{
			"<leader>dB",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Breakpoint Condition",
		},
		{
			"<F1>",
			function()
				require("dap").step_back()
			end,
			desc = "Step Back",
		},
		{
			"<F2>",
			function()
				require("dap").step_into()
			end,
			desc = "Step Into",
		},
		{
			"<F3>",
			function()
				require("dap").step_over()
			end,
			desc = "Step Over",
		},
		{
			"<F4>",
			function()
				require("dap").step_out()
			end,
			desc = "Step Out",
		},
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "Continue",
		},
		{
			"<F6>",
			function()
				require("dap").run_to_cursor()
			end,
			desc = "Run to cursor",
		},
		{
			"<leader>dw",
			function()
				require("dap.ui.widgets").hover()
			end,
			desc = "Widgets",
		},
		{
			"<leader>dr",
			function()
				require("dap").repl.open()
			end,
			desc = "Repl",
		},
	},
}
