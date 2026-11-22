{ ... }: {
  flake.nixosModules.gnome-services = { pkgs, ... }: {
    services.gvfs.enable = true;
    services.gnome.glib-networking.enable = true;
    programs.dconf.enable = true;
  };
}
