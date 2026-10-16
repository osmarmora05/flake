{
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.terminal = moduleWithSystem (
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        ghostty
        kitty
      ];
    }
  );
}
