{
  ...
}:
{
  flake.nixosModules.git =
    {
      pkgs,
      lib,
      ...
    }:
    {
      programs.git = {
        enable = true;
        config = {
          core.editor = "codium";
          user.name = "osmarmora05";
          user.email = "osmaradrianmoracerna@gmail.com";
        };
      };
    };
}
