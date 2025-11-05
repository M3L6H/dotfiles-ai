{
  fetchair,
  fetchResource,
}:
[
  (fetchResource {
    name = "Qwen-Rapid-AIO-SFW-v7.safetensors";
    url = "https://huggingface.co/Phr00t/Qwen-Image-Edit-Rapid-AIO/resolve/main/v7/Qwen-Rapid-AIO-SFW-v7.safetensors";
    sha256 = "064ff1688134ba47f2e38da3af21a6da58ba893e609f03591936656a8421261d";
    passthru = {
      comfyui.installPaths = [ "checkpoints" ];
    };
  })
]
