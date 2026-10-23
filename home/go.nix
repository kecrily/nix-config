{
  config,
  ...
}:

{
  programs.go = {
    enable = true;
    env.GOPATH = "${config.xdg.dataHome}/go";
  };

  home.sessionVariables = {
    "GOMODCACHE" = "${config.xdg.cacheHome}/go/mod";
  };
}
