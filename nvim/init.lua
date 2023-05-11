local config_path = vim.api.nvim_get_var("custom_config_path")
vim.opt.rtp:prepend(config_path)
vim.opt.packpath:prepend(config_path)

-- Add the rest of your Neovim configuration here

local set = vim.opt

-- GLOBAL DEFAULTS

-- tabs
set.expandtab = true -- convert tabs to spaces
set.tabstop = 2 -- 2 spaces per tab
set.shiftwidth = 2 -- 2 spaces per (auto)indent

--
-- set.autochdir = true
set.swapfile = false

--
set.cursorline = true -- highlight current row
set.signcolumn = "auto"

-- search
set.hlsearch = false -- disable previous search highlighting
set.incsearch = true
set.ignorecase = true -- ignore case in search patterns
set.smartcase = true -- override 'ignorecase' if contains uppercase

--
set.splitright = true
set.wrap = true
set.scrolloff = 5 -- min cursor offset from top/bottom

set.fileencoding = "UTF-8"
set.hidden = true -- hides unloaded buffers
set.number = true
set.relativenumber = true

-- list chars
set.list = true -- enable      listchars
set.listchars = "tab:-->,trail:●,eol:↴,lead:․,space:⸱,multispace:⸱◦,extends:⮒"

set.mouse = "a" -- enable mouse support

set.termguicolors = true -- enable 24-bit RBG color
set.laststatus = 3 -- enable global statusline
