{
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.lang = moduleWithSystem (
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        nodejs
        pnpm
        cargo
        rustc
        python315
      ];
    }
  );
}
