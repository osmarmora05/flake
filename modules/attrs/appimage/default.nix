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
      ];

      programs.appimage = {
        enable = true;
        binfmt = true;
        package = pkgs.appimage-run.override {
          extraPkgs =
            pkgs: with pkgs; [
              webkitgtk_4_1
              gtk3
              glib-networking
              gvfs
            ];
        };
      };
    }
  );
}
