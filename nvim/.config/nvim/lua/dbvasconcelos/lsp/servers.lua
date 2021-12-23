local M = {}

M.servers = {
	go = {
		server = "gopls",
		lsp = {
			settings = { gopls = { codelenses = { test = true } } },
			flags = { debounce_text_changes = 200 },
		},
		linter = {
			"golangcilint",
		},
		callback = function(_)
			vim.cmd([[
                augroup lsp_golang
                    autocmd! BufwritePre <buffer>
                    autocmd BufwritePre <buffer> :lua vim.lsp.buf.formatting_sync()
                    autocmd BufwritePre <buffer> :lua require"dbvasconcelos.lsp.actions".organize_imports()
                augroup END
            ]])
		end,
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
		linter = {
			"clangtidy",
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
			args = {
				"--config-path " .. os.getenv("XDG_CONFIG_HOME") .. "/stylua/stylua.toml",
				"-",
			},
			stdin = true,
		},
		linter = {
			"luacheck",
		},
	},

	php = { server = "intelephense", lsp = true },

	vim = { server = "vimls", lsp = true, linter = { "vint" } },

	bash = {
		server = "bashls",
		lsp = true,
		formatter = { exe = "shfmt", args = { "-i", 2 }, stdin = true },
		linter = { "shellcheck" },
	},

	sh = {
		server = "bashls",
		lsp = true,
		formatter = { exe = "shfmt", args = { "-i", 2 }, stdin = true },
		linter = { "shellcheck" },
	},

	html = { server = "html", lsp = true },

	json = { server = "jsonls", lsp = true },

	dockerfile = { server = "dockerls", lsp = true },
}

return M
