-- Lua
require("onedark").setup({
	-- Main options --
	style = "deep", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	transparent = true, -- Show/hide background
	term_colors = true, -- Change terminal color as per the selected theme style
	ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
	cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

	-- toggle theme style ---
	toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
	toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

	-- Change code style ---
	-- Options are italic, bold, underline, none
	-- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
	code_style = {
		comments = "italic",
		keywords = "none",
		functions = "none",
		strings = "none",
		variables = "none",
	},

	-- Lualine options --
	lualine = {
		transparent = false, -- lualine center bar transparency
	},

	-- Custom Highlights --
	colors = {}, -- Override default colors
	highlights = {}, -- Override highlight groups

	-- Plugins Config
	diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true, -- use undercurl instead of underline for diagnostics
		background = true, -- use background color for virtual text
	},
})
require("onedark").load()

-- enable borders
local _border = "single"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = _border,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = _border,
})

vim.diagnostic.config({
	float = { border = _border },
})

-- additional color overides
vim.cmd([[
hi CursorLine guibg=#23152E

" borders
hi FloatBorder guibg=none guifg=#2c323c
hi NormalFloat guibg=none 
hi LspInfoBorder guibg=none guifg=#2c323c

" Treesitter
hi TreesitterContextBottom gui=underline guibg=#282c34 guifg=none

hi WinSeparator guifg=#2c323c
hi NvimTreeWinSeparator guifg=#2c323c
hi TelescopeBorder guifg=#828997
hi TelescopePreviewBorder guifg=#2c323c
hi TelescopePromptBorder guifg=#2c323c
hi TelescopeResultsBorder guifg=#2c323c

" Indent Blankline
hi IndentBlanklineContextChar guifg=#828997
hi IndentBlanklineContextStart gui=underline

" Menus
hi Pmenu guibg=none
hi BorderBG guifg=#2c323c
hi BorderBG2 guifg=#2c323c

"hi hl_LspReferenceText guibg=none
"hi hl_LspReferenceRead guibg=none
"hi hl_LspReferenceWrite guibg=none

"lsp
hi DiagnosticVirtualTextHint guibg=none
hi DiagnosticVirtualTextWarn guibg=none
hi DiagnosticVirtualTextError guibg=none
hi DiagnosticVirtualTextInfo guibg=none
" hi DiagnosticHint guibg=#181a1f

"lualine transparent middle (b,c)
hi lualine_c_inactive guibg=none guifg=#848b98
hi lualine_c_visual guibg=none guifg=#848b98
hi lualine_c_replace guibg=none guifg=#848b98
hi lualine_c_normal guibg=none guifg=#848b98
hi lualine_c_insert guibg=none guifg=#848b98
hi lualine_c_command guibg=none guifg=#848b98
hi lualine_c_terminal guibg=none guifg=#848b98

hi lualine_b_inactive guibg=none "guifg=grey
hi lualine_b_visual guibg=none "guifg=grey
hi lualine_b_replace guibg=none "guifg=grey
hi lualine_b_normal guibg=none "guifg=grey
hi lualine_b_insert guibg=none "guifg=grey
hi lualine_b_command guibg=none "guifg=grey
hi lualine_b_terminal guibg=none "guifg=grey

hi lualine_b_diff_added_inactive guibg=none "guifg=grey
hi lualine_b_diff_added_visual guibg=none "guifg=grey
hi lualine_b_diff_added_replace guibg=none "guifg=grey
hi lualine_b_diff_added_normal guibg=none "guifg=grey
hi lualine_b_diff_added_insert guibg=none "guifg=grey
hi lualine_b_diff_added_command guibg=none "guifg=grey
hi lualine_b_diff_added_terminal guibg=none "guifg=grey

hi lualine_b_diff_modified_inactive guibg=none "guifg=grey
hi lualine_b_diff_modified_visual guibg=none "guifg=grey
hi lualine_b_diff_modified_replace guibg=none "guifg=grey
hi lualine_b_diff_modified_normal guibg=none "guifg=grey
hi lualine_b_diff_modified_insert guibg=none "guifg=grey
hi lualine_b_diff_modified_command guibg=none "guifg=grey
hi lualine_b_diff_modified_terminal guibg=none "guifg=grey

hi lualine_b_diff_removed_inactive guibg=none "guifg=grey
hi lualine_b_diff_removed_visual guibg=none "guifg=grey
hi lualine_b_diff_removed_replace guibg=none "guifg=grey
hi lualine_b_diff_removed_normal guibg=none "guifg=grey
hi lualine_b_diff_removed_insert guibg=none "guifg=grey
hi lualine_b_diff_removed_command guibg=none "guifg=grey
hi lualine_b_diff_removed_terminal guibg=none "guifg=grey

hi lualine_b_diagnostics_error_inactive guibg=none "guifg=grey
hi lualine_b_diagnostics_error_visual guibg=none "guifg=grey
hi lualine_b_diagnostics_error_replace guibg=none "guifg=grey
hi lualine_b_diagnostics_error_normal guibg=none "guifg=grey
hi lualine_b_diagnostics_error_insert guibg=none "guifg=grey
hi lualine_b_diagnostics_error_command guibg=none "guifg=grey
hi lualine_b_diagnostics_error_terminal guibg=none "guifg=grey

hi lualine_b_diagnostics_hint_inactive guibg=none "guifg=grey
hi lualine_b_diagnostics_hint_visual guibg=none "guifg=grey
hi lualine_b_diagnostics_hint_replace guibg=none "guifg=grey
hi lualine_b_diagnostics_hint_normal guibg=none "guifg=grey
hi lualine_b_diagnostics_hint_insert guibg=none "guifg=grey
hi lualine_b_diagnostics_hint_command guibg=none "guifg=grey
hi lualine_b_diagnostics_hint_terminal guibg=none "guifg=grey

hi lualine_b_diagnostics_info_inactive guibg=none "guifg=grey
hi lualine_b_diagnostics_info_visual guibg=none "guifg=grey
hi lualine_b_diagnostics_info_replace guibg=none "guifg=grey
hi lualine_b_diagnostics_info_normal guibg=none "guifg=grey
hi lualine_b_diagnostics_info_insert guibg=none "guifg=grey
hi lualine_b_diagnostics_info_command guibg=none "guifg=grey
hi lualine_b_diagnostics_info_terminal guibg=none "guifg=grey

hi lualine_b_diagnostics_warn_inactive guibg=none "guifg=grey
hi lualine_b_diagnostics_warn_visual guibg=none "guifg=grey
hi lualine_b_diagnostics_warn_replace guibg=none "guifg=grey
hi lualine_b_diagnostics_warn_normal guibg=none "guifg=grey
hi lualine_b_diagnostics_warn_insert guibg=none "guifg=grey
hi lualine_b_diagnostics_warn_command guibg=none "guifg=grey
hi lualine_b_diagnostics_warn_terminal guibg=none "guifg=grey
]])

