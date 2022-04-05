local group = vim.api.nvim_create_augroup("dosiniDetect", { clear = true })
vim.api.nvim_create_autocmd(
	"BufReadPost",
	{ pattern = { "dunstrc" }, command = "set filetype=dosini", group = group }
)
