{...}: let
  toggle-audio-output = pkgs.writeShellApplication {
    name = "swaync-auto-dnd";
    text = ''
      ${./swaync-auto-dnd.sh}
    '';
  };
in {
  home.packages = [swaync-auto-dnd];
}
