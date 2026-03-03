{pkgs, ...}: {
  systemd.user.services.cliphist-clean = {
    Unit = {
      Description = "Clear cliphist history";
    };

    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.cliphist}/bin/cliphist wipe";
    };
  };

  systemd.user.timers.cliphist-clean = {
    Unit = {
      Description = "Run cliphist-clean every 30 minutes";
    };

    Timer = {
      OnBootSec = "5min";
      OnUnitActiveSec = "30min";
      Persistent = false;
    };

    Install = {
      WantedBy = ["timers.target"];
    };
  };
}
