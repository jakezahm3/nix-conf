{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.nix4nvchad.homeManagerModules.default];

  # Fixed the Fish block parsing structure entirely
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -Ux EDITOR "nvim"
      set -Ux VISUAL "nvim"
      set -Ux NIX_LD "${pkgs.glibc}/lib/ld-linux-x86-64.so.2"
    '';
  };

  programs.yazi = {
    enable = true;
    plugins = with pkgs.yaziPlugins; {
      smart-enter.package = smart-enter;
      chmod.package = chmod;
      diff.package = diff;
      nord.package = nord;
    };
    flavors = {
      inherit (pkgs.yaziPlugins) nord;
    };
    theme = {
      flavor = {
        dark = "nord";
      };
    };
  };

  programs.nvchad = {
    enable = true;
    backup = false;
    extraPackages = with pkgs; [
      stylua
      coreutils
      gzip
      curl
      util-linux
      lua-language-server
      bash-language-server
      rust-analyzer
      ruff
      jq
      nil
      black
      pyright
      selene
      alejandra
      spectral-language-server
      yaml-language-server
      beautysh
      prettierd
      rustywind
      yamlfmt
      statix
      vimPlugins.windsurf-nvim
      codeium
      vimPlugins.nvim-treesitter.withAllGrammars
      vimPlugins.nvim-treesitter
      vimPlugins.nvim-treesitter-parsers.nix
      vimPlugins.nvim-treesitter-parsers.python
      vimPlugins.nvim-treesitter-parsers.bash
      vimPlugins.nvim-treesitter-parsers.lua
      vimPlugins.nvim-treesitter-parsers.rust
      vimPlugins.nvim-treesitter-parsers.yaml
      vimPlugins.nvim-treesitter-parsers.json
      lua51Packages.tree-sitter-cli
      vimPlugins.blink-cmp
    ];
  };

  home.username = "jzahm";
  home.homeDirectory = "/home/jzahm";
  home.stateVersion = "26.05";

  home.packages = [
    pkgs.nerd-fonts.iosevka-term
    pkgs.nodejs
    pkgs.htop
    pkgs.unzip
    pkgs.ripgrep
    pkgs.cargo
    pkgs.rustc
    pkgs.python3
    pkgs.yazi
    pkgs.tree
    pkgs.gcc
    pkgs.glibc
    pkgs.curl
    pkgs.gnumake
    pkgs.zlib
    pkgs.stdenv.cc.cc.lib
    pkgs.steam-run
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    NIX_LD = "${pkgs.glibc}/lib/ld-linux-x86-64.so.2";
  };

  home.file = {};

  programs.home-manager.enable = true;
}
