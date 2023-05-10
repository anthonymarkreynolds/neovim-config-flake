{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

  in {
    packages.${system} = {
      neovim-custom-config = pkgs.stdenv.mkDerivation {
        name = "neovim-config";
        src = self;
        installPhase = ''
          mkdir -p $out/nvim/
          cp -r ./nvim $out/nvim/
          '';
      };

      neovim-custom = pkgs.neovim.override {
        configure = {
          customRC = ''
            let g:custom_config_path = '${self.packages.${system}.neovim-custom-config}/nvim'
            exec 'luafile ' . g:custom_config_path . '/init.lua'
          '';
        };
      };
    };
    defaultPackage.${system} = self.packages.${system}.neovim-custom;
  };
}
