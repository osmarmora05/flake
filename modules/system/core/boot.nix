{
  ...
}:
{
  flake.nixosModules.bootloader =
    {
      ...
    }:
    {
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      boot.loader.efi.efiSysMountPoint = "/boot";
      boot.loader.systemd-boot.configurationLimit = 10;
    };
}
