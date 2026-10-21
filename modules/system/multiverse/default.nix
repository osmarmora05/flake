{
  inputs,
  ...
}:
{
  flake.nixosModules.multiverse =
    {
      pkgs,
      lib,
      ...
    }:
    {
      imports = [ inputs.multiverse.nixosModules.default ];
      multiverse.enable = true;
    };
}
