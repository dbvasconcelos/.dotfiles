return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		keys = {
			{
				"<leader>dd",
				function()
					require("dapui").toggle()
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
		config = function(_, _)
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end

			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end

			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end

			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		opts = {
			highlight_new_as_changed = true,
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = "williamboman/mason.nvim",
		opts = function()
			local ret = {
				ensure_installed = {},
				automatic_installation = true,
			}
			local languages = require("dbvasconcelos.plugins.lsp.lang")
			for _, lang in pairs(languages) do
				if lang.debugger then
					table.insert(ret.ensure_installed, lang.debugger)
				end
			end
			return ret
		end,
	},
	{
		"mfussenegger/nvim-dap",
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
	},
}
