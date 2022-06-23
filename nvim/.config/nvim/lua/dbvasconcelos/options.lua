local opt = vim.opt

opt.cmdheight = 1
opt.colorcolumn = "100"
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.guifont = "monospace:h17"
opt.ignorecase = true
opt.isfname:append("@-@")
opt.list = true
opt.listchars = {
	eol = "↲",
	tab = "» ",
	trail = "·",
}
opt.mouse = "a"
opt.number = true
opt.pumheight = 10
opt.relativenumber = true
opt.scrolloff = 8
opt.shiftwidth = 4
opt.showmatch = true
opt.showmode = false
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.spelllang = { "en_us" }
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 4
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 4
opt.title = true
opt.undofile = true
opt.updatetime = 50
opt.wrap = false
