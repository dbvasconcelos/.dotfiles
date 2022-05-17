local M = {
	bash = {
		lsp = "bashls",
		config = true,
		formatter = {
			exe = "shfmt",
			args = { "-i", "2", "-ci" },
			stdin = true,
		},
		linters = {
			"shellcheck",
		},
	},

	dockerfile = {
		lsp = "dockerls",
		config = true,
		linters = {
			"hadolint",
		},
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
		linters = {
			"golangcilint",
		},
	},

	html = {
		lsp = "html",
		config = true,
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
		lsp = "jsonls",
		config = true,
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

	lua = {
		lsp = "sumneko_lua",
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
		formatter = {
			exe = "stylua",
			args = { "--config-path " .. vim.fn.expand("~/.config/stylua/stylua.toml"), "-" },
			stdin = true,
		},
		linters = {
			"luacheck",
		},
	},

	php = {
		lsp = "intelephense",

		config = true,
	},

	python = { lsp = "pyright", config = true },

	sh = {
		lsp = "bashls",
		config = true,
		formatter = {
			exe = "shfmt",
			args = { "-i", "2", "-ci" },
			stdin = true,
		},
		linters = {
			"shellcheck",
		},
	},

	yaml = {
		lsp = "yamlls",
		config = true,
		formatter = {
			exe = "prettier",
			args = {
				"--stdin-filepath",
				vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
			},
			stdin = true,
		},
	},
}

return M
