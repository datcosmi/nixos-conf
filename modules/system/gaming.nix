{pkgs, ...}: {
  programs.steam = {
    enable = true;

    gamescopeSession.enable = true;
    protontricks.enable = true;

    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  environment.systemPackages = [
    pkgs.steam-run
    pkgs.protontricks
    pkgs.winetricks
    pkgs.protonup-qt
    pkgs.mangohud
    pkgs.gamemode

    (pkgs.writeShellScriptBin "protontricks" ''
      exec ${pkgs.steam-run}/bin/steam-run ${pkgs.protontricks}/bin/protontricks "$@"
    '')
  ];

  programs.gamemode.enable = true;

  services.udev.packages = [pkgs.gamemode];

  environment.variables = {
    MANGOHUD = "1";
  };
}
