{
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.cli = moduleWithSystem (
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        lsd
        zoxide
        delta
        duf
        fd
        cmatrix
        btop
        htop
        fastfetch
        cava
        fzf
        stow
        inxi
        ripgrep
        bat
        lstr
        wl-clipboard
        cloc
      ];
    }
  );
}
