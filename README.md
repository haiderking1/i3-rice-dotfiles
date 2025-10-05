# 🔥 i3 Rice - Gruvbox Theme

My personal i3 window manager configuration with Gruvbox theme, transparency, and blur.

![Screenshot](screenshot.png)

## ✨ Features

- **Window Manager**: i3-wm with autotiling
- **Bar**: Polybar (Gruvbox theme)
- **Launcher**: Rofi (type-3 style-1)
- **Compositor**: Picom (blur, transparency, animations)
- **Terminal**: Alacritty with fastfetch
- **Theme**: Gruvbox Dark everywhere
- **Transparency**: 90% on Zen/Nautilus, 70% on Alacritty
- **Blur**: Dual kawase (strength 10)
- **Fonts**: Noto Sans (English + Arabic)
- **Network**: Optimized TCP + DNS caching
- **Mouse**: No acceleration, flat profile

## 🚀 Quick Install

On a fresh Arch Linux install:

```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/i3-rice-dotfiles/main/install.sh | bash
```

Then log out and select i3 from your display manager.

## 📦 Manual Install

1. Clone this repo:
```bash
git clone https://github.com/YOUR_USERNAME/i3-rice-dotfiles.git
cd i3-rice-dotfiles
chmod +x install.sh
./install.sh
```

2. Log out and select i3

## ⌨️ Keybindings

| Key | Action |
|-----|--------|
| `Super + D` | Rofi launcher |
| `Super + X` | Zen Browser |
| `Super + E` | Nautilus |
| `Super + K` | Nitrogen (wallpaper) |
| `Super + Q` | Terminal |
| `Super + C` | Kill window |
| `Print` | Screenshot |
| `Alt + Shift` | Switch keyboard (US/Arabic) |
| `Super + Drag` | Move window |

## 📸 Screenshots

*(Add your screenshots here)*

## 🎨 Customization

- **Polybar theme**: Edit `~/.config/polybar/config.ini`
- **Rofi theme**: Edit `~/.rofi/launchers/type-3/launcher.sh`
- **Transparency**: Edit `~/.config/picom/picom.conf`
- **Keybindings**: Edit `~/.config/i3/config`

## 📋 Requirements

- Arch Linux (or Arch-based distro)
- Git
- Internet connection

## 🛠️ Troubleshooting

**Polybar not showing?**
```bash
~/.config/polybar/launch.sh
```

**Picom not working?**
```bash
killall picom && picom --config ~/.config/picom/picom.conf &
```

## 📝 License

MIT

---

**Theme**: Gruvbox Dark  
**WM**: i3-wm  
**Created**: October 2025
