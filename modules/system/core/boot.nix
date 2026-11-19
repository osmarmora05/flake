{
  ...
}:
{
  flake.nixosModules.bootloader =
    {
      ...
    }:
    {
      boot.loader = {
        grub = {
          enable = true;
          efiSupport = true;
          devices = [ "nodev" ];
          useOSProber = true;
        };

        efi = {
          efiSysMountPoint = "/boot";
          canTouchEfiVariables = true;
        };

        systemd-boot.enable = false;
      };
    };
}
