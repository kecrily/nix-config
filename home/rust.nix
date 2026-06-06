{
  pkgs,
  config,
  ...
}:

{
  home.packages = with pkgs; [
    rustc
    cargo
  ];

  programs.zsh.sessionVariables = {
    "CARGO_HOME" = "${config.xdg.dataHome}/cargo";
    "RUSTUP_HOME" = "${config.xdg.dataHome}/rustup";
  };
}
