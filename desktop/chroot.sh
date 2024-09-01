# Remember to su into user account made in archinstall
# Install Yay
yes | sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && yes | makepkg -si
# Install packages from Yay
yes | yay -S bolt-launcher orca-slicer-bin protonup-qt jamesdsp-pipewire-bin partitionmanager mkinitcpio-firmware btrfs-assistant snapper-support btrfsmaintenance konsave
# Configure btrfs subvolumes
sudo snapper -c root create-config /
sudo snapper -c home create-config /home
sudo mkdir /.snapshots
sudo mount -a
sudo btrfs subvol set-default 256 /
# QEMU virtualization services
sudo systemctl enable libvirtd
sudo systemctl enable dnsmasq
# Printer services
sudo systemctl enable cups.service
# Download and apply KDE Plasma theme
curl -O https://github.com/imdabossou/archinstallconfig/tree/main/desktop/konsave.knsv
konsave -i konsave.knsv
konsave -a konsave
# Download monitor ICM profile while still in /home
curl -O https://github.com/imdabossou/archinstallconfig/blob/main/desktop/EX240N.icm
# Apply Nvidia fixes
cd /etc/modprobe.d/
sudo curl -O https://raw.githubusercontent.com/imdabossou/archinstallconfig/main/desktop/nvidiadesktop.conf
# Apply SDDM Wayland
cd /etc/sddm.conf.d/
sudo curl -O https://raw.githubusercontent.com/imdabossou/archinstallconfig/main/desktop/10-wayland.conf
