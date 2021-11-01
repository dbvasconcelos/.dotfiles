local wk = require("which-key")

wk.setup({
    plugins = {
        presets = {
            operators = false, -- no help for operators like d, y, ...
            motions = false, -- no help for motions
            text_objects = false, -- no help for text objects triggered after entering an operator
        },
        spelling = {enabled = true, suggestions = 20},
    },
})

wk.register({
    ["<C-s>"] = {"<cmd>w!<CR>", "Save"},
    ["<leader>"] = {
        ["/"] = {"<cmd>CommentToggle<cr>", "Comment Toggle"},
        ["e"] = {"<cmd>NvimTreeToggle<CR>", "Explorer"},
        -- Buffer Group
        b = {name = "Buffer", ["q"] = {"<cmd>bp|bd #<cr>", "Close"}},
        -- Git
        g = {
            name = "Git",
            a = {"<cmd>Git fetch --all<CR>", "Fetch"},
            b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
            c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
            C = {
                "<cmd>Telescope git_bcommits<cr>",
                "Checkout commit(for current file)",
            },
            g = {"<cmd>diffget //2<CR>", "Pick left change"},
            h = {"<cmd>diffget //3<CR>", "Pick right change"},
            j = {"<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk"},
            k = {"<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk"},
            l = {"<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame"},
            o = {"<cmd>Telescope git_status<cr>", "Open changed file"},
            p = {
                "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
                "Preview Hunk",
            },
            r = {"<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk"},
            R = {
                "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
                "Reset Buffer",
            },
            s = {"<cmd>G<cr>", "Status"},
            S = {"<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk"},
            u = {
                "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
                "Undo Stage Hunk",
            },
        },
        -- LSP Group
        l = {
            name = 'LSP',
            ["a"] = {"<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action"},
            ["d"] = {
                "<cmd>Telescope lsp_document_diagnostics<cr>",
                "Document Diagnostics",
            },
            ["f"] = {"<cmd>Format<cr>", "Format"},
            ["i"] = {"<cmd>LspInfo<cr>", "Info"},
            ["j"] = {
                "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = 'single'}})<cr>",
                "Next Diagnostic",
            },
            ["k"] = {
                "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = 'single'}})<cr>",
                "Prev Diagnostic",
            },
            ["q"] = {"<cmd>Telescope quickfix<cr>", "Quickfix"},
            ["r"] = {"<cmd>lua vim.lsp.buf.rename()<cr>", "Rename"},
            ["s"] = {
                "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols",
            },
            ["S"] = {
                "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
                "Workspace Symbols",
            },
            ["w"] = {
                "<cmd>Telescope lsp_workspace_diagnostics<cr>",
                "Workspace Diagnostics",
            },
        },
        -- Marks group
        m = {
            name = "Marks",
            ["a"] = {
                "<cmd>lua require('harpoon.mark').add_file()<CR>", "Add Mark",
            },
            ["f"] = {
                "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
                "List file marks",
            },
            ["u"] = {
                "<cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>",
                "List terminal marks",
            },
            ["1"] = {
                "<cmd>lua require('harpoon.ui').nav_file(1)<CR>",
                "Navigate to mark #1",
            },
            ["2"] = {
                "<cmd>lua require('harpoon.ui').nav_file(2)<CR>",
                "Navigate to mark #2",
            },
            ["3"] = {
                "<cmd>lua require('harpoon.ui').nav_file(3)<CR>",
                "Navigate to mark #3",
            },
            ["4"] = {
                "<cmd>lua require('harpoon.ui').nav_file(3)<CR>",
                "Navigate to mark #4",
            },
        },
        -- Packer Group
        p = {
            name = "Packer",
            ["i"] = {"<cmd>PackerInstall<cr>", "Install"},
            ["s"] = {"<cmd>PackerSync<cr>", "Sync"},
            ["u"] = {"<cmd>PackerUpdate<cr>", "Update"},
        },
        -- Refactoring
        r = {
            '<cmd>lua require"dbvasconcelos.telescope".refactors()<cr>',
            'Refactor',
        },
        -- Search Group
        s = {
            name = 'Search',
            ['.'] = {
                '<cmd>lua require"dbvasconcelos.telescope".dotfiles()<cr>',
                'Dotfile',
            },
            ["b"] = {"<cmd>Telescope buffers<cr>", "Buffer"},
            ["c"] = {"<cmd>Telescope neoclip plus<cr>", "Clipboard"},
            ["C"] = {"<cmd>Telescope commands<cr>", "Commands"},
            ["f"] = {"<cmd>Telescope find_files<cr>", "File"},
            ["h"] = {"<cmd>Telescope help_tags<cr>", "Help"},
            ["k"] = {"<cmd>Telescope keymaps<cr>", "Keymaps"},
            ["M"] = {"<cmd>Telescope man_pages<cr>", "Man Page"},
            ["r"] = {"<cmd>Telescope oldfiles<cr>", "Recent File"},
            ["t"] = {"<cmd>Telescope live_grep<cr>", "Text"},
        },
    },
}, {nowait = true})

wk.register({
    ["<leader>"] = {
        -- Refactoring
        r = {
            '<cmd>lua require"dbvasconcelos.telescope".refactors()<cr>',
            'Refactor',
        },
        -- Commenting
        ["/"] = {":CommentToggle<CR>", "Comment Toggle"},
    },
}, {mode = "v", nowait = true})
