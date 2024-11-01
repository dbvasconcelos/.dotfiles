return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
	},
	opts = function()
		local hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end

		-- branch component
		local branch = {
			"b:gitsigns_head",
			icon = "",
			separator = "",
			cond = hide_in_width,
		}

		-- diff component
		local diff = {
			"diff",
			symbols = { added = " ", modified = " ", removed = " " },
			diff_color = {
				added = { fg = "#6f8352" },
				modified = { fg = "#b47109" },
				removed = { fg = "#c14a4a" },
			},
			source = function()
				local gitsigns = vim.b.gitsigns_status_dict
				if gitsigns then
					return {
						added = gitsigns.added,
						modified = gitsigns.changed,
						removed = gitsigns.removed,
					}
				end
			end,
			cond = hide_in_width,
		}

		-- lsp diagnostics component
		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn" },
			symbols = { error = " ", warn = " " },
		}

		-- indentation component
		local indentation = {
			function()
				if not vim.bo.expandtab then
					return "⭾"
				else
					return "␣×" .. vim.bo.shiftwidth
				end
			end,
			cond = hide_in_width,
		}

		local filetype = {
			"filetype",
			icon_only = true,
			separator = "",
			padding = { left = 1, right = 0 },
		}

		-- encoding component
		local encoding = { "encoding", cond = hide_in_width }

		-- fileformat component
		local fileformat = { "fileformat", cond = hide_in_width }

		return {
			options = {
				theme = "gruvbox-flat",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { branch, diff },
				lualine_c = { filetype, "filename" },
				lualine_x = {
					diagnostics,
					encoding,
					fileformat,
					indentation,
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			extensions = { "quickfix", "fugitive", "fzf", "nvim-tree", "toggleterm" },
		}
	end,
}
