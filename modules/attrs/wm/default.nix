{
  self,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.wm = moduleWithSystem (
    { pkgs, ... }:
    let
      modules = with self.nixosModules; [
        niri
      ];
    in
    {
      imports = modules;
    }
  );
}
