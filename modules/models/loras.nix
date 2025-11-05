{
  fetchair,
  fetchResource,
}:
[
  (fetchair {
    name = "Flux-Hyperdetailed-Colored-Pencil.safetensors";
    air = "urn:air:flux1:lora:civitai:1155749@1753222";
    sha256 = "3F42897F33A3C884C9DE481D2013F909AE59BBDD79E827A5F3D4D3CB7BCA3A92";
    passthru = {
      comfyui.installPaths = [ "loras" ];
    };
  })
  (fetchair {
    name = "Flux-Velvet-Mythic-Fantasy-Styles.safetensors";
    air = "urn:air:flux1:lora:civitai:599757@2228091";
    sha256 = "6249169CF8B673B5170D4277A73DBF9C23F47581C79D65EB87A379E7756F911D";
    passthru = {
      comfyui.installPaths = [ "loras" ];
    };
  })
]
