vim.keymap.set("x", "p", '"_dP', { desc = "Blackhole paste" })
vim.keymap.set("v", "<M-j>", ":m '>+1<cr>gv=gv", { desc = "Move lines down" })
vim.keymap.set("v", "<M-k>", ":m '<-2<cr>gv=gv", { desc = "Move lines up" })
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })
vim.keymap.set("c", "<C-p>", "<Up>", { desc = "Previous command" })
vim.keymap.set("c", "<C-n>", "<Down>", { desc = "Next command" })
vim.keymap.set("c", "<C-h>", "<Left>", { desc = "Move cursor left" })
vim.keymap.set("c", "<C-l>", "<Right>", { desc = "Move cursor right" })
vim.keymap.set("c", "<C-b>", "<S-Left>", { desc = "Move cursor word backwards" })
vim.keymap.set("c", "<C-e>", "<S-Right>", { desc = "Move cursor word forward" })
vim.keymap.set(
	"c",
	"w!!",
	"execute 'silent! write !sudo tee % >/dev/null' <bar> edit!",
	{ desc = "Save file as sudo" }
)
vim.keymap.set("i", "<M-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
vim.keymap.set("i", "<M-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
vim.keymap.set("t", "<esc>", "<C-\\><C-n>", { desc = "Leave terminal mode" })
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Focus left window" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Focus right window" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Focus above window" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Focus below window" })
vim.keymap.set({ "t", "n" }, "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "- size horz" })
vim.keymap.set({ "t", "n" }, "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "+ size horz" })
vim.keymap.set({ "t", "n" }, "<C-Down>", "<cmd>resize -2<cr>", { desc = "- size vert" })
vim.keymap.set({ "t", "n" }, "<C-Up>", "<cmd>resize +2<cr>", { desc = "+ size vert" })
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable ex mode" })
vim.keymap.set(
	"n",
	"<cr>",
	"{-> v:hlsearch ? ':nohl<cr>' : '<cr>'}()",
	{ expr = true, desc = "Clear highlights" }
)
vim.keymap.set("n", "<M-j>", ":m .+1<cr>==", { desc = "Move line down" })
vim.keymap.set("n", "<M-k>", ":m .-2<cr>==", { desc = "Move line up" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus below window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus above window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus right window" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Concat lines" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous match" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next match" })

local wk = require("which-key")
wk.setup({
	plugins = {
		presets = {
			operators = false, -- no help for operators like d, y, ...
			motions = false, -- no help for motions
			text_objects = false, -- no help for text objects triggered after entering an operator
		},
	},
})

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

		-- Debug group
		d = {
			name = "Debug",
			["b"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
			["B"] = {
				"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
				"Toggle Breakpoint",
			},
			["e"] = {
				":lua require('dapui').eval(vim.fn.input('Eval Expression: '))<cr>",
				"Expression",
				silent = false,
			},
			["q"] = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
			["u"] = { "<cmd>lua require('refactoring').debug.cleanup({})<cr>", "Undo Prints" },
			["p"] = {
				"<cmd>lua require('refactoring').debug.printf({below = false})<cr>",
				"Print Function",
			},
			["t"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})", "Test" },
			["v"] = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle View" },
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
			["p"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Problems" },
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

		-- Marks group
		m = {
			name = "Marks",
			["1"] = {
				"<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
				"Goto Mark #1",
			},
			["2"] = {
				"<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
				"Goto Mark #2",
			},
			["3"] = {
				"<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
				"Goto Mark #3",
			},
			["4"] = {
				"<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
				"Goto Mark #4",
			},
			["5"] = {
				"<cmd>lua require('harpoon.ui').nav_file(5)<cr>",
				"Goto Mark #5",
			},
			["a"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add" },
			["s"] = {
				"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
				"Search",
			},
		},

		-- Plugins group
		p = {
			name = "Plugins",
			["s"] = { "<cmd>PackerSync<cr>", "Sync" },
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
