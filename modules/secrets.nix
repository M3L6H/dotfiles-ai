{ pname, ... }:
{ config, lib, ... }:
with lib;
{
  options.m3l6h.${pname} = {
    environmentPath = mkOption {
      description = "Path to environment secrets";
    };
  };

  config =
    let
      cfg = config.m3l6h.${pname};
    in
    {
      systemd.services.nix-daemon.serviceConfig.EnvironmentPath = cfg.environmentPath;
    };
}
