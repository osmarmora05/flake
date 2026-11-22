{
  inputs,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.metrolist = moduleWithSystem (
    { self', ... }: {
      environment.systemPackages = with self'.packages; [
        metrolist
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
      packages.metrolist = inputs.wrappers.lib.wrapPackage (
        { ... }: {
          inherit pkgs;
          package = inputs'.metrolist.packages.default;
        }
      );
    };
}
