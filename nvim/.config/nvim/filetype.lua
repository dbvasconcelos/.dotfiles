vim.filetype.add({
	filename = {
		["dunstrc"] = "dosini",
	},
	pattern = {
		[".*/hypr/.*%.conf"] = "hyprlang"
	}
})
