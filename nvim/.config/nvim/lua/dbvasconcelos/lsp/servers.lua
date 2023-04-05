local M = {
	bash = { lsp = "bashls", config = true, },

	dockerfile = { lsp = "dockerls", config = true, },

	go = {
		lsp = "gopls",
		config = {
			settings = {
				gopls = {
					buildFlags = { "-tags=wireinject" },
				},
			},
		},
	},

	html = { lsp = "html", config = true, },

	json = { lsp = "jsonls", config = true, },

	lua = {
		lsp = "lua_ls",
		config = {
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
						library = vim.api.nvim_get_runtime_file("", true),
					},
				},
			},
		},
	},

	php = { lsp = "intelephense", config = true, },

	python = { lsp = "pyright", config = true },

	sh = { lsp = "bashls", config = true, },

	tex = { lsp = "texlab", config = true, },

	yaml = { lsp = "yamlls", config = true, },
}

return M
