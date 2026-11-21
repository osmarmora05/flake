{
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.appimage = moduleWithSystem (
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        gearlever
        gtk3
      ];

      programs.appimage = {
        enable = true;
        binfmt = true;
      };
    }
  );
}
