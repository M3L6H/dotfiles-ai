inputs@{
  fetchair,
  fetchResource,
}:
(import ./checkpoints.nix inputs) ++ (import ./loras.nix inputs)
