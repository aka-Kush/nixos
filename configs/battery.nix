{ config, pkgs, ... }:

{
  # Battery monitor script
  home.file."bin/battery-monitor.sh" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash

      BAT_PATH="/sys/class/power_supply/BAT0"
      LOW_BATTERY_THRESHOLD=15

      if [ -f "$BAT_PATH/capacity" ] && [ -f "$BAT_PATH/status" ]; then
        capacity=$(cat "$BAT_PATH/capacity")
        status=$(cat "$BAT_PATH/status")

        if [ "$capacity" -le "$LOW_BATTERY_THRESHOLD" ] && [ "$status" = "Discharging" ]; then
          notify-send -u critical "Battery Low" "Battery level is at ''${capacity}%!"
        fi
      fi
    '';
  };

  # systemd user service for the battery monitor
  systemd.user.services.battery-monitor = {
    Unit = {
      Description = "Battery Monitor Notification Script";
    };
    Service = {
      ExecStart = "%h/bin/battery-monitor.sh";
      Type = "oneshot";
    };
  };

  # systemd user timer to run the monitor every minute
  systemd.user.timers.battery-monitor = {
    Unit = {
      Description = "Run battery monitor every 1 minute";
    };
    Timer = {
      OnBootSec = "1min";
      OnUnitActiveSec = "1min";
      Persistent = true;
    };
    Install.WantedBy = [ "timers.target" ];
  };
}
