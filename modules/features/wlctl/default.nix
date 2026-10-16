{
  inputs,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.wlctl = moduleWithSystem (
    { self', ... }: {
      environment.systemPackages = with self'.packages; [
        wlctl
      ];
    }
  );
  perSystem =
    {
      pkgs,
      inputs',
      ...
    }:
    {
      packages.wlctl = inputs.wrappers.lib.wrapPackage (
        { ... }: {
          inherit pkgs;
          package = inputs'.wlctl.packages.default;
        }
      );
    };
}
