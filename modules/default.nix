{ pname, nixified-ai }:
perSystem:
{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
{
  options.m3l6h.${pname} = {
    enable = mkEnableOption "m3l6h's custom ai configuration";
  };

  imports = [
    nixified-ai.nixosModules.comfyui

    ./secrets.nix
  ];

  config =
    let
      cfg = config.m3l6h.${pname};
    in
    mkIf cfg.enable {
      nix.settings = {
        substituters = [
          "https://nix-community.cachix.org"
          "https://numtide.cachix.org"
          "https://devenv.cachix.org"
          "https://ai.cachix.org"
          "https://cuda-maintainers.cachix.org"
        ];
        trusted-substituters = [
          "https://nix-community.cachix.org"
          "https://numtide.cachix.org"
          "https://devenv.cachix.org"
          "https://ai.cachix.org"
          "https://cuda-maintainers.cachix.org"
        ];
        trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
          "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
          "ai.cachix.org-1:N9dzRK+alWwoKXQlnn0H6aUx0lU/mspIoz8hMvGvbbc="
          "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
        ];
      };

      services.comfyui = {
        enable = true;
        package = perSystem.config.packages.default;
        host = "0.0.0.0";
        models =
          with pkgs.nixified-ai.models;
          [
            flux1-dev-q4_0
            flux-ae
            flux-text-encoder-1
            t5-v1_1-xxl-encoder
          ]
          ++ (import ./extraModels.nix {
            fetchair = pkgs.fetchair;
            fetchResource = pkgs.fetchResource;
          });
        customNodes = with pkgs.comfyuiPackages; [
          comfyui-gguf
        ];
      };
    };
}
