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


-- KEYBINDS

local hop = require("hop")
local opts = { noremap = true, silent = true }

-- set leader to space
vim.g.mapleader = " "

-- netrw
-- vim.keymap.set("n", "<leader>l", vim.cmd.Ex)

vim.keymap.set("n", "<leader>M", ":m -2 <CR>", opts)
vim.keymap.set("n", "<leader>m", ":m +1 <CR>", opts)

-- use ctr to navigate windows
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- lsp
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- folds
vim.keymap.set("n", "<leader>fo", vim.cmd.foldopen)
vim.keymap.set("n", "<leader>fc", vim.cmd.foldclose)

-- hop
vim.keymap.set({ "n", "v" }, "<leader>j", hop.hint_words)
vim.keymap.set({ "n", "v" }, "<leader>l", hop.hint_lines)

