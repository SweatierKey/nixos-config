{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # Desktop apps
    mpv
    vesktop
    firefox
    steam
    spotify
    blackbox-terminal

    # CLI utils
    neofetch
    file
    tree
    wget
    git
    htop
    nix-index
    unzip
    cava
    zip
    ntfs3g
    yt-dlp
    swww
    openssl
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    psmisc
    dnsutils
    netcat
    tmux

    # Wayland stuff
    xwayland

    # Sound
    pipewire
    pulseaudio
    pavucontrol

    # GPU stuff 
    amdvlk

    # VM
    libvirt
    qemu
    spice
    spice-vdagent
  ];
}
