{ config, pkgs, ... }:

let
  # theme = import ./theme.nix;
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
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tzn";
  home.homeDirectory = "/Users/tzn";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

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
    # '')    #alacritty
    arandr
    asciinema
    cachix
    cloc
    cosign
    difftastic
    # conda
    # docker
    gh
    go
    hexyl
    htop
    iosevka
    # (pkgs.nerdfonts.override { fonts = [ "Iosevka" ]; } )
    pkgs.nerd-fonts.inconsolata
    pkgs.nerd-fonts.iosevka
    jujutsu
    just
    mosh
    nix-tree
    #polybar
    pprof
    protobuf
    #python3
    # python39Packages.conda
    ranger
    ripgrep

    rustc
    cargo

    skim
    stow
    # terraform
    tmux
    xplr

    jj-starship
    starship-jj
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
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/tzn/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.difftastic.enable = true;

  programs.alacritty = {
    enable = true;
    settings = {
      shell = {
        program = "${pkgs.zsh}/bin/zsh";
        args = ["-l"];
      };
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
        draw_bold_text_with_bright_colors = false;
      };
      bell = {
        animation = "EaseOutExpo";
        color = "#ffffff";
        duration = 0;
      };
    };
  };

  programs.git = {
    enable = true;
    settings = {
      difftastic = {
        background = "dark";
        display = "side-by-side";
      };
      aliases = {
        st = "status";
        co = "checkout";
        br = "branch";
        ci = "commit";
        di = "diff";
        lg = "log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";
        cl = "!f() { git push origin HEAD:refs/for/\${1:-main}; }; f";
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
    # autosuggestions = {
    #   enable = true;
    # };
    enableCompletion = true;
    syntaxHighlighting = {
      enable = true;
    };
    history = {
      ignoreDups = true;
    };
    initContent = ''
    source /nix/var/nix/profiles/default/etc/profile.d/nix.sh
    source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
    source ~/.nix-profile/etc/profile.d/nix.sh
    [[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
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
      # ls = "${pkgs.eza}/bin/eza";
      # ll = "ls --all --long  --group --classify --time-style=long-iso --git --group-directories-first";
      l = "ll";
      hms = "home-manager switch --flake ~/src/dotfiles/home-manager";
      ".." = "cd ..";
      gst = "git status --short --branch";
      gd = "git diff";
      gc = "git commit";
      gco = "git checkout";
      ga = "git add";
      gp = "git push";
      archive = "rsync --progress --recursive --verbose --size-only --times";
      archive_dry = "archive --dry-run";
      # sudo apt install libnss-sss
      # https://github.com/NixOS/nixpkgs/issues/64666
      # alacritty = "";
      uid = "printf \"%020lu\n\" \"0x$(openssl rand -hex 8)\"";
    };
  };

  programs.dircolors = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zellij = {
    enable = true;
  };

  programs.skim = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
  programs.lsd = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
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
    # cargo install starship-jj --locked
    # https://gitlab.com/lanastara_foss/starship-jj
    settings = {
      custom.jj = {
        format = "$output";
        ignore_timeout = true;
        shell = ["jj-starship" "--jj-symbol=jj "];
        when = "jj-starship detect";
      };
      git_branch = {
        disabled = true;
      };
      git_status = {
        disabled = true;
      };
    };
  };

  fonts.fontconfig = {
    enable = true;
  };

}
