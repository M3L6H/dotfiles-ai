{ pname, nixified-ai }@inputs:
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

    (import ./secrets.nix inputs)
  ];

  config =
    let
      cfg = config.m3l6h.${pname};
    in
    mkIf cfg.enable {
      nixpkgs.overlays = import ./overlays;

      services.comfyui =
        let
          fetchers = {
            fetchair = pkgs.fetchair;
            fetchResource = pkgs.fetchResource;
          };
        in
        {
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
            ++ (import ./models fetchers)
            ++ (import ./extraModels.nix fetchers);
          customNodes =
            with pkgs.comfyuiPackages;
            [
              comfyui-cg-use-everywhere
              comfyui-gguf
              comfyui-kjnodes
              comfyui-impact-pack
              comfyui-impact-subpack
              comfyui-inpaint
              comfyui-rgthree
            ]
            ++ (import ./extraNodes.nix (
              with pkgs;
              {
                inherit fetchFromGitHub;
                mkComfyUICustomNode = pkgs.comfyuiPackages.comfyui.mkComfyUICustomNode;
              }
            ));
        };
    };
}
