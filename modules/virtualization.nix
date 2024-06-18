{ config, pkgs, lib, ... }: {
  programs.virt-manager = {
    enable = true;
    package = pkgs.virt-manager;
  };
  virtualisation = {
    libvirtd = {
      enable = true;
      onBoot = "ignore";

      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
        package = pkgs.qemu_kvm;
        runAsRoot = false;
      };

    };
  };
  services.spice-vdagentd.enable = true;
  systemd.services.libvirtd.restartIfChanged = false;
}
