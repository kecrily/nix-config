{
  config,
  ...
}:

{
  programs.go = {
    enable = true;
    env.GOPATH = "${config.xdg.dataHome}/go";
  };
  programs.zsh.sessionVariables = {
    "GOMODCACHE" = "${config.xdg.cacheHome}/go/mod";
  };
}
