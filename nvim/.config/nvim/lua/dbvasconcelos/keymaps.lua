local keymap = vim.keymap

-- Resize
keymap.set({ "t", "n" }, "<C-Down>", "<cmd>resize -2<cr>", { desc = "- size vert" })
keymap.set({ "t", "n" }, "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "- size horz" })
keymap.set({ "t", "n" }, "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "+ size horz" })
keymap.set({ "t", "n" }, "<C-Up>", "<cmd>resize +2<cr>", { desc = "+ size vert" })

-- Move lines
keymap.set("i", "<M-j>", "<esc><cmd>m .+1<CR>==gi", { desc = "Move line down" })
keymap.set("i", "<M-k>", "<esc><cmd>m .-2<CR>==gi", { desc = "Move line up" })
keymap.set("v", "<M-j>", ":m '>+1<cr>gv=gv", { desc = "Move lines down" })
keymap.set("v", "<M-k>", ":m '<-2<cr>gv=gv", { desc = "Move lines up" })
keymap.set("n", "<M-j>", ":m .+1<cr>==", { desc = "Move line down" })
keymap.set("n", "<M-k>", ":m .-2<cr>==", { desc = "Move line up" })

-- Cmd mode cursor
keymap.set("c", "<C-b>", "<S-Left>", { desc = "Move cursor word backwards" })
keymap.set("c", "<C-e>", "<S-Right>", { desc = "Move cursor word forward" })
keymap.set("c", "<C-h>", "<Left>", { desc = "Move cursor left" })
keymap.set("c", "<C-l>", "<Right>", { desc = "Move cursor right" })
keymap.set("c", "<C-n>", "<Down>", { desc = "Next command" })
keymap.set("c", "<C-p>", "<Up>", { desc = "Previous command" })

-- Windows
keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Focus left window" })
keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Focus right window" })
keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Focus above window" })
keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Focus below window" })
keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Leave terminal mode" })
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus below window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus above window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus right window" })

-- Indentation
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Buffer Navigation
keymap.set("n", "n", "nzzzv", { desc = "Next match" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous match" })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Move Down", expr = true, silent = true })
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Move Up" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page down" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page up" })

-- Clipboard
keymap.set("x", "p", [["_dP]], { desc = "Blackhole paste" })
keymap.set("x", "c", [["_c]], { desc = "Blackhole change" })
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy selection to clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to clipboard" })

-- Buffer Operations
keymap.set("c", "w!!", "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!", { desc = "Save file as sudo" })
keymap.set("n", "J", "mzJ`z", { desc = "Concat lines" })
keymap.set("n", "Q", "<nop>", { desc = "Disable ex mode" })
keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>", { desc = "Clear highlights" })
keymap.set("n", "<leader>w", ":w<cr>", { desc = "Write File" })
keymap.set("n", "<leader>o", "mzo<Esc>`z", { desc = "New Line Below" })
keymap.set("n", "<leader>O", "mzO<Esc>`z", { desc = "New Line Above" })
