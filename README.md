# dotfiles-ai

Nix-based repository containing my playground for AI tools.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [usage](#usage)
  - [IMPORTANT](#important)
  - [additional-models](#additional-models)
- [development](#development)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## usage

This flake cannot be used directly from GitHub.
It should be cloned locally and used as such:

```nix
# flake.nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    m3l6h-ai = {
      url = "/home/m3l6h/files/dev/m3l6h/dotfiles-ai";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    # ...
  };
}
```

It provides a module which should be imported and enabled:

```nix
# module.nix
{
  inputs,
  ...
}:
{
  imports = [
    inputs.m3l6h-ai.nixosModules.default
  ];

  config = {
    m3l6h.ai.enable = true;
  };
}
```

### IMPORTANT

Before importing and enabling the module, create a `modules/secrets.nix` file with the contents:

```nix
{ ... }:
{
  config = {
    systemd.services.nix-daemon.environment = {
      HF_TOKEN = "<Hugging Face Token>";
      CIVITAI_API_TOKEN = "<CivitAI Token>";
    };
  };
}
```

Then run `nixos-rebuild switch --sudo /path/to/your/system/flake` once.
This will update the nix-daemon with the tokens needed to download models.

After that, the module can be enabled.

### additional-models

Additional can be added with the `modules/extraModels.nix` file.

## development

All modules have been defined in the `modules/` folder.
