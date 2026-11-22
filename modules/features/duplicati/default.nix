{
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.duplicati = moduleWithSystem (
    { ... }:
    {
      multiverse = {
        pins = {
          duplicati = "2.4.1.0";
        };
      };
    }
  );
}
