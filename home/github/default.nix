{ pkgs, ... }:

{
  programs.gh = {
    enable = true;
    extensions = with pkgs; [
      gh-poi
    ];
  };

  programs.github-copilot-cli = {
    enable = true;
  };

  home.packages = with pkgs; [
    github-copilot-app

    act
  ];
}
