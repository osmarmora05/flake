{
  ...
}:
{
  flake.nixosModules.user =
    {
      pkgs,
      lib,
      ...
    }:
    {
      # imports = modules;
      users.users.osmar = {
        isNormalUser = true;
        description = "osmar";
        extraGroups = [
          "root"
          "seat"
          "audio"
          "video"
          "wheel"
          "plugdev"
          "networkmanager"
        ];
      };
    };
}
