{ config, pkgs, lib, ... }:

let
  theme = {
    bg = "#282828";

    red = "#cc241d";
    green = "#98971a";
    yellow = "#d79921";
    blue = "#458588";
    purple = "#b16286";
    aqua = "#689d68";
    orange = "#fe8019";

    bright_red = "#fb4934";
    bright_green = "#b8bb26";
    bright_yellow = "#fabd2f";
    bright_blue = "#83a598";
    bright_purple = "#d3869b";
    bright_aqua = "#8ec07c";
    bright_orange = "#fe8019";

    gray = "#a89984";

    darkgray = "#1d2021";

    light1 = "#ebdbb2";
    light2 = "#d5c4a1";
    light3 = "#bdae93";
    light4 = "#a89984";

    white = "#ffffff";
  }; 
in
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

  programs.alacritty = {
    enable = true;
  };

  programs.go = {
    enable = false;
  };

  programs.direnv = {
    enable = true;
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
    function find_git_branch() {
      RBUFFER=$(git branch --verbose --sort=-committerdate | cut -b'3-' | sk --preview="git show --color=always {2}" | cut -d' ' -f1)
      CURSOR=$#BUFFER         # move cursor
      zle -R -c               # refresh
    }
    zle -N find_git_branch
    bindkey '^B' find_git_branch

    autoload -U up-line-or-beginning-search
    autoload -U down-line-or-beginning-search
    zle -N up-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey '\e[A' up-line-or-beginning-search
    bindkey '\e[B' down-line-or-beginning-search
    work() { tmx2 new-session -A -s ''${1:-work}; }
    '';
    shellAliases = {
      ls = "${pkgs.exa}/bin/exa";
      ll = "ls --all --long  --group --classify --time-style=long-iso --git --group-directories-first";
      l = "ll";
      hms = "home-manager --flake ~/src/dotfiles/home-manager --impure switch";
      ".." = "cd ..";
      gst = "git status --short --branch";
      gd = "git diff";
      gc = "git commit";
      gco = "git checkout";
      ga = "git add";
      gp = "git push";
      # sudo apt install libnss-sss
      # https://github.com/NixOS/nixpkgs/issues/64666
      # alacritty = "";
    };
  };

  programs.dircolors = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zellij = {
    enable = true;
  };

  programs.urxvt = {
    enable = true;
    fonts = [ "xft:Iosevka:size=9" ];
  };

  programs.skim = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.exa = {
    enable = true;
    enableAliases = false;
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

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.gnome-terminal = {
    enable = false;
    profile = {
      "gruvbox" = {
        default = true;
        visibleName = "gruvbox1";
        colors = {
          backgroundColor = theme.bg;
          foregroundColor = theme.yellow;
          palette = [
            theme.bg
            theme.red
          ];
        };
      };
    };
  };

  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        settings = {
          theme = "gruvbox-dark";
          blocks = [
            {
              block = "cpu";
              interval = 1;
            }
            {
              block = "battery";
              interval = 1;
            }
            {
              block = "wireless";
              interval = 1;
            }
          ];
        };
      };
      bottom = {
        settings = {
          theme = "gruvbox-dark";
        };
      };
    };
  };

  fonts.fontconfig = {
    enable = true;
  };

  home.packages = with pkgs; [
    #alacritty
    arandr
    # docker
    gh
    hexyl
    htop
    i3lock-fancy
    iosevka
    just
    mosh
    nixgl.nixGLIntel
    ranger
    ripgrep
    skim
    stow
    sway
    swaylock
    terraform
    tmux
    xplr
  ];

  xresources = {
    properties = {
      # https://unix.stackexchange.com/questions/267885/how-do-i-scale-i3-window-manager-for-my-hidpi-display
      "Xft.antialias" = true;
      "Xft.autohint" = false;
      "Xft.hinting" = true;
      "Xft.rgba" = "rgb";
      "Xft.hintstyle" = "hintfull";
      # "Xft.dpi" = "220";
      "Xft.dpi" = "192";

      # https://github.com/morhetz/gruvbox-contrib/blob/master/color.table
      "*background" = theme.bg;
      "*foreground" = theme.white;
      "*color0" = theme.bg;
      "*color1" = theme.red;
      "*color2" = theme.green;
      "*color3" = theme.yellow;
      "*color4" = theme.blue;
      "*color5" = theme.purple;
      "*color6" = theme.aqua;
      "*color7" = theme.light4;
      "*color8" = theme.gray;
      "*color9" = theme.bright_red;
      "*color10" = theme.bright_green;
      "*color11" = theme.bright_yellow;
      "*color12" = theme.bright_blue;
      "*color13" = theme.bright_purple;
      "*color14" = theme.bright_aqua;
      "*color15" = theme.light1;
    };
  };

  xsession = {
    enable = true;
    windowManager = {
      i3 =
        let
          mode_system = "System (l) lock, (e) logout, (s) suspend, (h) hibernate, (r) reboot, (Shift+s) shutdown";
        in
        {
          enable = true;
          extraConfig = ''
             # set $mode_system "System (l) lock, (e) logout, (s) suspend, (h) hibernate, (r) reboot, (Shift+s) shutdown"
          '';
          config = let cfg = config.xsession.windowManager.i3; in {
            fonts = lib.mkOptionDefault {
              names = [ "Iosevka" ];
              size = 11.0;
            };
            window = lib.mkOptionDefault {
              border = 6;
            };
            terminal = "urxvt";
            colors = lib.mkOptionDefault {
              background = theme.bg;
              focused = {
                border = theme.red;
                background = theme.red;
                text = theme.white;
                indicator = theme.purple;
                childBorder = theme.red;
              };
              focusedInactive = {
                border = theme.yellow;
                background = theme.yellow;
                text = theme.darkgray;
                indicator = theme.purple;
                childBorder = theme.yellow;
              };
              unfocused = {
                border = theme.darkgray;
                background = theme.darkgray;
                text = theme.yellow;
                indicator = theme.purple;
                childBorder = theme.darkgray;
              };
              urgent = {
                border = theme.purple;
                background = theme.purple;
                text = theme.white;
                indicator = theme.purple;
                childBorder = theme.purple;
              };
            };
            modes = {
              resize = {
                "h" = "resize shrink width 10 px or 10 ppt";
                "j" = "resize grow height 10 px or 10 ppt";
                "k" = "resize shrink height 10 px or 10 ppt";
                "l" = "resize grow width 10 px or 10 ppt";
                "Escape" = "mode default";
                "Return" = "mode default";
              };
              ${mode_system} = {
                "l" = "exec /usr/share/goobuntu-desktop-files/xsecurelock.sh; mode default";
                "e" = "exec i3-msg exit";
                "s" = "exec /usr/share/goobuntu-desktop-files/xsecurelock.sh; exec systemctl suspend; mode default";
                "h" = "exec /usr/share/goobuntu-desktop-files/xsecurelock.sh; exec systemctl hibernate; mode default";
                "r" = "exec systemctl reboot";
                "Shift+s" = "exec systemctl poweroff";
                "Escape" = "mode default";
                "Return" = "mode default";
              };
            };
            bars = [
              {
                statusCommand = "i3status-rs /home/tzn/.config/i3status-rust/config-top.toml";
                position = "top";
                colors = {
                  separator = "#98971a";
                };
              }
              {
                statusCommand = "i3status-rs /home/tzn/.config/i3status-rust/config-bottom.toml";
                position = "bottom";
                colors = {
                  separator = "#98971a";
                };
              }
            ];
            keybindings = lib.mkOptionDefault {
              "${cfg.config.modifier}+p" = "exec ${cfg.config.menu}";
              "${cfg.config.modifier}+c" = "exec google-chrome --password-store=gnome";

              "${cfg.config.modifier}+h" = "focus left";
              "${cfg.config.modifier}+j" = "focus down";
              "${cfg.config.modifier}+k" = "focus up";
              "${cfg.config.modifier}+l" = "focus right";

              "${cfg.config.modifier}+u" = "workspace prev_on_output";
              "${cfg.config.modifier}+i" = "workspace next_on_output";

              "${cfg.config.modifier}+Shift+h" = "move left";
              "${cfg.config.modifier}+Shift+j" = "move down";
              "${cfg.config.modifier}+Shift+k" = "move up";
              "${cfg.config.modifier}+Shift+l" = "move right";

              "${cfg.config.modifier}+Shift+p" = "exec xsecurelock";

              "${cfg.config.modifier}+y" = "mode \"${mode_system}\"";
            };
          };
        };
    };
  };

  #wayland = {
    # enable = true;
  #  windowManager.sway = {
      # wrapperFeatures.gtk = true;
  #    enable = true;
  #    extraConfig = builtins.readFile ../../.config/i3/config;
  #    config = null;
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
  #  };
  #};
}
