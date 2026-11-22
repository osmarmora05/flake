{
  self,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.media-player = moduleWithSystem (
    { pkgs, ... }:

    let
      modules = with self.nixosModules; [
        metrolist
      ];
    in
    {
      imports = modules;
      environment.systemPackages = with pkgs; [
        vlc
      ];
    }
  );
}
