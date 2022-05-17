local swap_next, swap_prev = (function()
	local swap_objects = {
		p = "@parameter.inner",
		f = "@function.outer",
		e = "@element",
	}

	local n, p = {}, {}
	for key, obj in pairs(swap_objects) do
		n[string.format("<M-l>%s", key)] = obj
		p[string.format("<M-h>%s", key)] = obj
	end

	return n, p
end)()

require("nvim-treesitter.configs").setup({
	ensure_installed = { "bash", "dockerfile", "go", "lua", "yaml" },
	sync_install = false,

	highlight = { enable = true },

	indent = { enable = true, disable = { "yaml" } },

	autopairs = { enable = true },

	context_commentstring = { enable = true, enable_autocmd = false },

	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",

				["ac"] = "@conditional.outer",
				["ic"] = "@conditional.inner",

				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
			},
		},

		move = {
			enable = true,
			set_jumps = true,

			goto_next_start = {
				["]p"] = "@parameter.inner",
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[p"] = "@parameter.inner",
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},

		swap = {
			enable = true,
			swap_next = swap_next,
			swap_previous = swap_prev,
		},
	},
})
