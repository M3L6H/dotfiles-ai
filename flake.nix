{
  description = "m3l6h's custom ai configuration packaged as a flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixified-ai = {
      url = "github:nixified-ai/flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      flake-parts,
      nixified-ai,
      ...
    }@inputs:
    let
      systems = [ "x86_64-linux" ];

      pname = "ai";
      version = "0.1.0";
    in
    flake-parts.lib.mkFlake { inherit inputs; } (
      { moduleWithSystem, ... }:
      let
        nixosModule = moduleWithSystem (
          perSystem@{ config, ... }:
          (import ./modules {
            inherit pname nixified-ai;
          })
            perSystem
        );
      in
      {
        inherit systems;

        perSystem =
          {
            pkgs,
            system,
            ...
          }:
          {
            _module.args.pkgs = import inputs.nixpkgs {
              inherit system;
              overlays = [
                inputs.nixified-ai.overlays.comfyui
                inputs.nixified-ai.overlays.models
                inputs.nixified-ai.overlays.fetchers
              ];
              config = {
                allowUnfree = true;
                cudaSupport = true;
              };
            };

            packages.default = pkgs.comfyuiPackages.comfyui.override {
              withModels = with pkgs.nixified-ai.models; [
                flux1-dev-q4_0
                flux-ae
                flux-text-encoder-1
                t5-v1_1-xxl-encoder
              ];

              withCustomNodes = with pkgs.comfyuiPackages; [
                comfyui-gguf
              ];
            };
          };

        flake = {
          inherit version;
          nixosModules.default = nixosModule;
        };
      }
    );
}
