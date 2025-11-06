{
  fetchair,
  fetchResource,
}:
[
  (fetchair {
    name = "Flux-City-Pop-Style.safetensors";
    air = "urn:air:flux1:lora:civitai:1278623@1442497";
    sha256 = "78BAF3AC21CE7744684208EA5B9B8D85E2BE38FBE40246BF99311DEC3F086F2D";
    passthru = {
      comfyui.installPaths = [ "loras" ];
    };
  })
  (fetchair {
    name = "Flux-Da-Vinci-Drawing-Style.safetensors";
    air = "urn:air:flux1:lora:civitai:671809@832672";
    sha256 = "13D4D15D729EF045E4A013192F4C972DC887F0ED6FE601750AD7A778FA62ED3F";
    passthru = {
      comfyui.installPaths = [ "loras" ];
    };
  })
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
  (fetchair {
    name = "Qwen-Da-Vinci-Drawing-Style.safetensors";
    air = "urn:air:qwen:lora:civitai:671809@2127763";
    sha256 = "2844EAD58244D2C3DF364FE62F846FE57C495C42DD25B297A2D0A5643CCC43CC";
    passthru = {
      comfyui.installPaths = [ "loras" ];
    };
  })
  (fetchair {
    name = "Qwen-Select-the-Subject-Mask.safetensors";
    air = "urn:air:qwen:lora:civitai:2049160@2319143";
    sha256 = "634F4944899A7AD57831F4C14605BB79DA406D13C7A6E9EF41E02D03D533CD21";
    passthru = {
      comfyui.installPaths = [ "loras" ];
    };
  })
]
