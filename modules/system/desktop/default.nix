{
  self,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.desktop = moduleWithSystem (
    { pkgs, ... }:
    let
      modules = with self.nixosModules; [
        core
        plasma
        browser
        network
      ];
    in
    {
      imports = modules;

    }
  );
}
