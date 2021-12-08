local wk = require("which-key")

wk.setup({
	plugins = {
		presets = {
			operators = false, -- no help for operators like d, y, ...
			motions = false, -- no help for motions
			text_objects = false, -- no help for text objects triggered after entering an operator
		},
		spelling = { enabled = true, suggestions = 20 },
	},
})

-- Normal Mode Mappings
wk.register({
	-- Without prefix
	["<C-Down>"] = { "<cmd>resize +2<cr>", "Grow Vertical" },
	["<C-Left>"] = { "<cmd>vertical resize -2<cr>", "Shrink Horizontal" },
	["<C-Right>"] = { "<cmd>vertical resize +2<cr>", "Grow Horizontal" },
	["<C-Up>"] = { "<cmd>resize -2<cr>", "Shrink Vertical" },
	["<C-h>"] = { "<C-w>h", "Focus window to the left" },
	["<C-j>"] = { "<C-w>j", "Focus window under" },
	["<C-k>"] = { "<C-w>k", "Focus window above" },
	["<C-l>"] = { "<C-w>l", "Focus window to the right" },
	["J"] = { "mzJ`z", "Concat next line" },
	["N"] = { "Nzzzv", "Previous" },
	["n"] = { "nzzzv", "Next" },
	["Y"] = { "y$", "Copy to the end of line" },

	-- Leader prefix
	["<leader>"] = {
		-- No group
		["/"] = { "<cmd>lua require('Comment').toggle()<cr>", "Comment Toggle" },
		["a"] = { "ggVG", "Select All" },
		["d"] = { '"_d', "Delete" },
		["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
		["w"] = { "<cmd>w!<cr>", "Save" },
		["x"] = { "<cmd>!xdg-open %<cr><cr>", "Open file in the default app" },
		["y"] = { '"+y', "Yank" },

		-- Buffer group
		b = {
			name = "Buffer",
			["q"] = { "<cmd>bp|bd #<cr>", "Close" },
			["r"] = {
				":%s/<C-r><C-w>//gc<left><left><left>",
				"Replace Word",
				silent = false,
			},
			["s"] = { "<cmd>Telescope buffers<cr>", "Search" },
		},

		-- Debug group
		D = { name = "Debug" },

		-- Git group
		g = {
			name = "Git",
			b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
			C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for file)" },
			f = { "<cmd>Git fetch --all<cr>", "Fetch" },
			g = { "<cmd>diffget //2<cr>", "Pick left change" },
			h = { "<cmd>diffget //3<cr>", "Pick right change" },
			j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
			k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
			l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
			o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
			p = {
				"<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
				"Preview Hunk",
			},
			r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
			R = {
				"<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
				"Reset Buffer",
			},
			s = { "<cmd>G<cr>", "Status" },
			S = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
			u = {
				"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
				"Undo Stage Hunk",
			},
		},

		-- LSP group
		l = {
			name = "LSP",
			["a"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
			["d"] = {
				"<cmd>Telescope lsp_document_diagnostics<cr>",
				"Document Diagnostics",
			},
			["f"] = { "<cmd>Format<cr>", "Format" },
			["i"] = { "<cmd>LspInfo<cr>", "Info" },
			["j"] = {
				"<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = 'single'}})<cr>",
				"Next Diagnostic",
			},
			["k"] = {
				"<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = 'single'}})<cr>",
				"Prev Diagnostic",
			},
			["q"] = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
			["r"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
			["s"] = {
				"<cmd>Telescope lsp_document_symbols<cr>",
				"Document Symbols",
			},
			["S"] = {
				"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
				"Workspace Symbols",
			},
			["w"] = {
				"<cmd>Telescope lsp_workspace_diagnostics<cr>",
				"Workspace Diagnostics",
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
		p = { name = "Packer", ["s"] = { "<cmd>PackerSync<cr>", "Sync" } },

		-- Search group
		s = {
			name = "Search",
			["."] = {
				'<cmd>lua require"dbvasconcelos.telescope".dotfiles()<cr>',
				"Dotfile",
			},
			["c"] = { "<cmd>Telescope neoclip plus<cr>", "Clipboard" },
			["f"] = { "<cmd>Telescope find_files<cr>", "File" },
			["M"] = { "<cmd>Telescope man_pages<cr>", "Man Page" },
			["r"] = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
			["t"] = { "<cmd>Telescope live_grep<cr>", "Text" },
			["w"] = {
				":lua require('telescope.builtin').grep_string({ search = <C-R>=expand('<cword>')<cr> })<cr>",
				"Current Word",
			},
		},

		-- Vim group
		v = {
			name = "Vim",
			["C"] = { "<cmd>Telescope commands<cr>", "Commands" },
			["H"] = { ":h <C-R>=expand('<cword>')<cr><cr>", "Help (Word)" },
			["h"] = { "<cmd>Telescope help_tags<cr>", "Help Search" },
			["k"] = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		},
	},
}, { nowait = true })

-- Visual Mode Mappings
wk.register({
	-- No prefix
	["J"] = { ":m '>+1<cr>gv=gv", "Move down" },
	["K"] = { ":m '<-2<cr>gv=gv", "Move up" },
	["<"] = { "<gv", "Indent back" },
	[">"] = { ">gv", "Indent forward" },

	-- Leader prefix
	["<leader>"] = {
		-- No group
		["/"] = {
			"<esc><cmd>lua require('Comment.api').gc(vim.fn.visualmode())<cr>",
			"Comment Toggle",
		},
		["p"] = { '"_dP', "Paste" },
		["y"] = { '"+y', "Yank" },
	},
}, { mode = "v", nowait = true })

-- Save file as sudo on files that require root permission
vim.cmd("cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!")

vim.cmd("cnoremap <C-p> <Up>")
vim.cmd("cnoremap <C-n> <Down>")
vim.cmd("cnoremap <C-h> <Left>")
vim.cmd("cnoremap <C-l> <Right>")
vim.cmd("cnoremap <C-b> <S-Left>")
vim.cmd("cnoremap <C-e> <S-Right>")

-- Esc leaves terminal mode
vim.cmd("tnoremap <esc> <C-\\><C-N>")

-- Terminal Navigation with Ctrl + vimkeys
vim.cmd("tnoremap <C-h> <C-\\><C-N><C-w>h")
vim.cmd("tnoremap <C-j> <C-\\><C-N><C-w>j")
vim.cmd("tnoremap <C-k> <C-\\><C-N><C-w>k")
vim.cmd("tnoremap <C-l> <C-\\><C-N><C-w>l")

-- <Enter> Clears hlsearch after doing a search
vim.cmd("nnoremap <expr> <cr> {-> v:hlsearch ? ':nohl<cr>' : '<cr>'}()")

-- Disable ex mode
vim.cmd("map Q <nop>")

-- Allow gf to open non-existent files
vim.cmd("map gf :edit <cfile><cr>")
