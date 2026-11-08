{
  self,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.container = moduleWithSystem (
    { pkgs, ... }:
    let
      modules = with self.nixosModules; [ docker ];
    in
    {
      imports = modules;
    }
  );
}
