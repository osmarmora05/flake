{
  ...
}:
{
  flake.nixosModules.fonts =
    {
      pkgs,
      lib,
      ...
    }:
    {
      fonts.packages = with pkgs.nerd-fonts; [
        caskaydia-cove
      ];
    };
}
