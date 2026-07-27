{
  config,
  inputs,
  pkgs,
  ...
}: {

         
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
  };

  home.username = "jzahm";
  home.homeDirectory = "/home/jzahm";
  home.stateVersion = "26.05";

  nixpkgs.config.AllowBroken = true;

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
    pkgs.jq
    pkgs.lazygit-nvim
    pkgs.stylua
    pkgs.black
    pkgs.rustfmt
    pkgs.shfmt
    pkgs.nixpkgs-fmt
    pkgs.luaPackages.tree-sitter-cli
(pkgs.neovim.override {
  configure = {
  withPython3 = true; # see `:h g:python3_host_prog`
  withNodeJs = false;
  withRuby = false;
   customRC = ''
    '';
    packages.myPlugins = with pkgs.vimPlugins; {
      start = [
	    nvim-treesitter.withAllGrammars
	    astrocore
	    astroui
	    astrolsp
	    astrotheme
	    lazygit
            git
            gnumake
            unzip
            cargo
            nodejs
            tree-sitter
            ripgrep
            fd
	    nixd
            nixfmt
	    lua_ls
	    conform
	    null_ls
          ];
	opt = [ ];
    };
  };
})
];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    NIX_LD = "${pkgs.glibc}/lib/ld-linux-x86-64.so.2";
  };

  home.file = {};

  programs.home-manager.enable = true;
}
