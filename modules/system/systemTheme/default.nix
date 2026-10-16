{
  self,
  ...
}:
{
  flake.nixosModules.systemTheme =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    let
      modules = with self.nixosModules; [
        fonts
      ];
    in
    {
      imports = modules;
    };
}
