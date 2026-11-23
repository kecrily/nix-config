{ ... }:

{
  home.stateVersion = "25.05";
  home.preferXdgDirectories = true;
  home.sessionPath = [ "$HOME/.local/bin" ];
  xdg.enable = true;
  programs.home-manager.enable = true;
}
