{
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.book = moduleWithSystem (
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        kdePackages.arianna
        calibre
      ];
    }
  );
}
