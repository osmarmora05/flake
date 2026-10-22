{
  description = "Master flake for osmarmora05 nix config";

  inputs = {
    # System
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    # nix-multiverse
    multiverse.url = "github:fzakaria/nixpkgs-multiverse";

    # wlctl
    wlctl.url = "github:aashish-thapa/wlctl";

    # vicinae-extensions
    vicinae-extensions.url = "github:vicinaehq/extensions";

    # helium-flake
    helium-flake.url = "github:oxcl/nix-flake-helium-browser";
    helium-flake.inputs.nixpkgs.follows = "nixpkgs";

    # dms
    dms.url = "github:duxlabs-dev/dux-shell/stable";
    dms.inputs.nixpkgs.follows = "nixpkgs";
    dms-plugin-registry.url = "github:duxlabs-dev/dux-plugin-registry";
    dms-plugin-registry.inputs.nixpkgs.follows = "nixpkgs";

    # Flake parts
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    wrappers.url = "github:BirdeeHub/nix-wrapper-modules";
  };
  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
