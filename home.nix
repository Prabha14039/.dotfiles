{ pkgs, ... }: {
  home.username = "prabha14039";
  home.homeDirectory = "/home/prabha14039";
  home.stateVersion = "24.05";

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  home.file.".config/nvim".source = ./config/nvim;
}

