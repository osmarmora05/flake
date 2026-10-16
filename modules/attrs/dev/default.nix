{
  self,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.dev = moduleWithSystem (
    { pkgs, ... }:
    let
      modules = with self.nixosModules; [ git ];
    in
    {
      imports = modules;
      environment.systemPackages = with pkgs; [
        nodejs
        pnpm
        cargo
        rustc
        python315
        mise
        uv
      ];
    }
  );
}
