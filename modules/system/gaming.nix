{pkgs, ...}: {
  programs.steam = {
    enable = true;

    gamescopeSession.enable = true;
    protontricks.enable = true;

    extraCompatPackages = with pkgs; [
      proton-ge-bin
      proton-experimental
    ];
  };

  environment.systemPackages = with pkgs; [
    steam-run
    protontricks
    winetricks
    protonup-qt
    mangohud
    gamemode
  ];

  programs.gamemode.enable = true;

  environment.systemPackages = [
    (pkgs.writeShellScriptBin "protontricks" ''
      exec ${pkgs.steam-run}/bin/steam-run ${pkgs.protontricks}/bin/protontricks "$@"
    '')
  ];

  environment.variables = {
    MANGOHUD = "1";
  };
}
