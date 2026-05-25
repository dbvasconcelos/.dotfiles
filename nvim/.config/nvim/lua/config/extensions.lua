-- ui2
require("vim._core.ui2").enable()

-- Undo Tree
vim.cmd.packadd("nvim.undotree")
vim.keymap.set("n", "<leader>u", require("undotree").open, { desc = "Open Undo Tree" })

-- Diff Tool
vim.cmd.packadd("nvim.difftool")
