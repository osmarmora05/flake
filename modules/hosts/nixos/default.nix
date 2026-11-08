{
  self,
  inputs,
  ...
}:
{
  flake.nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      desktop
      shell
      cli
      tui
      password-manager
      wm
      terminal
      editor
      dev
      backup
      video
      gaming
    ];
  };
}
