{
  inputs,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.dms = moduleWithSystem (
    { self', config, ... }: {
      imports = [ inputs.dms-plugin-registry.nixosModules.default ];

      environment.systemPackages = with self'.packages; [
        dms
      ];

      programs.dms-shell = {
        enable = true;
        package = self'.packages.dms;
        systemd = {
          enable = false;
        };

        plugins = {
          mediaFrame.enable = true;
          musicTheme.enable = true;
          cavaVisualizer.enable = true;
        };
      };

    }
  );
  perSystem =
    {
      pkgs,
      inputs',
      ...
    }:
    {
      packages.dms = inputs.wrappers.lib.wrapPackage (
        { ... }: {
          inherit pkgs;
          package = inputs'.dms.packages.default;
        }
      );
    };
}
