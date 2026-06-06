{
  config,
  ...
}:

let
  vscodeHome = "${config.home.homeDirectory}/Library/Application Support/Code/User";
in
{
  programs.vscode = {
    enable = true;
  };

  home.file."${vscodeHome}/settings.json".source =
    config.lib.file.mkOutOfStoreSymlink /etc/nix-darwin/home/vscode/./settings.json;
}
