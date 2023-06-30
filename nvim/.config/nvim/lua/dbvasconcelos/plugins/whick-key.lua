return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			plugins = {
				presets = {
					operators = false, -- no help for operators like d, y, ...
					motions = false, -- no help for motions
					text_objects = false, -- no help for text objects triggered after entering an operator
				},
			},
			groups = {
				mode = { "n", "v" },
				["g"] = { name = "+goto" },
				["]"] = { name = "+next" },
				["["] = { name = "+prev" },
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register(opts.groups)
			-- Normal Mode
			wk.register({
				["<leader>"] = {
					["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
					["P"] = { "<cmd>MarkdownPreviewToggle<cr>", "Preview" },
					["q"] = { ":Bdelete<cr>", "Close Buffer" },
					["Q"] = { ":bufdo :Bdelete<cr>", "Close All Buffers" },
					["w"] = { "<cmd>w!<cr>", "Save" },
					["x"] = { "<cmd>!xdg-open %<cr><cr>", "Open file in the default app" },
					["y"] = { '"+y', "Yank to clipboard" },
					["Y"] = { '"+Y', "Yank line to clipboard" },

					-- Buffer group
					b = {
						name = "Buffer",
						["c"] = { "<cmd>Telescope neoclip<cr>", "Clipboard" },
						["f"] = { "<cmd>TZFocus<cr>", "Focus" },
						["q"] = { "<cmd>bp|bd #<cr>", "Close" },
						["r"] = { ":%s//gc<left><left><left>", "Replace All", silent = false },
						["R"] = {
							":%s/<C-r><C-w>//gc<left><left><left>",
							"Replace All (Current Word)",
							silent = false,
						},
						["u"] = { "<cmd>UndotreeToggle<cr>", "Undo Tree" },
						["z"] = { "<cmd>TZAtaraxis<cr>", "Distraction free" },
					},

					-- Git group
					g = {
						name = "Git",
						["b"] = { "<cmd>Telescope git_branches<cr>", "Branches" },
						["c"] = { "<cmd>Telescope git_bcommits<cr>", "Buffer Commits" },
						["C"] = { "<cmd>Telescope git_commits<cr>", "Commits" },
						["f"] = { "<cmd>Git fetch --all<cr>", "Fetch" },
						["g"] = { "<cmd>diffget //2<cr>", "Pick left change" },
						["h"] = { "<cmd>diffget //3<cr>", "Pick right change" },
						["l"] = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
						["p"] = {
							"<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
							"Preview Hunk",
						},
						["P"] = {
							"<cmd>Git push<cr>",
							"Push",
						},
						["r"] = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
						["R"] = {
							"<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
							"Reset Buffer",
						},
						["s"] = { "<cmd>G<cr>", "Status" },
						["S"] = { "<cmd>Telescope git_stash<cr>", "Stashes" },
						["u"] = {
							"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
							"Undo Stage Hunk",
						},
					},

					-- LSP group
					l = {
						name = "LSP",
						["a"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
						["f"] = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
						["i"] = { "<cmd>LspInfo<cr>", "Info" },
						["I"] = { "<cmd>Mason<cr>", "Tools" },
						["l"] = { "<cmd>lua require('lint').try_lint()<cr>", "Lint" },
						["p"] = {
							"<cmd>TroubleToggle document_diagnostics<cr>",
							"Document Problems",
						},
						["P"] = {
							"<cmd>TroubleToggle workspace_diagnostics<cr>",
							"Workspace Problems",
						},
						["q"] = { "<cmd>TroubleToggle loclist<cr>", "Quickfix" },
						["r"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
						["s"] = {
							"<cmd>Telescope lsp_document_symbols<cr>",
							"Document Symbols",
						},
						["t"] = { "<cmd>lua require('neotest').run.run()<cr>", "Test" },
						["S"] = {
							"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
							"Workspace Symbols",
						},
					},

					-- Search group
					s = {
						name = "Search",
						["."] = {
							'<cmd>lua require"dbvasconcelos.telescope".dotfiles()<cr>',
							"Dotfiles",
						},
						["f"] = { "<cmd>Telescope find_files<cr>", "File" },
						["i"] = { "<cmd>Telescope media_files<cr>", "Image" },
						["t"] = { "<cmd>Telescope live_grep<cr>", "Text" },
						["w"] = {
							":lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>')})<cr>",
							"Current Word",
						},
					},

					-- Vim group
					v = {
						name = "Vim",
						["a"] = { "<cmd>Telescope autocommands<cr>", "Autocommands" },
						["c"] = { "<cmd>Telescope commands<cr>", "Commands" },
						["C"] = { "<cmd>Telescope command_history<cr>", "Command History" },
						["h"] = { ":h <C-R>=expand('<cword>')<cr><cr>", "Help (Word)" },
						["H"] = { "<cmd>Telescope help_tags<cr>", "Help Search" },
						["k"] = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
						["o"] = { "<cmd>Telescope options<cr>", "Options" },
						["s"] = { "<cmd>Telescope search_history<cr>", "Search History" },
					},
				},
			}, { nowait = true })

			-- Visual Mode
			wk.register({
				["<leader>"] = {
					-- No group
					["y"] = { '"+y', "Yank to Clipboard" },

					-- Debug group
					d = {
						name = "Debug",
						["p"] = {
							"<esc><cmd>lua require('refactoring').debug.print_var({})<cr>",
							"Print Var",
						},
					},

					-- LSP Group
					l = {
						name = "LSP",
						["r"] = {
							"<esc><cmd>lua require('telescope').extensions.refactoring.refactors()<cr>",
							"Refactor",
						},
					},
				},
			}, { mode = "v", nowait = true })
		end,
	},
}
