{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "tzn";
  home.homeDirectory = "/home/tzn";
  home.sessionVariables = {
    EDITOR = "vim";
    PATH = "$HOME/bin:$PATH";
    DOCKER_HOST = "unix://$XDG_RUNTIME_DIR/docker.sock";
  };

  home.file = {
    ".xvimrc" = {
      source = ../../.vimrc;
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";


  programs.go = {
    enable = false;
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    history = {
      ignoreDups = true;
    };
    initExtra = ''
    source ~/.nix-profile/etc/profile.d/nix.sh
    eval $(starship init zsh)
    '';
    shellAliases = {
      #ll = "ls --all --long  --group --classify --time-style=long-iso --git --group-directories-first";
      l = "ll";
      hms = "home-manager switch";
      ".." = "cd ..";
      gst = "git status --short --branch";
      gd = "git diff";
      gc = "git commit";
      gco = "git checkout";
      ga = "git add";
      gp = "git push";
    };
  };

  programs.skim = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.exa = {
    enable = true;
    enableAliases = true;
  };
  
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      gruvbox-nvim
      nvim-treesitter
      telescope-nvim
      vim-fugitive
      vim-nix
    ];
    extraConfig = ''
    set cc=80
    set number
    colorscheme gruvbox
    '';
  };

  home.packages = with pkgs; [
    alacritty
    docker
    gh
    hexyl
    htop
    i3
    i3lock-fancy
    i3status-rust
    iosevka
    mosh
    ripgrep
    skim
    starship
    stow
    sway
    swaylock
    tmux
    xplr
  ];

  xsession = {
    windowManager = {
      command = "i3";
    };
  };

  wayland = {
    # enable = true;
    windowManager.sway = {
      # wrapperFeatures.gtk = true;
      enable = true;
      extraConfig = builtins.readFile ../../.config/i3/config;
      config = null;
      # config1 = {
      #   # keybindings = {};
      #   fonts = {
      #     names = [ "Iosevka Term Slab" ];
      #     size = 12.0;
      #   };
      #   colors = {
      #     focused = {
      #       border = "#cc241d";
      #       background = "#cc241d";
      #       text = "#cc241d";
      #       indicator = "#cc241d";
      #       childBorder = "#cc241d";
      #     };
      #   };
      #   bars = [
      #     {
      #       statusCommand = "i3status-rs";
      #       position = "top";
      #       colors = {
      #         separator = "#98971a";
      #       };
      #     }
      #   ];
      # };
    };
  };
}
