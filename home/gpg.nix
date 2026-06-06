{ config, ... }:

let
  gpgHome = "${config.xdg.dataHome}/gnupg";
in
{
  programs.gpg = {
    enable = true;
    homedir = gpgHome;
    settings = {
      default-key = "6492E00686064BD8561BADBDA2547DFF0237D6EC";
      keyserver = "hkps://keys.openpgp.org";
      keyserver-options = "no-honor-keyserver-url include-revoked auto-key-retrieve";

      keyid-format = "0xlong";
      with-fingerprint = true;

      list-options = "show-uid-validity";
      verify-options = "show-uid-validity show-keyserver-urls";
    };
  };

  home.file."${gpgHome}/common.conf".text = ''
    use-keyboxd
  '';

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    sshKeys = [ "C70DF347763BF7CB8B74675565F6EE556F86AC3F" ];
    defaultCacheTtl = 600;
    maxCacheTtl = 7200;
  };

  programs.zsh.sessionVariables = {
    GNUPGHOME = gpgHome;
    SSH_AUTH_SOCK = "${config.xdg.dataHome}/gnupg/S.gpg-agent.ssh";
  };
}
