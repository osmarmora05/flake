{
  inputs,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.helium-flake = moduleWithSystem (
    { self', config, ... }: {
      imports = [ inputs.helium-flake.nixosModules.default ];

      programs.helium = {
        enable = true;
        package = self'.packages.helium-flake;
        policies = {
          "HomepageLocation" = "https://www.google.com/";
          "DefaultSearchProviderEnabled" = true;
          "DefaultSearchProviderSearchURL" = "https://www.google.com/search?q=%s";
          "PasswordManagerEnabled" = false;
          "ExtensionInstallForceList" = [
            "ddkjiahejlhfcafbddmgiahcphecmpfh" # uBlock Origin Lite
            "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
            "bggfcpfjbdkhfhfmkjpbhnkhnpjjeomc" # Material Icons for Github
            "cdockenadnadldjbbgcallicgledbeoc" # VisBug
            "gfbliohnnapiefjpjlpjnehglfpaknnc" # Surfingkeys
            "ekhagklcjbdpajgpjgmbionohlpdbjgc" # Zotero Connector
          ];
        };
      };
    }
  );
  perSystem =
    {
      pkgs,
      inputs',
      ...
    }:
    {
      packages.helium-flake = inputs.wrappers.lib.wrapPackage (
        { ... }: {
          inherit pkgs;
          package = inputs'.helium-flake.packages.default;
        }
      );
    };
}
