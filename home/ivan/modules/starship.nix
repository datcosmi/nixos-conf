{
  pkgs,
  lib,
  ...
}: {
  programs.starship = {
    enable = true;

    settings = {
      "$schema" = "https://starship.rs/config-schema.json";

      # add_newline = false;

      format = lib.concatStrings [
        "[](pink)"
        "$os"
        "[](bg:surface0 fg:pink)"
        "$time"
        "[](fg:surface0 bg:peach)"
        "$directory"
        "[](fg:peach bg:teal)"
        "$git_branch"
        "$git_status"
        "[](fg:teal bg:blue)"
        "$c"
        "$rust"
        "$golang"
        "$nodejs"
        "$php"
        "$java"
        "$kotlin"
        "$haskell"
        "$python"
        "[](fg:blue bg:mauve)"
        "$docker_context"
        "[](fg:mauve)"
        "$line_break"
        "$character"
      ];

      palette = "catppuccin_mocha";

      palettes = {
        gruvbox_dark = {
          color_fg0 = "#fbf1c7";
          color_bg1 = "#3c3836";
          color_bg3 = "#665c54";
          color_blue = "#458588";
          color_aqua = "#689d6a";
          color_green = "#98971a";
          color_orange = "#d65d0e";
          color_purple = "#b16286";
          color_red = "#cc241d";
          color_yellow = "#d79921";
        };

        catppuccin_mocha = {
          white = "#ffffff";
          rosewater = "#f5e0dc";
          flamingo = "#f2cdcd";
          pink = "#f5c2e7";
          mauve = "#DBA6F7";
          orange = "#cba6f7";
          red = "#f38ba8";
          maroon = "#eba0ac";
          peach = "#FFB4A8";
          yellow = "#f9e2af";
          green = "#a6e3a1";
          teal = "#94e2d5";
          sky = "#89dceb";
          sapphire = "#74c7ec";
          blue = "#89b4fa";
          lapis = "#575BCF";
          lavender = "#b4befe";
          text = "#cdd6f4";
          subtext1 = "#bac2de";
          subtext0 = "#a6adc8";
          overlay2 = "#9399b2";
          overlay1 = "#7f849c";
          overlay0 = "#6c7086";
          surface2 = "#585b70";
          surface1 = "#45475a";
          surface0 = "#313244";
          base = "#1e1e2e";
          mantle = "#181825";
          crust = "#11111b";
        };
      };

      os = {
        disabled = false;
        style = "bg:pink fg:crust";

        symbols = {
          Windows = "󰍲";
          Ubuntu = "󰕈";
          SUSE = "";
          Raspbian = "󰐿";
          Mint = "󰣭";
          Macos = "";
          Manjaro = "";
          Linux = "󰌽";
          Gentoo = "󰣨";
          Fedora = "󰣛";
          Alpine = "";
          Amazon = "";
          Android = "";
          Arch = " 󰣇  ";
          NixOS = " 󱄅  ";
          Artix = "󰣇";
          CentOS = "";
          Debian = "󰣚";
          Redhat = "󱄛";
          RedHatEnterprise = "󱄛";
        };
      };

      username = {
        show_always = true;
        style_user = "bg:pink fg:crust";
        style_root = "bg:pink fg:crust";
        format = "[ $user ]($style)";
      };

      directory = {
        style = "fg:surface0 bg:peach bold";
        format = "[  $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";

        substitutions = {
          Documents = "󰈙 ";
          Downloads = " ";
          Music = "󰝚 ";
          Pictures = " ";
          Developer = "󰲋 ";
        };
      };

      git_branch = {
        symbol = " ";
        style = "bg:blue bold";
        format = "[[ $symbol $branch ](fg:surface0 bg:teal bold)]($style)";
      };

      git_status = {
        style = "bg:blue bold";
        format = "[[($all_status$ahead_behind )](fg:surface0 bg:teal)]($style)";
      };

      nodejs = {
        symbol = "";
        style = "bg:blue bold";
        format = "[[ $symbol( $version) ](fg:surface0 bg:blue bold)]($style)";
      };

      c = {
        symbol = " ";
        style = "bg:blue bold";
        format = "[[ $symbol( $version) ](fg:surface0 bg:blue bold)]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:blue bold";
        format = "[[ $symbol( $version) ](fg:surface0 bg:blue bold)]($style)";
      };

      golang = {
        symbol = "";
        style = "bg:blue bold";
        format = "[[ $symbol( $version) ](fg:surface0 bg:blue bold)]($style)";
      };

      php = {
        symbol = "";
        style = "bg:blue bold";
        format = "[[ $symbol( $version) ](fg:surface0 bg:blue bold)]($style)";
      };

      java = {
        symbol = " ";
        style = "bg:blue bold";
        format = "[[ $symbol( $version) ](fg:surface0 bg:blue bold)]($style)";
      };

      kotlin = {
        symbol = "";
        style = "bg:blue bold";
        format = "[[ $symbol( $version) ](fg:surface0 bg:blue bold)]($style)";
      };

      haskell = {
        symbol = "";
        style = "bg:blue bold";
        format = "[[ $symbol( $version) ](fg:surface0 bg:blue bold)]($style)";
      };

      python = {
        symbol = "";
        style = "bg:blue bold";
        format = "[[ $symbol( $version) ](fg:surface0 bg:blue bold)]($style)";
      };

      docker_context = {
        symbol = "";
        style = "bg:mantle";
        format = "[[ $symbol( $context) ](fg:surface bg:mauve)]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:peach";
        format = "[[  $time ](fg:pink bg:surface0)]($style)";
      };

      line_break.disabled = false;

      character = {
        disabled = false;
        success_symbol = "[](bold fg:green)";
        error_symbol = "[](bold fg:red)";
        vimcmd_symbol = "[](bold fg:green)";
        vimcmd_replace_one_symbol = "[](bold fg:purple)";
        vimcmd_replace_symbol = "[](bold fg:purple)";
        vimcmd_visual_symbol = "[](bold fg:lavender)";
      };
    };
  };
}
