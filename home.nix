{ config, inputs, pkgs, ... }:

{
  imports = [ inputs.nix4nvchad.homeManagerModules.default ];

  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [
        stylua
        lua-language-server
        lua-language-server
        bash-language-server
        rust-analyzer
        ruff
        jq
        nil
        black
        pyright
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

  programs.yazi = {
  enable = true;
  settings = {
    yazi = {
      ratio = [
        1
        4
        3
      ];
      sort_by = "natural";
      sort_sensitive = true;
      sort_reverse = false;
      sort_dir_first = true;
      linemode = "none";
      show_hidden = true;
      show_symlink = true;
    };

    preview = {
      image_filter = "lanczos3";
      image_quality = 90;
      tab_size = 1;
      max_width = 600;
      max_height = 900;
      cache_dir = "";
      ueberzug_scale = 1;
      ueberzug_offset = [
        0
        0
        0
        0
      ];
    };

    tasks = {
      micro_workers = 5;
      macro_workers = 10;
      bizarre_retry = 5;
    };
  };
}

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
