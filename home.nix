# This is your home-manager configuration file
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
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
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
          pkgs.nodejs_22
          pkgs.networkmanagerapplet
          pkgs.swaylock-effects
    ];

# Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  #create symlinks
  home.file.".config/nvim".source = ./.config/nvim;
  home.file.".bashrc".source = ./.config/zsh/.bashrc;
  home.file.".config/swaylock".source = ./.config/swaylock;
  home.file.".config/xkb".source = ./.config/xkb;
}

