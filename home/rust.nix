{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    rustc
    cargo
  ];

  home.sessionVariables = {
    "CARGO_HOME" = "${config.xdg.dataHome}/cargo";
    "RUSTUP_HOME" = "${config.xdg.dataHome}/rustup";
  };
}
