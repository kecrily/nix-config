{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.multiverse.homeManagerModules.default
    ./base.nix
    ./shell.nix
    ./gpg.nix
    ./git.nix
    ./js.nix
    ./go.nix
    ./rust.nix
    ./docker.nix
    ./vscode
    ./github
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

    obsidian
  ];
}
