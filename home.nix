{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.nix4nvchad.homeManagerModules.default];

  programs.yazi = {
    enable = true;
    plugins = with pkgs.yaziPlugins; {
      # Plugins that don't call setup() can be configured in one line
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
      pkgs.vimPlugins.nvim-treesitter-parsers.nix
      pkgs.vimPlugins.nvim-treesitter-parsers.python
      pkgs.vimPlugins.nvim-treesitter-parsers.bash
      pkgs.vimPlugins.nvim-treesitter-parsers.lua
      pkgs.vimPlugins.nvim-treesitter-parsers.rust
      pkgs.vimPlugins.nvim-treesitter-parsers.yaml
      pkgs.vimPlugins.nvim-treesitter-parsers.json
 ];

    # You can configure extra options here (see the Configuration section)
  };
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jzahm";
  home.homeDirectory = "/home/jzahm";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
    pkgs.nerd-fonts.iosevka-term
    pkgs.nodejs
    pkgs.htop
    pkgs.unzip
    pkgs.ripgrep
    pkgs.cargo
    pkgs.rustc
    pkgs.python3
    pkgs.yazi
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jzahm/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    SUDO_EDITOR = "nvim";
    VISUAL = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
