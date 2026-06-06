{
  system,
  pkgs,
  ...
}:

{
  nixpkgs.overlays = [
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

  # Necessary for using flakes on this system.
  nix = {
    package = pkgs.lixPackageSets.stable.lix;
    settings = {
      use-xdg-base-directories = true;
      experimental-features = "nix-command flakes lix-custom-sub-commands auto-allocate-uids";
      accept-flake-config = true;
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
    # settings.auto-optimise-store = false;
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = system;

  nix.settings.trusted-users = [ "kecrily" ];
  security.pam.services.sudo_local.touchIdAuth = true;

  users.users.kecrily = {
    home = "/Users/kecrily";
  };

  nixpkgs.config.allowUnfree = true;

  environment.pathsToLink = [ "/share/zsh" ];
}
