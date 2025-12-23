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

This flake provides a module which should be imported and enabled:

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

Before enabling the module, ensure you have configured `m3l6h.ai.environmentPath` to point to a `.env` file containing:

```env
HF_TOKEN = "<Hugging Face Token>"
CIVITAI_API_TOKEN = "<CivitAI Token>"
```

Then run `nixos-rebuild switch --sudo /path/to/your/system/flake` once.
This will update the nix-daemon with the tokens needed to download models.

After that, the module can be enabled.

### additional-models

Additional can be added with the `modules/extraModels.nix` file.

## development

All modules have been defined in the `modules/` folder.
