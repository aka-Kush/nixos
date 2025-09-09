{
    programs.fish = {
        enable = true;
        shellInit = ''
        set -U fish_greeting ""
        set -Ux EDITOR nvim
      	set -Ux VISUAL nvim
        # Prepend nix profile bin to fish_user_paths if not already present
      if not contains $HOME/.local/state/nix/profiles/profile/bin $fish_user_paths
        set -U fish_user_paths $HOME/.local/state/nix/profiles/profile/bin $fish_user_paths
      end

      # Add doom's bin directory to fish_user_paths if not already present
      if not contains $HOME/.emacs.d/bin $fish_user_paths
        set -Ua fish_user_paths $HOME/.emacs.d/bin
      end
        '';
        shellAliases = {
            ls = "lsd -l";
            lsa = "lsd -al";
            cleanthisbitch = "sudo nix-collect-garbage --delete-old ; sudo nix store gc ; sudo nixos-rebuild boot";
            buildthisbitch = "sudo nixos-rebuild switch --flake /etc/nixos/.#nixos";
            updatethisbitch = "cd /etc/nixos && sudo nix flake update && buildthisbitch";
        };
    };
#  programs.starship = {
#    enable = true;
#    enableFishIntegration = true;
#  };
}
