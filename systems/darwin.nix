{
  system = {
    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 6;
    primaryUser = "kecrily";
    defaults = {
      dock = {
        autohide = true;
        tilesize = 64;
      };
    };
  };

  users.users.kecrily = {
    home = "/Users/kecrily";
  };

  environment = {
    pathsToLink = [ "/share/zsh" ];
    variables = {
      ZDOTDIR = "$HOME/.config/zsh";
    };
  };

  security.pam.services.sudo_local.touchIdAuth = true;
}
