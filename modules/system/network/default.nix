{ moduleWithSystem, ... }: {
  flake.nixosModules.network = moduleWithSystem (
    { ... }: { config, ... }: {
      networking = {
        networkmanager = {
          enable = true;
        };
        firewall.enable = false;
      };
      services.unbound = {
        enable = true;
      };
      systemd.services.NetworkManager-wait-online.enable = false;
    }
  );
}
