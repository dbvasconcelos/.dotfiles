return {
	{
		"windwp/nvim-autopairs",
		event = "VeryLazy",
		dependencies = {
			{ "hrsh7th/nvim-cmp" },
		},
		opts = function()
			-- Mapping <CR>
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
			return {
				-- treesitter integration
				check_ts = true,
				fast_wrap = {
					map = "<M-e>",
				},
			}
		end,
	},
}
