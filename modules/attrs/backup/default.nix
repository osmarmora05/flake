{
  self,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.backup = moduleWithSystem (
    { pkgs, ... }:
    let
      modules = with self.nixosModules; [ duplicati ];
    in
    {
      imports = modules;
    }
  );
}
