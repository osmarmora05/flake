{
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.editor = moduleWithSystem (
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        zed-editor
        neovim
        vscodium
      ];
    }
  );
}
