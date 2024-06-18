{ pkgs, ... }: {
  users.users.matteo = {
  isNormalUser = true;
  home  ="/home/matteo";
  description ="Matteo";
  extraGroups = [ "networkmanager" "wheel" "libvirtd" ]; # Enable ‘sudo’ for the user.
  hashedPassword = "$y$j9T$Q5vE3rzEJqrQfUoqApicN/$pAJBGaSHaHhVmDpJOKcvpCGS7B5VK.agu2QFLQkkc/C";
  packages = with pkgs; [];
  };
}
