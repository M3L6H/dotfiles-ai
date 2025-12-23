{
  pname,
  ...
}:
{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
{
  options.m3l6h.${pname}.extra-models = {
    enable = mkEnableOption "Enable extra models";
    path = mkOption {
      description = "Path to extra models file";
    };
    rev = mkOption {
      description = "Git SHA of extra-models repo";
    };
    url = mkOption {
      description = "URL to extra models repo";
    };
  };

  config =
    let
      parent = config.m3l6h.${pname};
      cfg = parent.extra-models;
      fetchers = {
        fetchair = pkgs.fetchair;
        fetchResource = pkgs.fetchResource;
      };
    in
    mkIf (parent.enable && cfg.enable) {
      services.comfyui.models =
        let
          extraAi = builtins.fetchGit {
            url = cfg.url;
            rev = cfg.rev;
          };
        in
        (import "${extraAi}/${cfg.path}" fetchers);
    };
}
