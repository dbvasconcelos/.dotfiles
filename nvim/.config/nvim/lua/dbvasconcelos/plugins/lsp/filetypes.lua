local M = {
	dockerfile = {
		lsp = "dockerls",
		linter = "hadolint",
	},
	go = {
		lsp = "gopls",
		config = {
			settings = {
				gopls = {
					buildFlags = { "-tags=wireinject" },
				},
			},
		},
		formatter = "goimports",
		linter = "golangci-lint",
		debugger = "delve",
	},
	json = {
		lsp = "jsonls",
		formatter = "prettier",
	},
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
						checkThirdParty = false,
					},
				},
			},
		},
		formatter = "stylua",
		linter = "luacheck",
	},
	python = {
		lsp = "pyright",
	},
	sh = {
		lsp = "bashls",
		formatter = "shfmt",
		linter = "shellcheck",
	},
	yaml = {
		lsp = "yamlls",
		formatter = "prettier",
	},
}

return M
