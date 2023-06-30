return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	opts = {
		ensure_installed = {
			"bash",
			"dockerfile",
			"go",
			"gomod",
			"lua",
			"make",
			"proto",
			"regex",
			"yaml",
		},

		highlight = { enable = true },
		indent = { enable = true },
		context_commentstring = { enable = true, enable_autocmd = false },
		autopairs = { enable = true },

		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",

					["ac"] = "@conditional.outer",
					["ic"] = "@conditional.inner",

					["aa"] = "@parameter.outer",
					["ia"] = "@parameter.inner",
				},
			},

			move = {
				enable = true,
				set_jumps = true,

				goto_next_start = {
					["]p"] = "@parameter.inner",
					["]m"] = "@function.outer",
					["]]"] = "@class.outer",
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[p"] = "@parameter.inner",
					["[m"] = "@function.outer",
					["[["] = "@class.outer",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
					["[]"] = "@class.outer",
				},
			},

			swap = {
				enable = true,
				swap_next = {
					["<M-l>"] = "@parameter.inner",
				},
				swap_previous = {
					["<M-h>"] = "@parameter.inner",
				},
			},
		},
	},
}
