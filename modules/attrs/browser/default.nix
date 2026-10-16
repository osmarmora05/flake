{
  self,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.browser = moduleWithSystem (
    { ... }:
    let
      modules = with self.nixosModules; [
        firefox
        helium-flake
      ];
    in
    {
      imports = modules;
    }
  );
}
