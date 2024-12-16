return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = function()
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		return {
			enable_check_bracket_line = false,
			check_ts = true,
			fast_wrap = {},
		}
	end,
}
