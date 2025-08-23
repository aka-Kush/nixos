{
    programs.fish = {
        enable = true;
        shellInit = ''
        set -U fish_greeting ""
        set -Ux EDITOR nvim
      	set -Ux VISUAL nvim
        '';
        shellAliases = {
            ls = "lsd -l";
            lsa = "lsd -al";
        };
    };
}
