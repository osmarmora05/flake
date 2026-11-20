{
  self,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.media-player = moduleWithSystem (
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        vlc
      ];
    }
  );
}
