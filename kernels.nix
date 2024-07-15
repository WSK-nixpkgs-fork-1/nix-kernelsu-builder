{ callPackage, sources, ... }:
let
  pipeline = callPackage ./pipeline { };
in
{


  oneplus-8t-blu-spark = pipeline {
    anyKernelVariant = "osm0sis";
    clangVersion = "latest";
    kernelDefconfigs = [ "blu_spark_defconfig" ];
    kernelImageName = "Image";
    kernelSrc = sources.linux-oneplus-8t-blu-spark.src;
    kernelConfig = ''
      CONFIG_STACKPROTECTOR=n
      CONFIG_LTO_CLANG=y
    '';
  };
  oneplus-7t = pipeline {
    arch = "arm64";
    anyKernelVariant = "kernelsu";
    clangVersion = "8";
    enableKernelSU = true;
    kernelDefconfigs = [ "vendor/sm8150-perf_defconfig" ];
    kernelImageName = "Image";
    kernelSrc = sources.linux-oneplus-7t-lineageos-21.src;
    kernelPatches = [ ./umount.patch ];
    oemBootImg = ./boot.img;
  };
}
