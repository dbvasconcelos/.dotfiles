local M = {
	go = {
		server_id = "gopls",
		lsp = {
			settings = {
				gopls = {
					buildFlags = { "-tags=wireinject" },
				},
			},
		},
		debugger = "go_delve",
		linters = {
			"golangcilint",
		},
	},

	lua = {
		server_id = "sumneko_lua",
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
						globals = { "vim", "package" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
				},
			},
		},
		formatter = {
			exe = "stylua",
			args = { "--config-path " .. vim.fn.expand("~/.config/stylua/stylua.toml"), "-" },
			stdin = true,
		},
		linters = {
			"luacheck",
		},
	},

	php = { server_id = "intelephense", lsp = true },

	vim = { server_id = "vimls", lsp = true },

	sh = {
		server_id = "bashls",
		lsp = true,
		formatter = {
			exe = "shfmt",
			args = { "-i", "2", "-ci" },
			stdin = true,
		},
		linters = {
			"shellcheck",
		},
	},

	bash = {
		server_id = "bashls",
		lsp = true,
		formatter = {
			exe = "shfmt",
			args = { "-i", "2", "-ci" },
			stdin = true,
		},
		linters = {
			"shellcheck",
		},
	},

	html = {
		server_id = "html",
		lsp = true,
		formatter = {
			exe = "prettier",
			args = {
				"--stdin-filepath",
				vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
			},
			stdin = true,
		},
	},

	json = {
		server_id = "jsonls",
		lsp = true,
		formatter = {
			exe = "prettier",
			args = {
				"--stdin-filepath",
				vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
				"--double-quote",
			},
			stdin = true,
		},
	},

	yaml = {
		server_id = "yamlls",
		lsp = true,
		formatter = {
			exe = "prettier",
			args = {
				"--stdin-filepath",
				vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
			},
			stdin = true,
		},
	},

	dockerfile = {
		server_id = "dockerls",
		lsp = true,
		linters = {
			"hadolint",
		},
	},
}

return M
