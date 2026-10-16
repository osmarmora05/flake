{
  self,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.video = moduleWithSystem (
    { pkgs, ... }:
    let
      modules = with self.nixosModules; [ obs-studio ];
    in
    {
      imports = modules;
    }
  );
}
