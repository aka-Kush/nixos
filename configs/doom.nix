# NOTE!!! DOOM EMACS HAS TO BE MANUALLY INSTALLED AND SYNCED IN ~/.emacs.d
{config, pkgs, ...}:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;  # or emacs-gtk if you prefer
  };

  home.packages = [
    (pkgs.writeShellScriptBin "emacs-doom-daemon" ''
      exec ${pkgs.emacs-pgtk}/bin/emacs --fg-daemon
    '')
  ];

#  systemd.user.services.emacs = {
#    Unit = {
#      Description = "Doom Emacs Daemon";
#      After = [ "graphical.target" ];
#    };
#    Service = {
#      ExecStart = "${config.home.homeDirectory}/.nix-profile/bin/emacs-doom-daemon";
#      Restart = "on-failure";
#      Environment = [
#        "XDG_CONFIG_HOME=${config.home.homeDirectory}/.config"
#        "HOME=${config.home.homeDirectory}"
#        "PATH=${pkgs.lib.makeBinPath [ pkgs.emacs-pgtk pkgs.coreutils pkgs.gawk ] }"
#      ];
#    };
#    Install = {
#      WantedBy = [ "default.target" ];
#    };
#  };

  xdg.desktopEntries.doom-emacs = {
    name = "Doom Emacs";
    genericName = "Text Editor";
    comment = "Doom Emacs (daemon)";
    exec = "emacsclient -c -a emacs";
    icon = "emacs";
    terminal = false;
    categories = [ "Utility" "TextEditor" ];
  };

  home.sessionVariables = {
    EDITOR = "emacsclient";
    ALTERNATE_EDITOR = "";
  };
}

