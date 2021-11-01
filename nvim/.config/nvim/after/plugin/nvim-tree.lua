vim.g.nvim_tree_ignore = {".git", "node_modules", ".cache"} -- empty by default
vim.g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_group_empty = 1 -- 0 by default, compact folders that only contain a single folder into one node in the file tree

vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        unstaged = "",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "",
        deleted = "✗",
        ignored = "◌",
    },
    folder = {
        arrow_open = "",
        arrow_closed = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = "",
    },
    lsp = {hint = "", info = "", warning = "", error = ""},
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require"nvim-tree".setup {
    -- closes neovim automatically when the tree is the last **WINDOW** in the view
    auto_close = true,
    -- will not open on setup if the filetype is in this list
    ignore_ft_on_setup = {"packer"},
    -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
    update_focused_file = {
        enable = true,
    },
    diagnostics = {
        enable = true,
    },
    view = {
        width = 40,
        auto_resize = true,
        mappings = {
            list = {
                {key = "l", cb = tree_cb("edit")},
                {key = "h", cb = tree_cb("close_node")},
                {key = "v", cb = tree_cb("vsplit")},
            },
        },
    },
}
