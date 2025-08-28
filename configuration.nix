{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./configs/sddm.nix
  ];
  
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.flatpak.enable = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  networking.networkmanager.enable = true;
  networking.hostName = "nixos";
  
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";
  
  users.users.kush = {
    isNormalUser = true;
    home = "/home/kush";
    shell = pkgs.fish;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    libnotify
    papirus-icon-theme 
    lsd 
    localsend
    git
    lshw
    waybar 
    wofi
    jq
    swaylock
    kitty
    firefox
    xfce.thunar
    networkmanagerapplet
    swaybg
    hyprpolkitagent
    wl-clipboard
    wlogout
    brave
    spotify
    vscode
    pavucontrol
    grim 
    slurp
    dunst
    cliphist
    viewnior
    vim
    xfce.tumbler
    ffmpegthumbnailer
    libheif
    gvfs
    ifuse
    libimobiledevice
    libreoffice-fresh
    xfce.thunar-archive-plugin 
    xarchiver
    gocryptfs
    unzip
    nvidia-vaapi-driver
    libva
    libva-utils
    vulkan-tools
    vulkan-validation-layers
    vulkan-headers
    vulkan-loader
    vulkan-extension-layer 
    glxinfo
    mesa-demos
    egl-wayland
    nvtopPackages.full
    brightnessctl
    ntfs3g
    mpv 
    qbittorrent
    xdg-user-dirs
    xdg-user-dirs-gtk
    anytype
    discord
    protonvpn-gui 
    lxappearance-gtk2
    imagemagick
    gparted
    xdg-utils
    catppuccin-gtk
    zafiro-icons
    whitesur-cursors
    gruvbox-dark-gtk
    gruvbox-plus-icons
    neovim
    gcc
    curl
    fzf
    ripgrep
    fd
    bat
    stylua
    tree-sitter
    lua-language-server
    prettierd
    eslint_d
    catppuccin-sddm
    go
    ente-desktop
    emacs-pgtk
    pkg-config
    gnupg
    gnumake
    pkg-config
    autoconf
    automake
    libtool
    tldr
    rsync
    cmake
  ];

  services.usbmuxd.enable = true;

  services.udev.packages = with pkgs; [ libimobiledevice usbmuxd ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.meslo-lg
  ];

  services.xserver.enable = true;
  programs.hyprland.enable = true;
  programs.fish.enable = true;

  # sound.enable = false;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
  };

  hardware.nvidia.prime = {
    sync.enable = true;
    nvidiaBusId = "PCI:1:0:0";
    amdgpuBusId = "PCI:6:0:0";
  };

  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
  services.gvfs.enable = true;
  services.power-profiles-daemon.enable = true;
  
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ 
      xdg-desktop-portal-hyprland 
      xdg-desktop-portal-wlr
    ];
  };

  fileSystems."/home/kush/DATA" = {
    device = "/dev/disk/by-uuid/4DD0ABE94BC14124";
    fsType = "ntfs";
    options = [ "uid=1000" "gid=100" "dmask=022" "fmask=133" "windows_names" ];
  };

  # localsend ports
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 53317 ];
    allowedUDPPorts = [ 53317 ];
  };
  
  system.stateVersion = "25.05";

}
