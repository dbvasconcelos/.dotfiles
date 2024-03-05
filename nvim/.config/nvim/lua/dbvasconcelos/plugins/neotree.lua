return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
	},
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "File Tree" },
	},
	opts = {
		window = {
			mappings = {
				["l"] = "open",
				["h"] = "close_node",
			},
		},
	},
}
