{ config, pkgs, ...} : {
  imports = [
      ./hardware-configuration.nix # Include the results of the hardware scan.
      ./packages.nix
      ./modules/bundle.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  services.timesyncd.enable = true;
  time.timeZone = "Europe/Rome";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    earlySetup = true;
    font = "latarcyrheb-sun32";
    keyMap = "us";
  };
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
   };

  #UNSUPPORTED WITH FLAKES
  # system.copySystemConfiguration = true; # copy /etc/nixos/configuration.nix to /run/current-system/configuration.nix

  system.stateVersion = "24.05"; # Don't change it bro

}

