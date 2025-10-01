return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{
			"letieu/harpoon-lualine",
			dependencies = { { "ThePrimeagen/harpoon", branch = "harpoon2" } },
		},
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
		}

		-- diff component
		local diff = {
			"diff",
			symbols = { added = " ", modified = " ", removed = " " },
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

		local harpoon = {
			"harpoon2",
			no_harpoon = "",
			padding = { left = 0 },
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

		local filename = {
			"filename",
			padding = { left = 0, right = 1 },
		}

		-- encoding component
		local encoding = { "encoding", cond = hide_in_width }

		-- fileformat component
		local fileformat = { "fileformat", cond = hide_in_width }

		return {
			options = {
				theme = "gruvbox-material",
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { branch, diff },
				lualine_c = { filetype, filename, harpoon },
				lualine_x = {
					diagnostics,
					encoding,
					fileformat,
					indentation,
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			extensions = {
				"fugitive",
				"fzf",
				"lazy",
				"mason",
				"neo-tree",
				"nvim-dap-ui",
				"oil",
				"quickfix",
				"toggleterm",
				"trouble",
			},
		}
	end,
}
