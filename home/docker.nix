{
  pkgs,
  config,
  ...
}:

{
  home.packages = with pkgs; [ orbstack ];

  programs.zsh.sessionVariables = {
    "DOCKER_CONFIG" = "${config.xdg.dataHome}/docker";
  };
}
