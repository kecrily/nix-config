{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    fish

    alacritty

    less
    ripgrep
    bat
    eza
    hyperfine
  ];

  home.file.".hushlogin".text = "";
  home.file.".zshenv".enable = false;

  home.shell.enableZshIntegration = true;
  programs.zsh = {
    enable = true;
    dotDir = "${config.home.homeDirectory}/.config/zsh";
    history.path = "${config.xdg.dataHome}/zsh/zsh_history";
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    plugins = [
      {
        name = "pure-prompt";
        file = "share/zsh/site-functions/async";
        src = pkgs.pure-prompt;
      }
      {
        name = "pure-prompt";
        file = "share/zsh/site-functions/prompt_pure_setup";
        src = pkgs.pure-prompt;
      }
    ];
  };

  programs.eza = {
    enable = true;
  };

  programs.atuin = {
    enable = true;
    settings = {
      enter_accept = false;
      show_preview = false;
      prefers_reduced_motion = true;
      show_help = false;
      inline_height = 0;
    };
  };

  programs.kitty = {
    enable = true;
    themeFile = "citylights";
    settings = {
      "font_size" = 12;
      "window_padding_width" = 2;
    };
  };
}
