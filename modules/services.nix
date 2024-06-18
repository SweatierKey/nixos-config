{ pkgs, ... }: {
  services = {
    xserver.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;

    locate.enable = true;
    locate.package = pkgs.plocate;
    locate.localuser = null;
    flatpak.enable = true;
  };
}
