{
  config,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    nodejs
    deno
    bun
  ];

  home.sessionVariables = {
    NODE_REPL_HISTORY = "${config.xdg.stateHome}/node/repl_history";
    NPM_CONFIG_USERCONFIG = "${config.xdg.configHome}/npm/npmrc";
    NPM_CONFIG_CACHE = "${config.xdg.cacheHome}/npm";
    PNPM_HOME = "${config.xdg.dataHome}/pnpm";
  };

  home.sessionPath = [
    "${config.xdg.dataHome}/pnpm"
  ];
}
