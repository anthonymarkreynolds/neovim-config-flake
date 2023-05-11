# Neovim Config Flake

This is a template repository for creating your own Neovim configuration using Nix Flakes. The main branch includes a minimal `init.lua` and folder structure for the Neovim runtime. Plugin examples are commented out in the template.

## Requirements

- Nix with Flakes support enabled

## Flake Packages

1. `neovim-custom-config`: This package contains the custom Neovim configuration files, including the `init.lua` file and any additional Lua files required for your configuration. This package is used by the `neovim-custom` package to load your custom configuration when Neovim starts.

Usage: The `neovim-custom-config` package is used internally by the `neovim-custom` package and typically not used directly by the user.

2. `neovim-custom`: This package is a customized version of Neovim, with your custom configuration and plugins integrated. When you run this version of Neovim, it will automatically load your custom configuration and plugins.

Usage: To build and run the customized Neovim, execute the following command:

```sh
nix run
```

3. `update-plugins`: This package is a script that generates the plugin list and updates the `plugin-list.nix` file with the latest versions and hashes of the specified plugins. Running this script is necessary to keep your plugins up-to-date.

Usage: To build and run the update-plugins script, execute the following command:

```sh
nix run .#update-plugins
```

After running the `update-plugins` script, you should rebuild the `neovim-custom` package to apply the updates to the plugins.

- Example plugins are provided in the template (commented out in `flake.nix` and `generate-plugin-list.py)

## Maintaining your own configuration

You can maintain your own configuration in a separate branch, like `anthonys-config`, and keep it up-to-date with the main branch.

1. Fork this repository to your own GitHub account.
2. Clone your fork to your local machine and create a new branch for your custom configuration:
```sh
git clone https://github.com/yourusername/neovim-config-flake.git
cd neovim-config-flake
git checkout -b my-custom-config
```
3. Modify the Neovim configuration according to your needs. You can add or remove plugins (located in `generate-plugin-list.py` and `flake.nix`) and edit the `./nvim/init.lua` and other Lua files as necessary.
4. Commit your changes and push them to your fork:
```sh
git add .
git commit -m "My custom Neovim configuration"
git push -u origin my-custom-config
```
5. Periodically merge the main branch into your configuration branch to stay up-to-date with the template:

```sh
git checkout my-custom-config
git pull origin main
git push
```
## Using the Flake

You can use this Neovim configuration flake as a standalone package, or integrate it into your Home Manager or NixOS configuration.

### Standalone
You can run the flake directly from your GitHub repo to provide an ephemeral instance.
```sh
nix run github:username/neovim-config-flake/your-config-branch#
```

Alternatively, run it locally:
```sh
nix run
```

### Home Manager (Flake)

To include the flake in Home Manager, you need to use the `neovim` module in your Home Manager configuration and provide the custom Neovim package from your flake.

First, make sure you have the `neovim-config-flake` added as an input to your Home Manager flake. In your `flake.nix`, add the following under the `inputs` section:

```nix
inputs.neovim-config-flake.url = "github:username/neovim-config-flake/your-config-branch";
```

Replace `username` with the GitHub username where your forked `neovim-config-flake` repository is located, and `your-config-branch` with the name of the branch containing your Neovim configuration.

Then, in your Home Manager configuration, enable the Neovim module and set the package to the custom package from your `neovim-config-flake`:

```nix
{
  # ...

  programs.neovim = {
    enable = true;
    package = inputs.neovim-config-flake.defaultPackage.${system};
  };

  # ...
}
```

Replace `${system}` with your system type, for example, `"x86_64-linux"`.

This will configure Home Manager to use the custom Neovim package from your `neovim-config-flake`.

## Notes

Feel free to explore the repository and use it as a starting point for your own Neovim configuration. Happy coding!

