{ config, pkgs, lib, ... }:

let
  theme = {
    bg = "#282828";
    fg = "#ebdbb2";

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
    black = "#000000";
  }; 
in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      i3Support = true;
      alsaSupport = true;
      iwSupport = true;
      githubSupport = true;
    };
    config = {
      "bar" = {
        fill = "═";
        indicator = "╣";
        empty = "─";
      };
      "bar/top" = {
        height = "50";
        width = "100%";

        background = theme.black;
        foreground = theme.fg;

        font-0 = "Iosevka Nerdfont:size=18;3";
        #font-1 = "Inconsolata Nerdfont Mono:size=18";
        modules-left = "i3";
        modules-center = "date time";
        modules-right = "bluetooth wifi backlight volume cpu memory battery";
        enable-ipc = true;
        line-size = 6;
        line-color = theme.red;

        module-margin-left = 1;
        module-margin-right = 1;

        border-top-size = 10;
        border-top-color = theme.black;

        border-bottom-size = 10;
        border-bottom-color = theme.black;

        padding = 2;

        scroll-up = "#i3.prev";
        scroll-down = "#i3.next";
      };
      "module/volume" = {
        type = "internal/alsa";
        interval = 5;

        master-soundcard = "default";
        speaker-soundcard = "default";
        headphone-soundcard = "default";
        master-mixer = "Master";

        format-volume = "<label-volume><bar-volume>";
        format-volume-background = theme.bg;
        format-volume-padding = 2;
        format-folume-prefix = "󰕾 ";

        label-volume = "%percentage%%";
        label-volume-padding = 1;

        bar-volume-width = 10;
        bar-volume-indicator = ''
          ''${bar.indicator}
        '';
        bar-volume-empty = ''
          ''${bar.empty}
        '';
        bar-volume-fill = ''
          ''${bar.fill}
        '';
      };
      "module/date" = {
        type = "internal/date";
        internal = 5;
        date = "%Y-%m-%d %a";
        label = "%date%";
        label-padding = 1;
        label-background = theme.bg;
        format-prefix = "󰸗 ";
        format-prefix-background = theme.yellow;
        format-prefix-padding = 1;
      };
      "module/time" = {
        type = "internal/date";
        internal = 5;
        time = "%H:%M:%S";
        label = "%time%";
        label-padding = 1;
        label-background = theme.bg;
        format-prefix = " ";
        format-prefix-background = theme.yellow;
        format-prefix-padding = 1;
      };
      "module/player" = {
        type = "custom/script";
        exec = "/home/tzn/.nix-profile/bin/playerctl metadata artist";
        interval = 3;
        click-left = "/home/tzn/.nix-profile/bin/playerctl play-pause &";
      };
      "module/bluetooth" = {
        type = "custom/script";
        exec = "/bin/sh ~/bluetooth.sh";
        interval = 3;
        click-left = "exec blueberry";
      };
      "module/wifi" = {
        type = "internal/network";
        interface = "wlp9s0";
        interval = 1;

        click-left = "gnome-control-center";

        format-connected = "<label-connected>";
        format-connected-prefix = "󰖩 ";
        format-connected-prefix-background = theme.blue;
        format-connected-prefix-padding = 1;
        label-connected = "%signal:3%% %essid%";
        label-connected-padding = 1;
        label-connected-background = theme.bg;

        format-disconnected = "<label-disconnected>";
        format-disconnected-prefix = "󰖪 ";
        format-disconnected-prefix-background = theme.gray;
        format-disconnected-prefix-padding = 1;
        label-disconnected = "---";
        label-disconnected-padding = 1;
        label-disconnected-background = theme.bg;
      };
      "module/backlight" = {
        type = "internal/backlight";
        card = "intel_backlight";
        format = "<label><ramp>";
        format-prefix = "󰃝 ";
        format-prefix-background = theme.purple;
        format-prefix-padding = 1;
        label = "%percentage:3%%";
        label-padding = 1;
        label-background = theme.bg;
        # https://wiki.archlinux.org/title/Backlight#ACPI
        enable-scroll = true;
        ramp-0 = "🌕";
        ramp-1 = "🌔";
        ramp-2 = "🌓";
        ramp-3 = "🌒";
        ramp-4 = "🌑";
        ramp-padding = 1;
        ramp-background = theme.bg;
      };
      "module/battery" = {
        type = "internal/battery";
        full-at = 99;
        battery = "BAT0";
        adapter = "AC";
        poll-interval = 2;

        label-background = theme.bg;

        bar-capacity-width = 10;
        bar-capacity-indicator = ''
          ''${bar.indicator}
        '';
        bar-capacity-empty = ''
          ''${bar.empty}
        '';
        bar-capacity-fill = ''
          ''${bar.fill}
        '';

        format-full = "<label-full><bar-capacity> ";
        format-full-background = theme.bg;
        format-full-prefix = "󰁹";
        format-full-prefix-padding = 1;
        format-full-prefix-background = theme.green;
        label-full = "%percentage:3%%";
        label-full-padding = 1;

        format-charging = "<label-charging><bar-capacity>";
        format-charging-background = theme.bg;
        format-charging-prefix = "󰂄";
        format-charging-prefix-background = theme.green;
        format-charging-prefix-padding = 1;
        label-charging = "%percentage:3%%";
        label-charging-padding = 1;
        label-charging-prefix-background = theme.orange;

        format-discharging = "<ramp-capacity><label-discharging><bar-capacity>";
        label-discharging = "%percentage:3%%";
        format-discharging-prefix-background = theme.red;

        animation-charging-0 = "";
        animation-charging-1 = "";
        animation-charging-2 = "";
        animation-charging-3 = "";
        animation-charging-4 = "";
        animation-charging-framerate = 750;

        ramp-capacity-0 = " ";
        ramp-capacity-1 = " ";
        ramp-capacity-2 = " ";
        ramp-capacity-3 = " ";
        ramp-capacity-4 = " ";
        ramp-capacity-padding = 1;
        ramp-capacity-background = theme.red;
      };
      "module/memory" = {
        type = "internal/memory";
        interval = 1;

        label = "%percentage_used:3%% [%gb_used% / %gb_total%]";
        format-background = theme.bg;
        format-prefix = "󰍛 ";
        format-prefix-background = theme.yellow;
        format-prefix-padding = 1;
      };
      "module/cpu" = {
        type = "internal/cpu";
        interval = 1;

        format = "<label><bar-load> ";
        format-background = theme.bg;
        format-prefix = "󰻠 ";
        format-prefix-background = theme.green;
        format-prefix-padding = 1;

        label = "%percentage:3%%";
        label-padding = 1;

        bar-load-width = 10;
        bar-load-indicator = ''
          ''${bar.indicator}
        '';
        bar-load-empty = ''
          ''${bar.empty}
        '';
        bar-load-fill = ''
          ''${bar.fill}
        '';
      };
      "module/i3" = {
        type = "internal/i3";

        format = "<label-state><label-mode>";
        format-prefix = " ";
        format-prefix-background = theme.purple;
        format-prefix-padding = 1;

        label-mode = "%mode%";
        label-mode-padding = 1;

        label-focused = "%name%";
        label-focused-foreground = theme.white;
        label-focused-background = theme.orange;
        # label-focused-underline = theme.white;
        label-focused-padding = 1;

        label-unfocused = "%name%";
        label-unfocused-background = theme.bg;
        label-unfocused-padding = 1;

        label-urgent = "%name%";
        label-urgent-background = theme.red;
        label-urgent-padding = 1;
      };
    };
    script = "polybar top &";
  };

  services.autorandr = {
    enable = true;
  };

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "tzn";
  home.homeDirectory = "/home/tzn";
  home.sessionVariables = {
    EDITOR = "vim";
    PATH = "$HOME/bin:$HOME/.local/bin:$PATH";
    DOCKER_HOST = "unix://$XDG_RUNTIME_DIR/docker.sock";
  };

  home.file = {
    ".xvimrc" = {
      source = ../../.vimrc;
    };
    "bluetooth.sh" = {
      # https://github.com/msaitz/polybar-bluetooth/blob/44ae51f5d78e7e26810a59eaaf381f7bee887585/bluetooth.sh
      text = ''
      #!/bin/sh
      /bin/bluetoothctl info | /bin/grep 'Name' | /bin/cut -d' ' -f2
      '';
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
    settings = {
      window.dimensions = {
        lines = 3;
        columns = 100;
      };
      font = {
        normal.family = "Iosevka";
        bold.family = "Iosevka";
      };
      # https://github.com/alacritty/alacritty-theme/blob/914f463390b660e99731f93a6ad9493918cd5d13/themes/gruvbox_dark.yaml
      colors = {
        primary = {
          background = theme.bg;
          foreground = theme.fg;
        };
        normal = {
          black = theme.black;
          red = theme.red;
          green = theme.green;
          yellow = theme.yellow;
          blue = theme.blue;
          magenta = theme.purple;
          cyan = theme.aqua;
          white = theme.white;
        };
        bright = {
          black = theme.gray;
          red = theme.bright_red;
          green = theme.bright_green;
          yellow = theme.bright_yellow;
          blue = theme.bright_blue;
          magenta = theme.bright_purple;
          cyan = theme.bright_aqua;
          white = theme.white;
        };
      };
      draw_bold_text_with_bright_colors = false;
      bell = {
        animation = "EaseOutExpo";
        color = "#ffffff";
        duration = 0;
      };
    };
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
    syntaxHighlighting = {
      enable = true;
    };
    history = {
      ignoreDups = true;
    };
    initExtra = ''
    source ~/.nix-profile/etc/profile.d/nix.sh
    [[ -f ~/local.zshrc ]] && source ~/local.zshrc

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
      ls = "${pkgs.eza}/bin/eza";
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
      archive = "rsync --progress --recursive --verbose --size-only --times";
      archive_dry = "archive --dry-run";
      rid = "printf \"%020lu\n\" \"0x$(openssl rand -hex 8)\"";
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
    fonts = [
      "xft:Iosevka Nerd Font:size=9"
    ];
    iso14755 = false;
    keybindings = {
      "Shift-Control-C" = "eval:selection_to_clipboard";
      "Shift-Control-V" = "eval:paste_clipboard";
    };
    scroll = {
      bar = {
        enable = true;
        style = "rxvt";
      };
    };
    extraConfig = {
      "perl-ext" = "default,matcher";
      "url-launcher" = " google-chrome";
      "matcher.button" = "Ctrl-1";
      "matcher.pattern.1" = "\\bwww\\.[\\w-]+\\.[\\w./?&@#-]*[\\w/-]";
    };
  };

  programs.skim = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableAliases = false;
  };
  programs.lsd = {
    enable = true;
    enableAliases = false;
  };
  
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      cmp-rg
      gitsigns-nvim
      gruvbox-nvim
      neo-tree-nvim
      null-ls-nvim
      nvim-treesitter
      telescope-nvim
      vim-commentary
      #vim-fugitive
      vim-nix
    ];
    extraConfig = ''
      set cc=80
      set number
      set ignorecase
      set smartcase
      set cursorline
      set undofile
      nmap <C-/> <Plug>CommentaryLine
      xmap <C-/> <Plug>Commentary

      " Scroll up / down
      nmap J <C-d>
      nmap K <C-u>

      " Next / prev word
      nmap H b
      nmap L w

      colorscheme gruvbox
      autocmd BufWinLeave *.* mkview
      autocmd BufWinEnter *.* silent! loadview
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      custom.jj = {
        command = "prompt";
        format = "$output";
        ignore_timeout = true;
        foo = "x";
        shell = [
          "${pkgs.starship-jj}/bin/starship-jj"
          "--ignore-working-copy"
          "starship"
        ];
        use_stdin = false;
        when = true;
      };
    }
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

  programs.autorandr = {
    enable = true;
  };

  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        settings = {
          theme = {
            #name = "gruvbox-dark";
            overrides = {
              separator = "";
            };
          };
          block = [
            {
              block = "cpu";
              interval = 1;
            }
            {
              block = "memory";
              interval = 1;
            }
            {
              block = "disk_space";
              path = "/";
              alias = "/";
              info_type = "available";
              unit = "GB";
              interval = 20;
              warning = 20.0;
              alert = 10.0;
            }
            {
              block = "net";
              device = "wlp9s0";
              format = "{ssid} {signal_strength} {ip} {speed_down} {graph_down}";
            }
            {
              block = "net";
            }
            {
              block = "battery";
              format = "{percentage}% {time}";
            }
            {
              block = "sound";
            }
            {
              block = "time";
              interval = 11;
              format = "%a %Y-%m-%d %R";
            }
          ];
        };
      };
    };
  };

  fonts.fontconfig = {
    enable = true;
  };

  home.packages = with pkgs; [
    #alacritty
    alsa-lib
    arandr
    asciinema
    bluez
    bluez-tools
    cachix
    cloc
    # conda
    # docker
    gh
    hexyl
    htop
    i3lock-fancy
    inconsolata-nerdfont
    iosevka
    (pkgs.nerdfonts.override { fonts = [ "Iosevka" ]; } )
    jujutsu
    just
    mosh
    networkmanager_dmenu
    nixgl.nixGLIntel
    nix-tree
    #polybar
    playerctl
    pprof
    #python3
    # python39Packages.conda
    ranger
    ripgrep
    streamdeck-ui

    rustc
    cargo

    skim
    stow
    sway
    swaylock
    # terraform
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

      "*background" = theme.bg;
      "*foreground" = theme.fg;
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
          mode_system = "System (l) lock, (e) logout, (s) suspend, (h) hibernate, (shift+r) reboot, (shift+s) shutdown";
        in
        {
          enable = true;
          extraConfig = ''
             # set $mode_system "System (l) lock, (e) logout, (s) suspend, (h) hibernate, (shift+r) reboot, (shift+s) shutdown"
          '';
          config = let cfg = config.xsession.windowManager.i3; in {
            fonts = lib.mkOptionDefault {
              names = [ "Iosevka" ];
              size = 11.0;
            };
            window = lib.mkOptionDefault {
              border = 6;
            };
            workspaceAutoBackAndForth = true;
            terminal = "nixGLIntel alacritty";
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
                "l" = "exec /usr/share/goobuntu-desktop-files/xsecurelock.sh; exec sleep 1; mode default";
                "e" = "exec i3-msg exit";
                "s" = "exec /usr/share/goobuntu-desktop-files/xsecurelock.sh; exec sleep 1; exec systemctl suspend; mode default";
                "h" = "exec /usr/share/goobuntu-desktop-files/xsecurelock.sh; exec sleep 1; exec systemctl hibernate; mode default";
                "Shift+r" = "exec systemctl reboot";
                "Shift+s" = "exec systemctl poweroff";
                "Escape" = "mode default";
                "Return" = "mode default";
              };
            };
            bars = [
              {
                statusCommand = "i3status-rs /home/tzn/.config/i3status-rust/config-top.toml";
                position = "top";
                workspaceNumbers = true;
                colors = {
                  separator = "#98971a";
                };
              }
            ];
            keybindings = lib.mkOptionDefault {
              "${cfg.config.modifier}+p" = "exec ${cfg.config.menu}";
              "${cfg.config.modifier}+c" = "exec google-chrome --password-store=gnome";
              "${cfg.config.modifier}+g" = "exec gnome-control-center";

              "${cfg.config.modifier}+space" = "layout toggle splitv splith stacking";
              "${cfg.config.modifier}+n" = "exec i3-input -F 'rename workspace to \"%s\"' -P 'New name for this workspace: '";

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
