require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "onedark",
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
		-- component_separators = { left = '', right = ''},
		-- section_separators = { left = '', right = ''},
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},

	extensions = {},
})

vim.cmd([[
"lualine transparent middle (b,c)

hi lualine_c_inactive guibg=none guifg=grey
hi lualine_c_visual guibg=none   guifg=grey
hi lualine_c_replace guibg=none  guifg=grey
hi lualine_c_normal guibg=none   guifg=grey
hi lualine_c_insert guibg=none   guifg=grey
hi lualine_c_command guibg=none  guifg=grey
hi lualine_c_terminal guibg=none  guifg=grey

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

