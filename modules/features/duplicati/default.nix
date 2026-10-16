{
  inputs,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.duplicati = moduleWithSystem (
    { self', ... }: {
      environment.systemPackages = with self'.packages; [
        nixpkgs-duplicati
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
      packages.nixpkgs-duplicati = inputs.wrappers.lib.wrapPackage (
        { ... }: {
          inherit pkgs;
          package = inputs'.nixpkgs-duplicati.legacyPackages.duplicati;
        }
      );
    };
}
