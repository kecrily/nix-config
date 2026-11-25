{
  config,
  ...
}:

let
  vscodeHome = "${config.xdg.dataHome}/vscode";
  vscodeEnv = {
    VSCODE_PORTABLE = vscodeHome;
    VSCODE_CLI_DATA_DIR = "${vscodeHome}/cli";
  };
in
{
  programs.vscode = {
    enable = true;
  };

  home.file."${vscodeHome}/user-data/User/settings.json".source =
    config.lib.file.mkOutOfStoreSymlink /etc/nix-darwin/home/vscode/settings.json;

  home.sessionVariables = vscodeEnv;

  # GUI apps don't read shell variables; export them to launchd at login.
  launchd.agents.vscode-portable-env = {
    enable = true;
    config = {
      ProgramArguments = [
        "/bin/sh"
        "-c"
        "launchctl setenv VSCODE_PORTABLE '${vscodeEnv.VSCODE_PORTABLE}' && launchctl setenv VSCODE_CLI_DATA_DIR '${vscodeEnv.VSCODE_CLI_DATA_DIR}'"
      ];
      RunAtLoad = true;
    };
  };
}
