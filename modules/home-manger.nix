{ inputs, pkgs, ... }:

{
  imports = [ inputs.home-manager.darwinModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
    users.kecrily = {
      imports = [
        inputs.multiverse.homeManagerModules.default
        (inputs.import-tree ../home)
      ];
    };
    extraSpecialArgs = {
      inherit inputs;
    };
  };
}
