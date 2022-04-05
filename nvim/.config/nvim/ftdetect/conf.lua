local group = vim.api.nvim_create_augroup("confDetect", { clear = true })
vim.api.nvim_create_autocmd(
	"BufReadPost",
	{ pattern = { "config", "conf" }, command = "set filetype=conf", group = group }
)
