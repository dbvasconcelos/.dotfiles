return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			delete = { text = "" },
			topdelete = { text = "" },
		},
		signs_staged = {
			delete = { text = "" },
			topdelete = { text = "" },
		},
		preview_config = {
			border = "rounded",
		},
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			vim.keymap.set("n", "]h", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]h", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end, { desc = "Next Hunk", expr = true, buffer = bufnr })

			vim.keymap.set("n", "[h", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[h", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, { desc = "Previous Hunk", expr = true, buffer = bufnr })

			vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>",
				{ desc = "Inside Hunk", buffer = bufnr })

			vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk,
				{ desc = "Stage Hunk", buffer = bufnr })

			vim.keymap.set("v", "<leader>hs",
				function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Stage Hunk", buffer = bufnr })

			vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk,
				{ desc = "Undo Stage Hunk", buffer = bufnr })

			vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk,
				{ desc = "Reset Hunk", buffer = bufnr })

			vim.keymap.set("v", "<leader>hr",
				function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Reset Hunk", buffer = bufnr })

			vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer,
				{ desc = "Stage Buffer", buffer = bufnr })

			vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer,
				{ desc = "Reset Buffer", buffer = bufnr })

			vim.keymap.set("n", "<leader>hk", gitsigns.preview_hunk,
				{ desc = "Preview Hunk", buffer = bufnr })

			vim.keymap.set("n", "<leader>hd", gitsigns.diffthis,
				{ desc = "Diff Hunk", buffer = bufnr })

			vim.keymap.set("n", "<leader>hD",
				function()
					gitsigns.diffthis("~")
				end, { desc = "Diff Buffer", buffer = bufnr })

			vim.keymap.set("n", "<leader>ht", gitsigns.toggle_deleted,
				{ desc = "Toggle Old Version in Buffer", buffer = bufnr })
		end,
	},
}
