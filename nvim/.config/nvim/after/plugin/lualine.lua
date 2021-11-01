local colors = require("gruvbox.colors").setup(require("gruvbox.config"))

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

-- git diff component
local diff = {
    "diff",
    source = diff_source,
    symbols = {added = "  ", modified = "柳", removed = " "},
    diff_color = {
        added = { fg = colors.git.add },
        modified = { fg = colors.git.change },
        removed = { fg = colors.git.delete },
    },
}

-- lsp diagnostics component
local diagnostics = {
    "diagnostics",
    sources = {"nvim_lsp"},
    -- displays diagnostics from defined severity
    sections = {'error', 'warn', 'info', 'hint'},
    symbols = {error = " ", warn = " ", info = " ", hint = " "},
    separator = "|"
}

-- encoding component
local encoding = {"encoding", separator = "|"}

-- fileformat component
local fileformat = {"fileformat", separator = "|" }

require("lualine").setup({
    options = {theme = "gruvbox-flat"},
    sections = {
        lualine_a = {"mode"},
        lualine_b = {{"b:gitsigns_head", icon = '', separator=""}, diff},
        lualine_c = {"filename"},
        lualine_x = {diagnostics, encoding, fileformat, "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location"},
    },
    extensions = {"quickfix", "fugitive", "fzf", "nvim-tree"},
})
