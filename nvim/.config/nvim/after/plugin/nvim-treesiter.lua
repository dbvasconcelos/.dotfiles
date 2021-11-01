local custom_captures = {
  ["function.call"] = "LuaFunctionCall",
  ["function.bracket"] = "Type",
  ["namespace.type"] = "TSNamespaceType",
}

require'nvim-treesitter.configs'.setup {
	ensure_installed = { "go", "php", "html"},

    highlight = {
		enable = true,
        use_languagetree = false,
        disable = {"json"},
        custom_captures = custom_captures,
	},

}
