# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{ 
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.wayland.enable = true;

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = true; 
  services.pipewire = {
	  enable = false;          # Disable PipeWire
		  pulse.enable = false;    # Disable PipeWire's PulseAudio compatibility
  };

# For KDE Plasma
  services.pipewire.alsa.enable = false;
  services.pipewire.jack.enable = false;

  services.gvfs.enable = true;
  programs.thunar = {
	  enable = true;
	  plugins = with pkgs.xfce; [
	  	thunar-archive-plugin
		thunar-volman
	  ];
  };

  # Enable touchpad support (enabled default in most desktopManager).
# services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.prabha14039 = {
    isNormalUser = true;
    description = "Prabha14039";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    packages = with pkgs; [
     
    ];
  };


  # Install firefox.
  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    git
    foot
    rofi-wayland
    wl-clipboard
    hyprland
    waybar
    firefox
    gcc
    clang
    gnumake
    lua5_1
    pkgs.lua51Packages.luarocks
    ripgrep
    fd
    zsh
    pavucontrol
    lsof
    pulseaudio
    tmux 
    swww
    pyprland
    python3
    yazi
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.tumbler
    gvfs
    fzf
    pkgs.go
    pkgs.docker_28
 ];

  programs = {
	  zsh = {
		  enable = true;
		  autosuggestions.enable = true;
		  syntaxHighlighting.enable = true;
		  ohMyZsh = {
			  enable = true;
			  theme = "robbyrussell";
			  plugins = [
				  "git"
				  "npm"
				  "history"
				  "node"
				  "rust"
				  "deno"
			  ];
		  };
	  };
  };

  fonts.packages = with pkgs; [
	  nerd-fonts.jetbrains-mono
  ];
  users.defaultUserShell = pkgs.zsh; 

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
