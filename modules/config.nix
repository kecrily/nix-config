{ pkgs, system, ... }:

{
  nix = {
    package = pkgs.lixPackageSets.stable.lix;
    settings = {
      trusted-users = [ "kecrily" ];
      substituters = [
        "https://mirrors.ustc.edu.cn/nix-channels/store"
        "https://cache.nixos.org"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      ];

      use-xdg-base-directories = true;
      experimental-features = "nix-command flakes lix-custom-sub-commands auto-allocate-uids";
      accept-flake-config = true;
      auto-optimise-store = false;
    };
    gc = {
      automatic = true;
      # FIXME
      # dates = "weekly";
      interval = {
        Weekday = 7;
      };
      options = "--delete-older-than 1w";
    };

    optimise.automatic = true;
  };

  nixpkgs = {
    hostPlatform = system;
    config.allowUnfree = true;

    overlays = [
      (final: prev: {
        inherit (prev.lixPackageSets.stable)
          nixpkgs-review
          nix-direnv
          nix-eval-jobs
          nix-fast-build
          colmena
          ;
      })
    ];
  };
}
