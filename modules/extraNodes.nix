{
  fetchFromGitHub,
  mkComfyUICustomNode,
}:
[
  (mkComfyUICustomNode {
    pname = "ComfyUI-QwenImageWanBridge";
    version = "v2.7.1";
    src = fetchFromGitHub {
      owner = "fblissjr";
      repo = "ComfyUI-QwenImageWanBridge";
      rev = "bba3f0913bb8a15f974901e14fe18a9ac7debb47";
      hash = "sha256-22EkHGVTLktEluHCD4whD3rBpUk/6vFhCEgRGeMUJoI=";
    };
  })
]
