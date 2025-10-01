local opt = vim.opt

opt.colorcolumn = "100"
opt.confirm = true
opt.cursorline = true
opt.ignorecase = true
opt.inccommand = "split"
opt.isfname:append("@-@")
opt.list = true
opt.listchars = { eol = "↲", nbsp = "␣", tab = "» ", trail = "·" }
opt.mouse = "a"
opt.number = true
opt.pumheight = 10
opt.relativenumber = true
opt.shortmess:append("c")
opt.showmatch = true
opt.showmode = false
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 4
opt.termguicolors = true
opt.timeoutlen = 300
opt.title = true
opt.undofile = true
opt.updatetime = 250
opt.winborder = "rounded"
opt.wrap = false
