{
    programs.fish = {
        enable = true;
        shellInit = ''
        set -U fish_greeting ""
        '';
        shellAliases = {
            ls = "lsd -l";
            lsa = "lsd -al";
        };
    };
}