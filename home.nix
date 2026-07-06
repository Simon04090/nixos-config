{ config, pkgs, username, ... }:
{

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
      nix-output-monitor
      jetbrains.clion
      jetbrains.pycharm
      jetbrains.rust-rover
  ];

  home.username = username;

  home.homeDirectory = "/home/${username}";

  programs = {
    google-chrome = {
      enable = true;
      plasmaSupport = true;
    };
    git = {
      enable = true;
      settings = {
        user = {
          name = "Simon Kammermeier";
          email = "simon.kammermeier@tum.de";
        };
      };
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    plasma = {
      enable = true;
      overrideConfig = true;

      workspace.colorScheme = "BreezeDark";

      fonts.fixedWidth = {
        family = "Liberation Mono";
        pointSize = 10;
        #",-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      };

      kwin.nightLight.enable = true;
      input = {
        keyboard = {
          layouts = [
            {
            layout = "de";
            variant = "nodeadkeys";
            }
          ];
          model = "pc105";
        };
        touchpads = [{
            vendorId = "06CB";
            productId = "CE68";
            name = "SYNA8024:00 06CB:CE68 Touchpad";
            naturalScroll = true;

        }];
      };

      powerdevil.lowBattery = {
        dimKeyboard = {
          enable = true;

        };
        keyboardBrightness = 0;
        powerProfile = "powerSaving";
      };

      panels = [
      # Windows-like panel at the bottom
      {
        location = "bottom";
        screen = "all";
        widgets = [
          # Or you can configure the widgets by adding the widget-specific options for it.
          # See modules/widgets for supported widgets and options for these widgets.
          # For example:
          "org.kde.plasma.kickoff"
          "org.kde.plasma.pager"
          "org.kde.plasma.icontasks"
          "org.kde.plasma.marginsseparator"
          {
            systemTray.items = {
              # We explicitly show bluetooth and battery
              extra = [
                "org.kde.plasma.cameraindicator"
                "org.kde.plasma.manage-inputmethod"
                "org.kde.plasma.clipboard"
                "org.kde.plasma.keyboardlayout"
                "org.kde.plasma.notifications"
                "org.kde.plasma.mediacontroller"
                "org.kde.plasma.devicenotifier"
                "org.kde.plasma.battery"
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.brightness"
                "org.kde.plasma.keyboardindicator"
                "org.kde.plasma.volume"
                "org.kde.kscreen"
                "org.kde.plasma.weather"
                "org.kde.plasma.printmanager"
                "org.kde.plasma.bluetooth"
              ];
            };
          }
          "org.kde.plasma.digitalclock"
          "org.kde.plasma.showdesktop"
        ];
      }
    ];

      shortcuts = {
#         "KDE Keyboard Layout Switcher"."Switch to Last-Used Keyboard Layout" = "Meta+Alt+L";
#         "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = "Meta+Alt+K";
#         kmix.decrease_microphone_volume = "Microphone Volume Down";
#         kmix.decrease_volume = "Volume Down";
#         kmix.decrease_volume_small = "Shift+Volume Down";
#         kmix.increase_microphone_volume = "Microphone Volume Up";
#         kmix.increase_volume = "Volume Up";
#         kmix.increase_volume_small = "Shift+Volume Up";
#         kmix.mic_mute = ["Microphone Mute" "Meta+Volume Mute"];
#         kmix.mute = "Volume Mute";
#         ksmserver."Lock Session" = ["Meta+L" "Screensaver"];
#         ksmserver."Log Out" = "Ctrl+Alt+Del";
#         kwin.ClearLastMouseMark = "Meta+Shift+F12";
#         kwin.ClearMouseMarks = "Meta+Shift+F11";
#         kwin.Expose = "Ctrl+F9";
#         kwin.ExposeAll = ["Ctrl+F10" "Launch (C)"];
#         kwin.ExposeClass = "Ctrl+F7";
#         kwin."Grid View" = "Meta+G";
#         kwin."Kill Window" = "Meta+Ctrl+Esc";
#         kwin.MinimizeAll = "Meta+Shift+D";
#         kwin.MoveMouseToCenter = "Meta+F6";
#         kwin.MoveMouseToFocus = "Meta+F5";
#         kwin.Overview = "Meta+W";
#         kwin."Show Desktop" = "Meta+D";
#         kwin."Switch One Desktop Down" = "Meta+Ctrl+Down";
#         kwin."Switch One Desktop Up" = "Meta+Ctrl+Up";
#         kwin."Switch One Desktop to the Left" = "Meta+Ctrl+Left";
#         kwin."Switch One Desktop to the Right" = "Meta+Ctrl+Right";
#         kwin."Switch Window Down" = "Meta+Alt+Down";
#         kwin."Switch Window Left" = "Meta+Alt+Left";
#         kwin."Switch Window Right" = "Meta+Alt+Right";
#         kwin."Switch Window Up" = "Meta+Alt+Up";
#         kwin."Switch to Desktop 1" = "Ctrl+F1";
#         kwin."Switch to Desktop 2" = "Ctrl+F2";
#         kwin."Switch to Desktop 3" = "Ctrl+F3";
#         kwin."Switch to Desktop 4" = "Ctrl+F4";
#         kwin."Walk Through Windows" = ["Meta+Tab" "Alt+Tab"];
#         kwin."Walk Through Windows (Reverse)" = ["Meta+Shift+Tab" "Alt+Shift+Tab"];
#         kwin."Walk Through Windows Alternative" = [ ];
#         kwin."Walk Through Windows Alternative (Reverse)" = [ ];
#         kwin."Walk Through Windows of Current Application" = ["Meta+`" "Alt+`"];
#         kwin."Walk Through Windows of Current Application (Reverse)" = ["Meta+~" "Alt+~"];
#         kwin."Window Close" = "Alt+F4";
#         kwin."Window Maximize" = "Meta+PgUp";
#         kwin."Window Minimize" = "Meta+PgDown";
#         kwin."Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
#         kwin."Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
#         kwin."Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left";
#         kwin."Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right";
#         kwin."Window Operations Menu" = "Alt+F3";
#         kwin."Window Quick Tile Bottom" = "Meta+Down";
#         kwin."Window Quick Tile Left" = "Meta+Left";
#         kwin."Window Quick Tile Right" = "Meta+Right";
#         kwin."Window Quick Tile Top" = "Meta+Up";
#         kwin."Window to Next Screen" = "Meta+Shift+Right";
#         kwin."Window to Previous Screen" = "Meta+Shift+Left";
#         kwin.disableInputCapture = "Meta+Shift+Esc";
#         kwin.view_actual_size = "Meta+0";
#         kwin.view_zoom_in = ["Meta++" "Meta+="];
#         kwin.view_zoom_out = "Meta+-";
#         mediacontrol.nextmedia = "Media Next";
#         mediacontrol.pausemedia = "Media Pause";
#         mediacontrol.playpausemedia = "Media Play";
#         mediacontrol.previousmedia = "Media Previous";
#         mediacontrol.stopmedia = "Media Stop";
#         org_kde_powerdevil."Decrease Keyboard Brightness" = "Keyboard Brightness Down";
#         org_kde_powerdevil."Decrease Screen Brightness" = "Monitor Brightness Down";
#         org_kde_powerdevil."Decrease Screen Brightness Small" = "Shift+Monitor Brightness Down";
#         org_kde_powerdevil.Hibernate = "Hibernate";
#         org_kde_powerdevil."Increase Keyboard Brightness" = "Keyboard Brightness Up";
#         org_kde_powerdevil."Increase Screen Brightness" = "Monitor Brightness Up";
#         org_kde_powerdevil."Increase Screen Brightness Small" = "Shift+Monitor Brightness Up";
#         org_kde_powerdevil.PowerDown = "Power Down";
#         org_kde_powerdevil.PowerOff = "Power Off";
#         org_kde_powerdevil.Sleep = "Sleep";
#         org_kde_powerdevil."Toggle Keyboard Backlight" = "Keyboard Light On/Off";
        org_kde_powerdevil."Turn Off Screen" = "Favorites";
#         org_kde_powerdevil.powerProfile = ["Battery" "Meta+B"];
#         plasmashell."activate application launcher" = ["Meta" "Alt+F1"];
#         plasmashell."activate task manager entry 1" = "Meta+1";
#         plasmashell."activate task manager entry 2" = "Meta+2";
#         plasmashell."activate task manager entry 3" = "Meta+3";
#         plasmashell."activate task manager entry 4" = "Meta+4";
#         plasmashell."activate task manager entry 5" = "Meta+5";
#         plasmashell."activate task manager entry 6" = "Meta+6";
#         plasmashell."activate task manager entry 7" = "Meta+7";
#         plasmashell."activate task manager entry 8" = "Meta+8";
#         plasmashell."activate task manager entry 9" = "Meta+9";
#         plasmashell.clipboard_action = "Meta+Ctrl+X";
#         plasmashell.cycle-panels = "Meta+Alt+P";
#         plasmashell."manage activities" = "Meta+Q";
#         plasmashell."next activity" = "Meta+A";
#         plasmashell."previous activity" = "Meta+Shift+A";
#         plasmashell."show dashboard" = "Ctrl+F12";
#         plasmashell.show-on-mouse-pos = "Meta+V";
        "services/org.kde.konsole.desktop"._launch = "Meta+Ctrl+Alt+T";
      };
      configFile = {
        kwinrc.Plugins.minimizeallEnabled = true;
        kwinrc.Plugins.mousemarkEnabled = true;
        kwinrc.Xwayland.Scale = 1.6;
        plasma-localerc.Formats.LANG = "de_DE.UTF-8";
        plasma-localerc.Translations.LANGUAGE = "de_DE:C:en_US";
      };
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
  home.stateVersion = "25.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
