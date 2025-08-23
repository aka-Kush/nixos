{ config, pkgs, lib, ... }:

let
  lazyvim-starter = pkgs.fetchFromGitHub {
    owner = "LazyVim";
    repo = "starter";
    rev = "master";  # Or pin a commit hash
    sha256 = "sha256-QrpnlDD4r1X4C8PqBhQ+S3ar5C+qDrU1Jm/lPqyMIFM=";
  };

  mutableLazyvim = pkgs.runCommandLocal "lazyvim-copy" {} ''
    mkdir -p $out
    cp -r --no-preserve=mode,ownership ${lazyvim-starter}/* $out/
  '';
in {
  xdg.configFile."nvim".source = mutableLazyvim;
  programs.neovim = {
    enable = true;
    extraConfig = ''
      vim.o.relativenumber = true
    '';
  };
}
