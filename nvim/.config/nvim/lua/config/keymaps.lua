local keymap = vim.keymap.set

-- Resize
keymap({ "t", "n" }, "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap({ "t", "n" }, "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap({ "t", "n" }, "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
keymap({ "t", "n" }, "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })

-- Move lines
keymap("i", "<M-j>", "<esc><cmd>m .+1<CR>==gi", { desc = "Move line down" })
keymap("i", "<M-k>", "<esc><cmd>m .-2<CR>==gi", { desc = "Move line up" })
keymap("v", "<M-j>", ":m '>+1<cr>gv=gv", { desc = "Move lines down" })
keymap("v", "<M-k>", ":m '<-2<cr>gv=gv", { desc = "Move lines up" })
keymap("n", "<M-j>", ":m .+1<cr>==", { desc = "Move line down" })
keymap("n", "<M-k>", ":m .-2<cr>==", { desc = "Move line up" })

-- Window Navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Focus left window", remap = true })
keymap("n", "<C-j>", "<C-w>j", { desc = "Focus below window", remap = true })
keymap("n", "<C-k>", "<C-w>k", { desc = "Focus above window", remap = true })
keymap("n", "<C-l>", "<C-w>l", { desc = "Focus right window", remap = true })

-- Indentation
keymap("v", "<", "<gv", { desc = "Indent left" })
keymap("v", ">", ">gv", { desc = "Indent right" })

-- Buffer Navigation
keymap("n", "n", "nzzzv", { desc = "Next match" })
keymap("n", "N", "Nzzzv", { desc = "Previous match" })
keymap("n", "<C-d>", "<C-d>zz", { desc = "Page down" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Page up" })

-- Clipboard
keymap("x", "p", [["_dP]], { desc = "Blackhole paste" })
keymap("x", "c", [["_c]], { desc = "Blackhole change" })
keymap({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy selection to clipboard" })
keymap("n", "<leader>Y", [["+Y]], { desc = "Copy line to clipboard" })

-- Buffer Operations
keymap("c", "w!!", "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!", { desc = "Save file as sudo" })
keymap("n", "J", "mzJ`z", { desc = "Concat lines" })
keymap("n", "Q", "<nop>", { desc = "Disable ex mode" })
keymap("n", "<esc>", "<cmd>nohlsearch<cr><esc>", { desc = "Clear highlights" })
keymap("n", "<leader>w", ":w<cr>", { desc = "Write File" })
keymap("n", "<leader>o", "mzo<Esc>`z", { desc = "New Line Below" })
keymap("n", "<leader>O", "mzO<Esc>`z", { desc = "New Line Above" })

-- Undo Breakpoints
keymap("i", ",", ",<c-g>u")
keymap("i", ".", ".<c-g>u")
keymap("i", ";", ";<c-g>u")
