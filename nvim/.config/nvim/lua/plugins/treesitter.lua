return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		init = function()
			require("nvim-treesitter").install({
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
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = false,
		branch = "main",
		init = function()
			-- Disable entire built-in ftplugin mappings to avoid conflicts.
			-- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
			vim.g.no_plugin_maps = true
		end,
		keys = {
			{
				"<M-l>",
				function()
					require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
				end,
				desc = "Close Buffer",
			},
			{
				"<M-h>",
				function()
					require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
				end,
				desc = "Close Buffer",
			},
		},
	},
}
