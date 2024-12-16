local M = {
	-- Bash
	sh = {
		lsp = "bashls",
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
		},
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
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
					experimentalPostfixCompletions = true,
					staticcheck = true,
				},
			},
			init_options = {
				usePlaceholders = true,
			},
		},
		formatters = { "golines", "goimports" },
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
		formatters = { "prettier" },
	},
	-- Lua
	lua = {
		lsp = "lua_ls",
		formatters = { "stylua" },
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
		formatters = { "prettier" },
	},
}

return M
