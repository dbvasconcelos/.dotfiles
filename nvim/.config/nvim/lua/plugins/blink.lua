return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		}
	},
	version = "1.*",
	opts = {
		completion = {
			documentation = {
				auto_show = true,
			}
		},
		snippets = { preset = "luasnip" },
		signature = {
			enabled = true,
		}
	},
}
