local opt = vim.opt

-- Number of spaces that a <Tab> in the file counts for
opt.tabstop = 4

-- Number of spaces that a <Tab> counts for while performing editing operations
opt.softtabstop = 4

-- Number of spaces to use for each step of (auto)indent
opt.shiftwidth = 4

-- Expand tabs into spaces
opt.expandtab = true

-- Show line number
opt.number = true

-- Show the relative line number for each line
opt.relativenumber = true

-- Show (partial) command keys in the status line
opt.showcmd = true

-- Do not show mode
opt.showmode = false

-- Highlight matching bracket
opt.showmatch = true

-- Highlight the screen line of the cursor
opt.cursorline = true

-- No Line wrapping
opt.wrap = false

-- Ignore case in search patterns
opt.ignorecase = true

-- Override the 'ignorecase' option if the search pattern contains upper case characters
opt.smartcase = true

-- Allows loading a buffer in a window that currently has a modified buffer
opt.hidden = true

-- Enables mouse in all modes.
opt.mouse = 'a'

-- Keep lines under cursor when scrolling
opt.scrolloff = 8

-- Always show the signcolumn to avoid shifting
opt.signcolumn = 'yes'

-- A new window is put below the current one
opt.splitbelow = true

-- A new window is put right of the current one
opt.splitright = true

-- Updates CursorHold trigger faster
opt.updatetime = 50

-- Automatically save and restore undo history
opt.undofile = true

-- Number of screen lines to use for the command-line
opt.cmdheight = 1

-- Auto Indent
opt.smartindent = true

-- Always use the clipboard for ALL operations
opt.clipboard = {'unnamed', 'unnamedplus'}

-- Draw a line at the selected column
opt.colorcolumn = "100"

-- No backup
opt.backup = false

-- No swap
opt.swapfile = false

-- Auto reload
opt.autoread = true

-- Enables pseudo-transparency for the |popup-menu|
opt.pumblend = 17

-- Smaller popup menu
opt.pumheight = 10

-- Keymap timeout
opt.timeoutlen = 300

-- Don't ring the bell
opt.belloff = 'all'
