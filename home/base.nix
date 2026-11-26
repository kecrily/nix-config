{ ... }:

{
  xdg.enable = true;
  programs.home-manager.enable = true;

  home = {
    stateVersion = "25.05";
    preferXdgDirectories = true;
    sessionPath = [ "$HOME/.local/bin" ];
  };

  multiverse = {
    enable = true;
    config.allowUnfree = true;
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/etc/nix-darwin";
  };
}
