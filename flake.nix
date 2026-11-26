{
  description = "Percy's Nix config";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://zed.cachix.org"
    ];

    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "zed.cachix.org-1:/pHQ6dpMsAZk2DiP4WCL0p9YDNKWj2Q5FL20bNmw1cU="
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

    multiverse.url = "github:fzakaria/nixpkgs-multiverse";
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

      formatter."${system}" = nixpkgs.legacyPackages."${system}".nixfmt-tree;
    };
}
