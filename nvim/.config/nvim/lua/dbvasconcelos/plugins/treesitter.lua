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
