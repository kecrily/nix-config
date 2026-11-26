{ pkgs, config, ... }:

let
  npmCorepack = pkgs.writeShellScriptBin "npm" ''
    exec ${pkgs.corepack}/bin/corepack npm "$@"
  '';

  npxCorepack = pkgs.writeShellScriptBin "npx" ''
    exec ${pkgs.corepack}/bin/corepack npx "$@"
  '';

  pnpmCorepack = pkgs.writeShellScriptBin "pnpm" ''
    exec ${pkgs.corepack}/bin/corepack pnpm "$@"
  '';

  pnpxCorepack = pkgs.writeShellScriptBin "pnpx" ''
    exec ${pkgs.corepack}/bin/corepack pnpx "$@"
  '';

  yarnCorepack = pkgs.writeShellScriptBin "yarn" ''
    exec ${pkgs.corepack}/bin/corepack yarn "$@"
  '';
in
{
  home.packages = with pkgs; [
    nodejs
    deno
    bun

    (lib.hiPrio npmCorepack)
    (lib.hiPrio npxCorepack)
    pnpmCorepack
    pnpxCorepack
    yarnCorepack
  ];

  home.sessionVariables = {
    NODE_REPL_HISTORY = "${config.xdg.stateHome}/node/repl_history";
    NPM_CONFIG_USERCONFIG = "${config.xdg.configHome}/npm/npmrc";
    NPM_CONFIG_CACHE = "${config.xdg.cacheHome}/npm";
    PNPM_HOME = "${config.xdg.dataHome}/pnpm";
  };

  home.sessionPath = [
    "${config.xdg.dataHome}/npm/bin"
    "${config.xdg.dataHome}/pnpm/bin"
  ];
}
