return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	event = "VimEnter",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	opts = function()
		require("telescope").load_extension("fzf")
	end,
}
