{
  ...
}:
{
  flake.nixosModules.bootloader =
    {
      pkgs,
      lib,
      ...
    }:
    {
      boot.loader.grub.enable = true;
      boot.loader.grub.device = "/dev/vda";
      boot.loader.grub.useOSProber = true;
      boot.loader.systemd-boot.configurationLimit = 10;
    };
}
