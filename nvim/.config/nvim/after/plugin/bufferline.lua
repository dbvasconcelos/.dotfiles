require("bufferline").setup({
	options = {
		numbers = "none",
		diagnostics = "nvim_lsp",
		offsets = { { filetype = "NvimTree", text = "File Explorer" } },
		separator_style = "thin",
		sort_by = "id",
	},
})
