----
-- Global Mappings
----

vim.keymap.set("", "gf", ":e <cfile><cr>", { desc = "Allow gf to open non-existent files" })

----
-- Visual Only Mappings
----

vim.keymap.set("x", "p", '"_dP', { desc = "Blackhole paste" })

----
-- Visual and Select Mode Mappings
----

vim.keymap.set("v", "<M-j>", ":m '>+1<cr>gv=gv", { desc = "Move lines down" })
vim.keymap.set("v", "<M-k>", ":m '<-2<cr>gv=gv", { desc = "Move lines up" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

----
-- Command Mode Mappings
----

vim.keymap.set(
	"c",
	"w!!",
	"execute 'silent! write !sudo tee % >/dev/null' <bar> edit!",
	{ desc = "Save file as sudo" }
)

vim.keymap.set("c", "<C-p>", "<Up>", { desc = "Previous command" })
vim.keymap.set("c", "<C-n>", "<Down>", { desc = "Next command" })
vim.keymap.set("c", "<C-h>", "<Left>", { desc = "Move cursor left" })
vim.keymap.set("c", "<C-l>", "<Right>", { desc = "Move cursor right" })
vim.keymap.set("c", "<C-b>", "<S-Left>", { desc = "Move cursor word backwards" })
vim.keymap.set("c", "<C-e>", "<S-Right>", { desc = "Move cursor word forward" })

----
-- Insert Mode Mappings
----

-- Move Line with <Alt> + vimkeys
vim.keymap.set("i", "<M-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<M-k>", "<Esc>:m .-2<CR>==gi")

----
-- Terminal Mode Mappings
----

-- Leave terminal mode with <esc>
vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

-- Navigation with <Ctrl> + vimkeys
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- Resizing with <Ctrl> + arrow keys
vim.keymap.set({ "t", "n" }, "<C-Left>", "<cmd>vertical resize -2<cr>")
vim.keymap.set({ "t", "n" }, "<C-Right>", "<cmd>vertical resize +2<cr>")
vim.keymap.set({ "t", "n" }, "<C-Down>", "<cmd>resize +2<cr>")
vim.keymap.set({ "t", "n" }, "<C-Up>", "<cmd>resize -2<cr>")

-- Clears hlsearch after doing a search with <cr>
vim.keymap.set("n", "<cr>", "{-> v:hlsearch ? ':nohl<cr>' : '<cr>'}()", { expr = true })

----
-- Normal Mode Mappings
----

vim.keymap.set("n", "Q", "<nop>", { desc = "Disable ex mode" })

vim.keymap.set("n", "<M-j>", ":m .+1<cr>==", { desc = "Move lines down" })
vim.keymap.set("n", "<M-k>", ":m .-2<cr>==", { desc = "Move lines up" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus buffer to the left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus buffer under" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus buffer above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus buffer to the right" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Concat lines" })

vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous match" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next match" })

-- Debug Controls
vim.keymap.set("n", "<F1>", "<cmd>lua require'dap'.step_back()<cr>", { desc = "Step into (Debug)" })
vim.keymap.set("n", "<F2>", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step into (Debug)" })
vim.keymap.set("n", "<F3>", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Step over (Debug)" })
vim.keymap.set("n", "<F4>", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Step out (Debug)" })
vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", { desc = "Continue (Debug)" })

vim.keymap.set("n", "]b", ":BufferLineCycleNext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "[b", ":BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })

----
-- Leader Mappings powered by whichkey
----
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
	["[d"] = "Previous diagnostic",
	["]d"] = "Next diagnostic",
	["[h"] = "Previous hunk",
	["]h"] = "Next hunk",
	["[p"] = "Previous paramater",
	["]p"] = "Next parameter",
	["[["] = "Previous class",
	["]["] = "Next class",
	["<leader>"] = {
		-- No group
		["/"] = {
			"<cmd>lua require('Comment.api').toggle_current_linewise()<cr>",
			"Comment Toggle",
		},
		["a"] = { "ggVG", "Select All" },
		["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
		["w"] = { "<cmd>w!<cr>", "Save" },
		["x"] = { "<cmd>!xdg-open %<cr><cr>", "Open file in the default app" },
		["y"] = { '"+y', "Yank to clipboard" },
		["Y"] = { '"+Y', "Yank line to clipboard" },

		-- Buffer group
		b = {
			name = "Buffer",
			["1"] = { "<cmd>BufferLineGoToBuffer 1<cr>", "Goto Buffer #1" },
			["2"] = { "<cmd>BufferLineGoToBuffer 2<cr>", "Goto Buffer #2" },
			["3"] = { "<cmd>BufferLineGoToBuffer 3<cr>", "Goto Buffer #3" },
			["4"] = { "<cmd>BufferLineGoToBuffer 4<cr>", "Goto Buffer #4" },
			["5"] = { "<cmd>BufferLineGoToBuffer 5<cr>", "Goto Buffer #5" },
			["c"] = { "<cmd>Telescope neoclip<cr>", "Clipboard" },
			["h"] = { "<cmd>BufferLineCloseLeft<cr>", "Close left" },
			["l"] = { "<cmd>BufferLineCloseRight<cr>", "Close right" },
			["p"] = { "<cmd>BufferLineTogglePin<cr>", "Pin" },
			["q"] = { "<cmd>bp|bd #<cr>", "Close" },
			["r"] = {
				":%s//gc<left><left><left>",
				"Replace All",
				silent = false,
			},
			["R"] = {
				":%s/<C-r><C-w>//gc<left><left><left>",
				"Replace All (Current Word)",
				silent = false,
			},
			["s"] = { "<cmd>Telescope buffers<cr>", "Search" },
			["u"] = { "<cmd>UndotreeToggle<cr>", "Undo Tree" },
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
			["i"] = { "<cmd>DIList", "Info" },
			["u"] = { "<cmd>lua require('refactoring').debug.cleanup({})<cr>", "Undo Prints" },
			["p"] = {
				"<cmd>lua require('refactoring').debug.printf({below = false})<cr>",
				"Print Function",
			},
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
			["I"] = { "<cmd>LspInstallInfo<cr>", "Installed" },
			["i"] = { "<cmd>LspInfo<cr>", "Info" },
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
			["S"] = {
				"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
				"Workspace Symbols",
			},
		},

		-- Marks group
		m = {
			name = "Marks",
			["a"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add" },
			["s"] = {
				"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
				"Search",
			},
			["u"] = {
				"<cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<cr>",
				"List terminal marks",
			},
			["1"] = {
				"<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
				"Navigate to mark #1",
			},
			["2"] = {
				"<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
				"Navigate to mark #2",
			},
			["3"] = {
				"<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
				"Navigate to mark #3",
			},
			["4"] = {
				"<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
				"Navigate to mark #4",
			},
		},

		-- Packer group
		p = {
			name = "Packer",
			["i"] = { "<cmd>PackerStatus<cr>", "Info" },
			["s"] = { "<cmd>PackerSync<cr>", "Sync" },
		},

		-- Search group
		s = {
			["."] = {
				'<cmd>lua require"dbvasconcelos.telescope".dotfiles()<cr>',
				"Dotfile",
			},
			name = "Search",
			["f"] = { "<cmd>Telescope find_files<cr>", "File" },
			["i"] = { "<cmd>Telescope media_files<cr>", "Image" },
			["M"] = { "<cmd>Telescope man_pages<cr>", "Man Page" },
			["r"] = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
			["t"] = { "<cmd>Telescope live_grep<cr>", "Text" },
			["w"] = {
				":lua require('telescope.builtin').grep_string({ search = <C-R>=expand('<cword>')<cr> })<cr>",
				"Current Word",
			},
		},

		-- Terminal group
		t = {
			name = "Terminal",
			["h"] = { "<cmd>ToggleTerm direction=horizontal<cr>", "Toggle Horizontal" },
			["v"] = { "<cmd>ToggleTerm direction=vertical<cr>", "Toggle Vertical" },
			["f"] = { "<cmd>ToggleTerm direction=float<cr>", "Toggle Float" },
		},

		-- Vim group
		v = {
			name = "Vim",
			["a"] = { "<cmd>Telescope autocommands", "Autocommands" },
			["c"] = { "<cmd>Telescope commands<cr>", "Commands" },
			["C"] = { "<cmd>Telescope command_history<cr>", "Command History" },
			["h"] = { ":h <C-R>=expand('<cword>')<cr><cr>", "Help (Word)" },
			["H"] = { "<cmd>Telescope help_tags<cr>", "Help Search" },
			["k"] = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
			["o"] = { "<cmd>Telescope options", "Options" },
			["s"] = { "<cmd>Telescope search_history", "Search History" },
		},
	},
}, { nowait = true })

-- Visual Mode
wk.register({
	["<leader>"] = {
		-- No group
		["/"] = {
			"<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>",
			"Comment Toggle",
		},
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
