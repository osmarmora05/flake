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
          duplicati = "2.1.0.2";
        };
      };
    }
  );
}
