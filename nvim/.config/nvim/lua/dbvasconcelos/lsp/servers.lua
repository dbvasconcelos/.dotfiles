local M = {}

M.servers = {
    go = {
        server = "go",
        lsp = {
            settings = {gopls = {codelenses = {test = true}}},
            flags = {debounce_text_changes = 200},
        },
    },

    cpp = {
        server = "clangd",
        lsp = {
            cmd = {
                "clangd", "--background-index", "--suggest-missing-includes",
                "--clang-tidy", "--header-insertion=iwyu",
            },
        },
        formatter = {
            exe = "clang-format",
            args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
            stdin = true,
            cwd = vim.fn.expand('%:p:h'), -- Run clang-format in cwd of the file.
        },
    },

    lua = {
        server = "lua",
        lsp = {
            settings = {
                Lua = {
                    runtime = {
                        -- LuaJIT in the case of Neovim
                        version = 'LuaJIT',
                        path = vim.split(package.path, ';'),
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = {'vim'},
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = {
                            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                        },
                    },
                },
            },
        },
        formatter = {
            exe = "lua-format",
            args = {"--extra-sep-at-table-end"},
            stdin = true,
        },
    },

    php = {server = "php", lsp = true},

    vim = {server = "vim", lsp = true},

    bash = {server = "bash", lsp = true},

    sh = {server = "bash", lsp = true},

    html = {server = "html", lsp = true},

    json = {server = "json", lsp = true},

    dockerfile = {server = "dockerfile", lsp = true},
}

return M
