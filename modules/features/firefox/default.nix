{
  ...
}:
{
  flake.nixosModules.firefox =
    {
      pkgs,
      lib,
      ...
    }:
    {
      environment.systemPackages = with pkgs; [
        pywalfox-native
      ];

      programs.firefox = {
        enable = true;

        policies = {
          # https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265/17
          ExtensionSettings =
            with builtins;
            let
              extension = shortId: uuid: {
                name = uuid;
                value = {
                  install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
                  installation_mode = "normal_installed";
                };
              };
            in
            listToAttrs [
              (extension "ublock-origin" "uBlock0@raymondhill.net")
              (extension "surfingkeys_ff" "{a8332c60-5b6d-41ee-bfc8-e9bb331d34ad}")
              (extension "material-icons-for-github" "{eac6e624-97fa-4f28-9d24-c06c9b8aa713}")
              (extension "visbug" "{50864413-c4c8-43b0-80b8-982c4a368ac9}")
              (extension "darkreader" "addon@darkreader.org")
              (extension "copyfish-ocr-software" "copyfish@a9t9.com")
              (extension "pywalfox" "pywalfox@frewacom.org")
            ];
        };
      };

    };
}
