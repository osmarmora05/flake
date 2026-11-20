{
  self,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.sync = moduleWithSystem (
    { pkgs, ... }:
    let
      modules = with self.nixosModules; [ syncthingtray ];
    in
    {
      imports = modules;
    }
  );
}
