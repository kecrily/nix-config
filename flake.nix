{
  description = "Percy's Nix config";

  nixConfig = {
    substituters = [
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      ...
    }:
    let
      system = "aarch64-darwin";
    in
    {
      darwinConfigurations.pm7-macbook = nix-darwin.lib.darwinSystem {
        modules = [
          {
            _module.args = inputs // {
              inherit system;
            };
            system.configurationRevision = self.rev or self.dirtyRev or null;
          }

          ./systems/darwin.nix
          ./modules/config.nix

          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "bak";
            home-manager.users.kecrily = import ./home;
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };
          }
        ];
      };

      formatter."${system}" = nixpkgs.legacyPackages."${system}".nixfmt;
    };
}
