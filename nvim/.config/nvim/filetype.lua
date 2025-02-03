vim.filetype.add({
	pattern = {
		["dunstrc"] = "dosini",
		[".*/hypr/.*%.conf"] = "hyprlang",
		[".*/waybar/config"] = "json",
	},
})
