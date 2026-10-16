{
  self,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.shell = moduleWithSystem (
    { pkgs, ... }:
    let
      modules = with self.nixosModules; [
        atuin
      ];
    in
    {
      imports = modules;
      environment.systemPackages = with pkgs; [
        fish
        starship
        zellij
      ];
    }
  );
}
