local keymap = vim.keymap

-- Resize
keymap.set({ "t", "n" }, "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap.set({ "t", "n" }, "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap.set({ "t", "n" }, "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
keymap.set({ "t", "n" }, "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })

-- Move lines
keymap.set("i", "<M-j>", "<esc><cmd>m .+1<CR>==gi", { desc = "Move line down" })
keymap.set("i", "<M-k>", "<esc><cmd>m .-2<CR>==gi", { desc = "Move line up" })
keymap.set("v", "<M-j>", ":m '>+1<cr>gv=gv", { desc = "Move lines down" })
keymap.set("v", "<M-k>", ":m '<-2<cr>gv=gv", { desc = "Move lines up" })
keymap.set("n", "<M-j>", ":m .+1<cr>==", { desc = "Move line down" })
keymap.set("n", "<M-k>", ":m .-2<cr>==", { desc = "Move line up" })

-- Windows
keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Focus left window", remap = true })
keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Focus right window", remap = true })
keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Focus above window", remap = true })
keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Focus below window", remap = true })
keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Leave terminal mode", remap = true })
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus left window", remap = true })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus below window", remap = true })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus above window", remap = true })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus right window", remap = true })

-- Indentation
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Buffer Navigation
keymap.set("n", "n", "nzzzv", { desc = "Next match" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous match" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page down" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page up" })
keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Move Down", expr = true, silent = true })
keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Move Up" })

-- Clipboard
keymap.set("x", "p", [["_dP]], { desc = "Blackhole paste" })
keymap.set("x", "c", [["_c]], { desc = "Blackhole change" })
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy selection to clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to clipboard" })

-- Buffer Operations
keymap.set("c", "w!!", "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!", { desc = "Save file as sudo" })
keymap.set("n", "J", "mzJ`z", { desc = "Concat lines" })
keymap.set("n", "Q", "<nop>", { desc = "Disable ex mode" })
keymap.set("n", "<esc>", "<cmd>nohlsearch<cr><esc>", { desc = "Clear highlights" })
keymap.set("n", "<leader>w", ":w<cr>", { desc = "Write File" })
keymap.set("n", "<leader>o", "mzo<Esc>`z", { desc = "New Line Below" })
keymap.set("n", "<leader>O", "mzO<Esc>`z", { desc = "New Line Above" })

-- Undo Breakpoints
keymap.set("i", ",", ",<c-g>u")
keymap.set("i", ".", ".<c-g>u")
keymap.set("i", ";", ";<c-g>u")
