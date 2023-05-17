{
  description = "Neovim Config Flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
      unstablePkgs = import nixpkgs-unstable {
        inherit system;
      };
      nvimPath = ./nvim;
      pluginList = import ./plugins-list.nix;
      buildVimPlugin = src@{ repo, ... }: pkgs.vimUtils.buildVimPluginFrom2Nix {
        pname = repo;
        version = "latest";
        src = pkgs.fetchFromGitHub src;
      };

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
              # add plugins from nixpkgs here
              start = [
                # nvim-treesitter.withAllGrammars
              ] ++ (map buildVimPlugin pluginList);
            };
          };
        };

        update-plugins = let
          pythonEnv = pkgs.python3.withPackages (ps: [
              ps.requests
          ]);
          prefetchGithub = pkgs.nix-prefetch-github;
        in pkgs.writeScriptBin "update-plugins" ''
          #!${pkgs.runtimeShell}
          export PATH=${prefetchGithub}/bin:$PATH
          ${pythonEnv}/bin/python ./generate-plugins-list.py
        '';
      };

    defaultPackage.${system} = self.packages.${system}.neovim-custom;

    };

}
