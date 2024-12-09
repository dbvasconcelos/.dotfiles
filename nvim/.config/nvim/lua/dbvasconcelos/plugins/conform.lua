return {
	{
		"stevearc/conform.nvim",
		opts = function()
			local formatters = {}
			local languages = require("dbvasconcelos.plugins.lspconfig.lang")
			for ft, lang in pairs(languages) do
				if lang.formatter then
					formatters[ft] = { lang.formatter }
				end
			end
			return {
				formatters_by_ft = formatters,
				format_on_save = {
					lsp_format = "fallback",
				},
			}
		end,
	},
}
