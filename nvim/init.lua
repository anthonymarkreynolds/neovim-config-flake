local config_path = vim.api.nvim_get_var("custom_config_path")
vim.opt.rtp:prepend(config_path)
vim.opt.packpath:prepend(config_path)

-- Add the rest of your Neovim configuration here
