return {
	"L3MON4D3/LuaSnip",
	dependencies = {
		"rafamadriz/friendly-snippets",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	opts = function()
		local types = require("luasnip.util.types")
		return {
			history = true,
			delete_check_events = "TextChanged",
			ext_opts = {
				[types.choiceNode] = {
					active = {
						virt_text = { { "<", "DiagnosticHint" } },
					},
				},
			},
		}
	end,
	--[[ keys = function()
		local ls = require("luasnip")
		return {
			{
				"<M-l>",
				function()
					if ls.choice_active() then
						ls.change_choice(1)
					end
				end,
				mode = { "i", "s" },
				desc = "Change snippet choice",
			},
		}
	end, ]]--
}
