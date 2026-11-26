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
    import-tree.url = "github:denful/import-tree";
  };

  outputs =
    inputs:
    let
      system = "aarch64-darwin";
    in
    {
      darwinConfigurations.pm7-macbook = inputs.nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs system; };
        modules = [
          ./systems/darwin.nix
          (inputs.import-tree ./modules)
        ];
      };

      formatter."${system}" = inputs.nixpkgs.legacyPackages."${system}".nixfmt-tree;
    };
}
