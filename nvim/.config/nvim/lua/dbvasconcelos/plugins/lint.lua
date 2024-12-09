return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			local linters = {}
			local languages = require("dbvasconcelos.plugins.lspconfig.lang")
			for ft, lang in pairs(languages) do
				if lang.linter then
					linters[ft] = { lang.linter }
				end
			end
			require("lint").linters_by_ft = linters
		end,
	},
}
