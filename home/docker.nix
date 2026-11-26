{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ orbstack ];

  home.sessionVariables = {
    "DOCKER_CONFIG" = "${config.xdg.dataHome}/docker";
  };
}
