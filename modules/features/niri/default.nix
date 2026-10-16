{
  self,
  ...
}:
{
  flake.nixosModules.niri =
    {
      pkgs,
      lib,
      ...
    }:
    let
      modules = with self.nixosModules; [
        dms
        vicinae
      ];

    in
    {
      environment.systemPackages = with pkgs; [
        xwayland-satellite
      ];

      imports = modules;
      programs.niri = {
        enable = true;
      };

    };
}
