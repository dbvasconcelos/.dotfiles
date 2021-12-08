local M = {}

M.servers = {
	go = {
		server = "gopls",
		lsp = {
			settings = { gopls = { codelenses = { test = true } } },
			flags = { debounce_text_changes = 200 },
		},
	},

	cpp = {
		server = "clangd",
		lsp = {
			cmd = {
				"clangd",
				"--background-index",
				"--suggest-missing-includes",
				"--clang-tidy",
				"--header-insertion=iwyu",
			},
		},
		formatter = {
			exe = "clang-format",
			args = { "--assume-filename", vim.api.nvim_buf_get_name(0) },
			stdin = true,
			cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file.
		},
	},

	lua = {
		server = "sumneko_lua",
		lsp = {
			settings = {
				Lua = {
					runtime = {
						-- LuaJIT in the case of Neovim
						version = "LuaJIT",
						path = vim.split(package.path, ";"),
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						},
					},
				},
			},
		},
		formatter = {
			exe = "stylua",
			args = { "--column-width 100" },
			stdin = false,
		},
	},

	php = { server = "intelephense", lsp = true },

	vim = { server = "vimls", lsp = true },

	bash = { server = "bashls", lsp = true },

	sh = { server = "bashls", lsp = true },

	html = { server = "html", lsp = true },

	json = { server = "jsonls", lsp = true },

	dockerfile = { server = "dockerls", lsp = true },
}

return M
