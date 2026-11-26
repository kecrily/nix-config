{ pkgs, ... }:

{
  programs.home-manager.enable = true;

  home = {
    stateVersion = "25.05";
    preferXdgDirectories = true;
  };

  xdg = {
    enable = true;
    localBinInPath = true;
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

  home.packages = with pkgs; [
    slack
    element-desktop
    vesktop
    wechat
    qq

    iina
    keka

    duckdb

    vim
    neovim
    helix
    zed-editor
    lapce

    spotify

    nixd
    nil

    google-chrome
    firefox

    gleam

    raycast

    obsidian
  ];
}
