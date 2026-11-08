{ moduleWithSystem, ... }: {
  flake.nixosModules.docker = moduleWithSystem (
    { ... }: {
      virtualisation.docker = {
        enable = true;
      };
    }
  );
}
