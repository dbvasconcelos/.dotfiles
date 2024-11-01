return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "folke/which-key.nvim" },
	},
	opts = {
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "┃" },
		},
		preview_config = {
			border = "rounded",
		},
		on_attach = function(bufnr)
			require("which-key").add({
				{ "<leader>h", group = "Hunks" },
			})

			local gs = package.loaded.gitsigns

			vim.keymap.set("n", "]h", function()
				if vim.wo.diff then
					return "]h"
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return "<Ignore>"
			end, { desc = "Next Hunk", expr = true, buffer = bufnr })

			vim.keymap.set("n", "[h", function()
				if vim.wo.diff then
					return "[h"
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return "<Ignore>"
			end, { desc = "Previous Hunk", expr = true, buffer = bufnr })

			vim.keymap.set(
				{ "o", "x" },
				"ih",
				":<C-U>Gitsigns select_hunk<CR>",
				{ desc = "Inside Hunk", buffer = bufnr }
			)

			vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "Stage Hunk", buffer = bufnr })
			vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "Reset Hunk", buffer = bufnr })
			vim.keymap.set("v", "<leader>hs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Stage Hunk", buffer = bufnr })
			vim.keymap.set("v", "<leader>hr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Reset Hunk", buffer = bufnr })
			vim.keymap.set("n", "<leader>hS", gs.stage_buffer, { desc = "Stage Buffer", buffer = bufnr })
			vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk", buffer = bufnr })
			vim.keymap.set("n", "<leader>hR", gs.reset_buffer, { desc = "Reset Buffer", buffer = bufnr })
			vim.keymap.set("n", "<leader>hk", gs.preview_hunk, { desc = "Preview Hunk", buffer = bufnr })
			vim.keymap.set("n", "<leader>hd", gs.diffthis, { desc = "Diff Hunk", buffer = bufnr })
			vim.keymap.set("n", "<leader>hD", function()
				gs.diffthis("~")
			end, { desc = "Diff Buffer", buffer = bufnr })
			vim.keymap.set("n", "<leader>gD", gs.toggle_deleted)
		end,
	},
}
