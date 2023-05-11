{
  description = "Anthony's Neovim config flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    pluginList = import ./plugin-list.nix;
    buildVimPlugin = {name,url,sha256}: pkgs.vimUtils.buildVimPluginFrom2Nix {
      pname = name;
      version = "latest";
      src = builtins.fetchTarball {
        inherit url sha256;
      };
    };
    myVimPlugins = (map buildVimPlugin pluginList);

  in {
    packages.${system} = {
      neovim-custom-config = pkgs.stdenv.mkDerivation {
        name = "neovim-custom-config";
        src = self;
          installPhase = ''
          mkdir -p $out/
          cp -r ./nvim $out/
          '';
      };

      neovim-custom = pkgs.neovim.override {
        configure = {
          customRC = ''
            let g:custom_config_path = '${self.packages.${system}.neovim-custom-config}/nvim'
            exec 'luafile ' . g:custom_config_path . '/init.lua'
          '';
          packages.myVimPackage = with pkgs.vimPlugins; {
            start = [
              nvim-treesitter.withAllGrammars
            ] ++ myVimPlugins;
          };
        };
      };

      update-plugins = let
        pythonEnv = pkgs.python3.withPackages (ps: [
            ps.requests
        ]);
      in pkgs.writeScriptBin "update-plugins" ''
        #!${pkgs.runtimeShell}
        ${pythonEnv}/bin/python ${./generate-plugins-list.py}
      '';

    };

    defaultPackage.${system} = self.packages.${system}.neovim-custom;
  };
}
