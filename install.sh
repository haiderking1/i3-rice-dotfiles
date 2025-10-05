#!/bin/bash
# Quick i3 Rice Install Script
# Just run: curl -fsSL https://raw.githubusercontent.com/haiderking1/i3-rice-dotfiles/main/install.sh | bash

set -e

echo "=== i3 Rice Auto-Install ==="
echo ""

# Install packages
echo "[1/3] Installing packages..."
sudo pacman -S --needed --noconfirm \
  i3-wm i3status i3lock \
  polybar rofi nitrogen picom alacritty \
  fastfetch flameshot \
  xdg-desktop-portal xdg-desktop-portal-gnome \
  noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra \
  ttf-dejavu ttf-liberation ttf-roboto ttf-jetbrains-mono-nerd \
  nautilus \
  ffmpeg libva-mesa-driver mesa-vdpau libva-utils \
  autotiling \
  systemd-resolvconf \
  git

# Clone dotfiles
echo "[2/3] Cloning dotfiles..."
cd ~
git clone https://github.com/haiderking1/i3-rice-dotfiles.git temp-dotfiles
cd temp-dotfiles

# Copy configs
echo "[3/3] Installing configs..."
mkdir -p ~/.config
cp -r i3 ~/.config/
cp -r polybar ~/.config/
cp -r picom ~/.config/
cp -r rofi ~/.config/
cp -r alacritty ~/.config/
cp -r nitrogen ~/.config/
cp -r gtk-3.0 ~/.config/
cp -r fontconfig ~/.config/
cp .gtkrc-2.0 ~/
cp .bashrc ~/
cp .profile ~/

# Clone theme repos
cd ~
git clone --depth=1 https://github.com/Murzchnvok/polybar-collection.git .polybar-collection
git clone --depth=1 https://github.com/adi1090x/rofi.git .rofi
cd .rofi && ./setup.sh

# System configs
echo "Setting up system configs..."

# Mouse
sudo mkdir -p /etc/X11/xorg.conf.d
sudo tee /etc/X11/xorg.conf.d/50-mouse-acceleration.conf << 'EOF'
Section "InputClass"
    Identifier "Glorious Mouse"
    MatchProduct "Glorious Model D- Wireless"
    Option "AccelProfile" "flat"
    Option "AccelSpeed" "0.1"
EndSection
EOF

# Network
sudo tee /etc/sysctl.d/99-network-performance.conf << 'EOF'
net.core.rmem_max = 134217728
net.core.wmem_max = 134217728
net.ipv4.tcp_rmem = 4096 87380 67108864
net.ipv4.tcp_wmem = 4096 65536 67108864
net.core.netdev_max_backlog = 5000
net.ipv4.tcp_congestion_control = bbr
net.core.default_qdisc = fq
net.ipv4.tcp_fastopen = 3
net.ipv4.tcp_mtu_probing = 1
net.ipv4.tcp_slow_start_after_idle = 0
net.ipv4.tcp_window_scaling = 1
net.ipv4.tcp_timestamps = 1
net.ipv4.tcp_sack = 1
net.ipv4.tcp_no_metrics_save = 1
net.ipv4.tcp_moderate_rcvbuf = 1
EOF

# DNS
sudo mkdir -p /etc/systemd/resolved.conf.d
sudo tee /etc/systemd/resolved.conf.d/opendns.conf << 'EOF'
[Resolve]
DNS=208.67.222.222 208.67.220.220
FallbackDNS=1.1.1.1 1.0.0.1
DNSSEC=yes
DNSOverTLS=opportunistic
Cache=yes
EOF

# Enable services
sudo systemctl enable --now systemd-resolved
sudo sysctl -p /etc/sysctl.d/99-network-performance.conf

# Timezone
sudo timedatectl set-timezone Asia/Baghdad

# Fonts
fc-cache -fv

# Cleanup
cd ~
rm -rf temp-dotfiles

echo ""
echo "=== Install Complete! ==="
echo "Log out and select i3 from your display manager"
echo ""
