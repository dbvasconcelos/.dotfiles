return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		opts = function()
			local ret = {
				formatters = {},
				formatters_by_ft = {},
				format_on_save = {
					lsp_format = "fallback",
				},
			}
			local languages = require("dbvasconcelos.plugins.lsp.lang")
			for ft, lang in pairs(languages) do
				if lang.formatters then
					ret.formatters_by_ft[ft] = {}
					for fmt, conf in pairs(lang.formatters) do
						if type(conf) == "table" then
							table.insert(ret.formatters_by_ft[ft], fmt)
							ret.formatters[fmt] = conf
						else
							table.insert(ret.formatters_by_ft[ft], conf)
						end
					end
				end
			end
			return ret
		end,
	},
}
