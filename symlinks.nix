{ config, pkgs, lib, ... }:

let
  configFiles = [
    { target = ".config/nvim"; source = ./config/nvim; }
    { target = ".zshrc"; source = ./config/zsh/.zshrc; }
  ];

in
{
  home.file = builtins.listToAttrs (file:
    {
      name = file.target;
      value = { source = file.source; };
    }) configFiles;
}

