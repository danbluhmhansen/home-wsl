{ pkgs, devenv, ... }: {
  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "danbluhmhansen";
  home.homeDirectory = "/home/danbluhmhansen";

  # This value determines the Home Manager release that your configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards incompatible changes.

  # You should not change this value, even if you update Home Manager. If you do want to update the value, then make
  # sure to first check the Home Manager release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your environment.
  home.packages = [
    devenv.packages.${pkgs.system}.devenv
    pkgs.cachix

    pkgs.fd
    pkgs.sd
    pkgs.xh

    pkgs.openssh
    pkgs.libfido2

    pkgs.prs

    pkgs.bartib
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage plain files is through 'home.file'.
  home.file = {
    ".config/zellij/layouts/dev.kdl".source = zellij/layouts/dev.kdl;
  };

  services.ssh-agent.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.bash.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
    environmentVariables = {
      BARTIB_FILE = "/home/danbluhmhansen/activities.bartib";
    };
    shellAliases = {
      ll = "ls -l";
    };
    extraConfig = ''
      use ${pkgs.nu_scripts}/share/nu_scripts/themes/nu-themes/catppuccin-mocha.nu
      $env.config.color_config = (catppuccin-mocha)

      source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/btm/btm-completions.nu
      source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/cargo/cargo-completions.nu
      source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/gh/gh-completions.nu
      source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/git/git-completions.nu
      source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/nix/nix-completions.nu
      source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/rustup/rustup-completions.nu
      source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/zellij/zellij-completions.nu
    '';
  };

  programs.carapace.enable = true;

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$directory$git_status $character";
      right_format = "$all";
      directory = {
        format = "[$path]($style)[$read_only]($read_only_style)";
        read_only = " 󰌾";
      };
      git_status.format = "[$all_status$ahead_behind]($style)";
    };
  };

  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [batdiff batman batgrep batwatch];
    config.theme = "catppuccin-mocha";
    themes = {
      catppuccin-mocha = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
          sha256 = "6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
        };
        file = "Catppuccin-mocha.tmTheme";
      };
    };
  };

  programs.ripgrep.enable = true;

  programs.git = {
    enable = true;
    userEmail = "00.pavers_dither@icloud.com";
    userName = "Dan Bluhm Hansen";
    signing = {
      key = "0x077BBC8A99A747DD";
      signByDefault = true;
    };
    extraConfig = {
      diff.algorithm = "histogram";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
    delta = {
      enable = true;
      options = {
        side-by-side = true;
      };
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.gitui = {
    enable = true;
    keyConfig = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/extrawurst/gitui/8f7f35b8a97e38a0e181032285554cd0961d588e/vim_style_key_config.ron";
      hash = "sha256-cAh+OufbYUve7aei4MncUKrIGH0lzUxHqa9ebN5MwMA=";
    };
    theme = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/gitui/ce0d073676dc96d005f7b91368e5cd565d840104/theme/mocha.ron";
      hash = "sha256-i0WUnSoi9yL+OEgn5b2w7f9bqVYzBkt9zNaysSJAYLY=";
    };
  };

  programs.bottom.enable = true;
}
