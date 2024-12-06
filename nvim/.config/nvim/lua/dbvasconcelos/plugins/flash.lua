return {
	"folke/flash.nvim",
	opts = {
		mode = {
			search = {
				enabled = true,
			},
		},
	},
	keys = {
		{
			"s",
			mode = { "n", "x" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
	},
}
