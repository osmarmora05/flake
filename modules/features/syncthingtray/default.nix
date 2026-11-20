{
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.syncthingtray = moduleWithSystem (
    { ... }:
    {
      multiverse = {
        pins = {
          syncthingtray = "2.1.7";
        };
      };
    }
  );
}
