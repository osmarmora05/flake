{
  ...
}:
{
  flake.nixosModules.locale =
    {
      pkgs,
      lib,
      ...
    }:
    {
      time.timeZone = "America/Managua";
      i18n = {
        defaultLocale = "es_MX.UTF-8";
      };
      services.xserver.xkb = {
        layout = "latam";
        variant = "";
      };
      console.keyMap = "es";
    };
}
