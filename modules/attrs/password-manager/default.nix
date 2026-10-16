{
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.password-manager = moduleWithSystem (
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        keepassxc
      ];
    }
  );
}
