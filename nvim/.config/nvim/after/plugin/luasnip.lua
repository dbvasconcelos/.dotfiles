local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "<", "DiagnosticHint" } },
			},
		},
	},
})

vim.keymap.set({ "i", "s" }, "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

require("luasnip.loaders.from_vscode").lazy_load()
