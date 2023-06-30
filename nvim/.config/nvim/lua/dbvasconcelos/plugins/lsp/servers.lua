local M = {
	-- Bash
	bash = {
		lsp = "bashls",
		config = true,
		formatter = "shfmt",
		linter = "shellcheck",
	},
	-- Docker
	dockerfile = {
		lsp = "dockerls",
		config = true,
		linter = "hadolint",
	},
	-- Golang
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
		linter = "golangci_lint",
		debugger = "delve",
	},
	-- HTML
	html = { lsp = "html", config = true },
	-- JSON
	json = { lsp = "jsonls", config = true },
	-- Lua
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
	php = { lsp = "intelephense", config = true },
	python = { lsp = "pyright", config = true },
	tex = { lsp = "texlab", config = true },
	yaml = { lsp = "yamlls", config = true },
}

return M
