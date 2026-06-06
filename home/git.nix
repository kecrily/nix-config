{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    signing.key = "6492E00686064BD8561BADBDA2547DFF0237D6EC";
    settings = {
      user.name = "Percy Ma";
      user.email = "kecrily@gmail.com";

      core = {
        autocrlf = "input";
      };
      init.defaultBranch = "main";
      commit = {
        gpgSign = true;
        verbose = true;
      };
      branch.sort = "-committerdate";
      tag.gpgSign = true;
      pull.rebase = true;
      push = {
        default = "current";
        gpgSign = "if-asked";
        autoSetupRemote = true;
        followTags = true;
      };
      merge = {
        ff = "only";
        conflictStyle = "zdiff3";
      };
      rebase = {
        autoStash = true;
        autoSquash = true;
        updateRefs = true;
      };
      blame = {
        date = "relative";
        coloring = "highlightRecent";
      };
      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        compactionHeuristic = true;
      };
      status = {
        branch = true;
        short = true;
        showStash = true;
        showUntrackedFiles = "all";
      };
      submodule.recurse = true;
      apply.whitespace = "fix";
      help.autoCorrect = "prompt";
      credential.helper = "osxkeychain";
      alias = {
        get = "!f() { ghq get --look $@; }; f";
      };
      ghq.root = "~/desktop/project";
    };
  };

  programs.gh = {
    enable = true;
    extensions = with pkgs; [
      gh-poi
    ];
  };

  home.packages = with pkgs; [
    ghq
    github-copilot-cli
  ];
}
