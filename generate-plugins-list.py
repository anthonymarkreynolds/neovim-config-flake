import os
import requests
import subprocess
import sys

repos = [
    # Add plugin repos here

    # "lukas-reineke/indent-blankline.nvim",
    "navarasu/onedark.nvim",
]

template = """
{{
  name = "{name}";
  url = "{url}";
  sha256 = "{sha256}";
}}
"""

plugin_lua_directory = './nvim/plugin'

with open("plugins-list.nix", "w") as f:
    f.write("[\n")
    for repo in repos:
        user, repo_name = repo.split("/")
        plugin_name = repo_name.replace(".","-")
        url = f"https://github.com/{user}/{repo_name}/archive/refs/heads/master.tar.gz"
        print(f"Fetching {repo_name}...", file=sys.stderr)
        result = subprocess.run(["nix-prefetch-url", "--unpack", url], text=True, capture_output=True)
        sha256 = result.stdout.strip()

        f.write(template.format(name=plugin_name, url=url, sha256=sha256))

        # Create an empty Lua file if it doesn't exist
        lua_file_path = os.path.join(plugin_lua_directory, f"{plugin_name}.lua")
        if not os.path.exists(lua_file_path):
            with open(lua_file_path, 'w') as lua_file:
                pass

    f.write("]\n")

print("plugins-list.nix and empty Lua files generated.", file=sys.stderr)

