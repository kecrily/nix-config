{ inputs, ... }:

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
    configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
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
