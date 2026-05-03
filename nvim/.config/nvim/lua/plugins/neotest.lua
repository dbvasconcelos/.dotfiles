return {
	"nvim-neotest/neotest",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-neotest/nvim-nio" },
		{ "nvim-lua/plenary.nvim" },
		{ "antoinemadec/FixCursorHold.nvim" },
		{ "nvim-treesitter/nvim-treesitter" },
		{
			"fredrikaverpil/neotest-golang",
			dependencies = {
				{ "leoluz/nvim-dap-go", opts = {} },
			},
			build = function()
				vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait()
			end,
		},
	},
	config = function()
		local neotest = require("neotest")
		local neotest_defaults = require("neotest.config")
		local function clone(value)
			if type(value) == "table" then
				return vim.deepcopy(value)
			end
			return value
		end
		neotest.setup({
			adapters = {
				require("neotest-golang")({
					runner = "gotestsum",
					go_test_args = {
						"-v",
						"-race",
					},
					gotestsum_args = { "--format=standard-verbose" },
				}),
			},
			discovery = {
				enabled = true,
				concurrent = 0,
			},
			running = { concurrent = true },
			-- NOTE: workaround for avoiding LSP warnings due to missing fields
			summary = vim.tbl_deep_extend("force", clone(neotest_defaults.summary), {
				animated = true,
			}),
			log_level = vim.log.levels.WARN,
			consumers = clone(neotest_defaults.consumers),
			icons = clone(neotest_defaults.icons),
			highlights = clone(neotest_defaults.highlights),
			floating = clone(neotest_defaults.floating),
			strategies = clone(neotest_defaults.strategies),
			run = clone(neotest_defaults.run),
			output = clone(neotest_defaults.output),
			output_panel = clone(neotest_defaults.output_panel),
			quickfix = clone(neotest_defaults.quickfix),
			status = clone(neotest_defaults.status),
			state = clone(neotest_defaults.state),
			watch = clone(neotest_defaults.watch),
			diagnostic = clone(neotest_defaults.diagnostic),
			projects = clone(neotest_defaults.projects),
			default_strategy = neotest_defaults.default_strategy,
		})
	end,
	keys = {
		{
			"<leader>dt",
			function()
				require("neotest").run.run({ suite = false, strategy = "dap" })
			end,
			desc = "Test",
		},
	},
}
