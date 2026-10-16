{
  self,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.tui = moduleWithSystem (
    { pkgs, ... }:
    let
      modules = with self.nixosModules; [
        wlctl
      ];
    in
    {
      imports = modules;
      environment.systemPackages = with pkgs; [
        television
        yazi
        lazygit
        bluetui
        wiremix
      ];
    }
  );
}
