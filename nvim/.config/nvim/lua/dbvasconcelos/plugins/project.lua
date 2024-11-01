return {
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup({ show_hidden = true })
	end,
	keys = {
		{ "<leader>sP", "<cmd>Telescope projects<cr>", desc = "Projects" },
	},
}
