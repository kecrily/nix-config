{
  pkgs,
  ...
}:

{
  imports = [
    ./base.nix
    ./shell.nix
    ./gpg.nix
    ./git.nix
    ./js.nix
    ./go.nix
    ./rust.nix
    ./docker.nix
    ./vscode
  ];

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

    act

    obsidian
  ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/etc/nix-darwin";
  };
}
