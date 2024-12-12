local M = {
	-- Bash
	sh = {
		lsp = "bashls",
		formatter = "shfmt",
		linter = "shellcheck",
	},
	-- Docker
	dockerfile = {
		lsp = "dockerls",
		linter = "hadolint",
	},
	-- Golang
	go = {
		lsp = "gopls",
		config = {
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
						shadow = true,
					},
					buildFlags = { "-tags=wireinject" },
					experimentalPostfixCompletions = true,
					staticcheck = true,
				},
			},
			init_options = {
				usePlaceholders = true,
			},
		},
		formatter = "golines",
		linter = "golangci-lint",
		debugger = "delve",
	},
	-- Hyprlang
	hyprlang = {
		lsp = "hyprls",
	},
	-- Java
	java = {
		lsp = "jdtls",
	},
	-- JSON
	json = {
		lsp = "jsonls",
		formatter = "prettier",
	},
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
						globals = { "vim", "Snacks" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.env.VIMRUNTIME,
						checkThirdParty = false,
					},
				},
			},
		},
		formatter = "stylua",
		linter = "luacheck",
	},
	-- Python
	python = {
		lsp = "pyright",
	},
	-- TOML
	toml = {
		lsp = "taplo",
	},
	-- YAML
	yaml = {
		lsp = "yamlls",
		formatter = "prettier",
	},
}

return M
