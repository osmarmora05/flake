{ moduleWithSystem, ... }: {
  flake.nixosModules.steam = moduleWithSystem (
    { pkgs, ... }: {
      programs.steam = {
        enable = true;
        protontricks.enable = true;
        extraCompatPackages = with pkgs; [
          proton-ge-bin
        ];
      };
    }
  );
}
