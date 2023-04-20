vim.keymap.set("x", "p", [["_dP]], { desc = "Blackhole paste" })
vim.keymap.set("v", "<M-j>", ":m '>+1<cr>gv=gv", { desc = "Move lines down" })
vim.keymap.set("v", "<M-k>", ":m '<-2<cr>gv=gv", { desc = "Move lines up" })
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })
vim.keymap.set("c", "<C-p>", "<Up>", { desc = "Previous command" })
vim.keymap.set("c", "<C-n>", "<Down>", { desc = "Next command" })
vim.keymap.set("c", "<C-h>", "<Left>", { desc = "Move cursor left" })
vim.keymap.set("c", "<C-l>", "<Right>", { desc = "Move cursor right" })
vim.keymap.set("c", "<C-b>", "<S-Left>", { desc = "Move cursor word backwards" })
vim.keymap.set("c", "<C-e>", "<S-Right>", { desc = "Move cursor word forward" })
vim.keymap.set(
	"c",
	"w!!",
	"execute 'silent! write !sudo tee % >/dev/null' <bar> edit!",
	{ desc = "Save file as sudo" }
)
vim.keymap.set("i", "<M-j>", "<esc><cmd>m .+1<CR>==gi", { desc = "Move line down" })
vim.keymap.set("i", "<M-k>", "<esc><cmd>m .-2<CR>==gi", { desc = "Move line up" })
vim.keymap.set("t", "<esc>", "<C-\\><C-n>", { desc = "Leave terminal mode" })
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Focus left window" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Focus right window" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Focus above window" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Focus below window" })
vim.keymap.set({ "t", "n" }, "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "- size horz" })
vim.keymap.set({ "t", "n" }, "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "+ size horz" })
vim.keymap.set({ "t", "n" }, "<C-Down>", "<cmd>resize -2<cr>", { desc = "- size vert" })
vim.keymap.set({ "t", "n" }, "<C-Up>", "<cmd>resize +2<cr>", { desc = "+ size vert" })
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable ex mode" })
vim.keymap.set(
	"n",
	"<cr>",
	"{-> v:hlsearch ? ':nohl<cr>' : '<cr>'}()",
	{ expr = true, desc = "Clear highlights" }
)
vim.keymap.set("n", "<M-j>", ":m .+1<cr>==", { desc = "Move line down" })
vim.keymap.set("n", "<M-k>", ":m .-2<cr>==", { desc = "Move line up" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus below window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus above window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus right window" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page up" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Concat lines" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous match" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next match" })
vim.keymap.set(
	"n",
	"j",
	"v:count == 0 ? 'gj' : 'j'",
	{ expr = true, silent = true, desc = "Move Down" }
)
vim.keymap.set(
	"n",
	"k",
	"v:count == 0 ? 'gk' : 'k'",
	{ expr = true, silent = true, desc = "Move Up" }
)
