{
  inputs,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.vicinae = moduleWithSystem (
    {
      self',
      pkgs,
      inputs,
      ...
    }:
    {
      environment.systemPackages = with self'.packages; [
        vicinae
      ];

    }
  );
  perSystem =
    {
      pkgs,
      inputs',
      ...
    }:
    {
      packages.vicinae = inputs.wrappers.lib.wrapPackage (
        { ... }: {
          inherit pkgs;
          package = pkgs.vicinae;

          runShell = [
            ''
              	extension_dir="''${XDG_DATA_HOME:-$HOME/.local/share}/vicinae/extensions"
              	mkdir -p "$extension_dir"

              	ln -sfn ${inputs'.vicinae-extensions.packages.player-pilot} "$extension_dir/player-pilot"
            ''
          ];
        }
      );
    };
}
