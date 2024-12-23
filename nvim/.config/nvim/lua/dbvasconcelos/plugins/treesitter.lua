return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"css",
				"csv",
				"dockerfile",
				"go",
				"gomod",
				"hyprlang",
				"java",
				"json",
				"lua",
				"make",
				"proto",
				"python",
				"regex",
				"toml",
				"yaml",
			},

			highlight = { enable = true },
			indent = { enable = true },

			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = { query = "@function.outer", desc = "Around Function" },
						["if"] = { query = "@function.inner", desc = "Inside Function" },

						["ac"] = { query = "@class.outer", desc = "Around Class" },
						["ic"] = { query = "@class.inner", desc = "Inside Class" },
					},
				},

				move = {
					enable = true,
					set_jumps = true,

					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
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
		})
	end,
}
