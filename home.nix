{ config, pkgs, ... }:

{
  home.username = "matteo";
  home.homeDirectory = "/home/matteo";

  home.packages = with pkgs; [ 
	prismlauncher 
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = '''';

    shellAliases = {
    };
  };

  programs.git = {
  enable = true;
  userName = "SweatierKey";
  userEmail = "matteoaquino17@gmail.com";
};


  imports = [
    #<plasma-manager/modules>
  ];

  programs.plasma = {
    enable = true;
    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
    };
    hotkeys.commands."launch-konsole" = {
      name = "Launch Konsole";
      key = "Meta+Alt+K";
      command = "konsole";
    };
  };


  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
