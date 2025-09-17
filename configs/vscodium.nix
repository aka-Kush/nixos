{ pkgs, theme, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default.userSettings = {
      "editor.fontFamily" = "'FiraCode Nerd Font', monospace";
      "editor.fontSize" = 16;
      "editor.fontLigatures" = true;
      "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font', monospace";
      "terminal.integrated.fontSize" = 16;
      "workbench.colorTheme" = "${theme.vscodeTheme}";
      "editor.lineNumbers" = "relative";
      "vim.useSystemClipboard" = true;
      "editor.formatOnSave" = true;
    };

    profiles.default.extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      catppuccin.catppuccin-vsc
      mvllow.rose-pine
      sainnhe.gruvbox-material
      ritwickdey.liveserver
      formulahendry.code-runner
      esbenp.prettier-vscode
      aaron-bond.better-comments
      dbaeumer.vscode-eslint
      oderwat.indent-rainbow
      formulahendry.auto-rename-tag
      bierner.comment-tagged-templates
      naumovs.color-highlight
      ms-vscode.cpptools
      hars.cppsnippets
      christian-kohler.npm-intellisense
      ms-python.python
      ms-python.vscode-pylance
      golang.go
      zainchen.json
      eamodio.gitlens
      jnoortheen.nix-ide
      pkief.material-icon-theme
      dracula-theme.theme-dracula
    ];
  };
}
