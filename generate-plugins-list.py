import os
import requests
import subprocess
import sys
import json

repos = [
    # Add plugin repos here

    "nvim-lua/plenary.nvim",
    "kylechui/nvim-surround",
    "windwp/nvim-autopairs",
    "numToStr/Comment.nvim",
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/playground",
    "lukas-reineke/indent-blankline.nvim",
    "kevinhwang91/promise-async",
    "kevinhwang91/nvim-ufo",

    # LSP
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim",

    # Completion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    # "L4MON4D3/LuaSnip",
    # "saadparwaiz2/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",

    #Navigation
    "nvim-telescope/telescope.nvim",
    "phaazon/hop.nvim",

    # git
    "lewis6991/gitsigns.nvim",

    # Theme
    "navarasu/onedark.nvim",
    "kyazdani42/nvim-web-devicons",

    # Status Line
    "nvim-lualine/lualine.nvim",

    # Organisation / Project Management
    "nvim-neorg/neorg",

]

template = """
{{
  owner = "{owner}";
  repo = "{repo}";
  rev = "{rev}";
  sha256 = "{sha256}";
}}
"""

plugin_lua_directory = './src/programs/neovim-custom/nvim/plugin'

with open("./plugins-list.nix", "w") as f:
    f.write("[\n")
    for repo in repos:
        user, repo_name = repo.split("/")
        plugin_name = repo_name.replace(".","-")
        url = f"https://github.com/{user}/{repo_name}/archive/refs/heads/master.tar.gz"
        print(f"Fetching {repo_name}...", file=sys.stderr)
        result = subprocess.run(["nix-prefetch-github", user, repo_name, "--json"], text=True, capture_output=True)
        result_dict = json.loads(result.stdout.strip())

        f.write(
            template.format(
                owner=result_dict["owner"],
                repo=result_dict["repo"],
                rev=result_dict["rev"],
                sha256=result_dict["sha256"]
            )
        )

    f.write("]\n")

print("plugins-list.nix generated.", file=sys.stderr)
