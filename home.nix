
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];


# Add your user to the Docker group

  nixpkgs = {
    # You can add overlays here
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  # TODO: Set your username
  home = {
    username = "prabha14039";
    homeDirectory = "/home/prabha14039";
    stateVersion =  "24.05";
  };


  # Add stuff for your user as you see fit:
  programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
  };

  home.packages = with pkgs; [
          python3
          pkgs.go
          pkgs.docker_28
          pkgs.gh
          micromamba
          pkgs.docker-compose
          pkgs.air
          pkgs.nodejs_23
          pkgs.networkmanagerapplet
          pkgs.swaylock-effects
          pkgs.htop
          pkgs.direnv
          pkgs.code-cursor
          pkgs.stdenv.cc.cc.lib
          pkgs.google-chrome
          pkgs.libreoffice
          pkgs.unzip
          pkgs.emacs
    ];



# Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  #create symlinks
  home.file.".config/nvim".source = ./.config/nvim; #nvim added
  home.file.".bashrc".source = ./.config/bash/.bashrc; #bashrc added
  home.file.".config/swaylock".source = ./.config/swaylock; #swaylock added
  home.file.".config/xkb".source = ./.config/xkb; #not added
  home.file.".config/waybar".source = ./.config/waybar; #waybar added
}

