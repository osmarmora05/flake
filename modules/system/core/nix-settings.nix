{ inputs, ... }: {
  perSystem = { system, ... }: {
    _module.args = {
      unfreePkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      unstablePkgs = import inputs.nixpkgs-unstable {
        inherit system;
      };
      # Make flakeLocation universally addressable
      flakeLocation = builtins.getEnv "PWD";
    };
  };
  flake.nixosModules.nix = { ... }: {
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
