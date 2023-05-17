require("indent_blankline").setup({
	char = "▏",
	show_end_of_line = true,
	show_current_context = true,
	show_current_context_start = true,
	space_char_blankline = " ",
	filetype_exclude = {
		"norg",
		"haskell",
		"help",
		"yaml",
		"cabal"
	},
})

