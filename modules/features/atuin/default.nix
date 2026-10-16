{ moduleWithSystem, ... }: {
  flake.nixosModules.atuin = moduleWithSystem (
    { ... }: {
      programs.atuin = {
        enable = true;
      };
    }
  );
}
