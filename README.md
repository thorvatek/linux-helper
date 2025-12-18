# Thor's Linux Helper 🛠️  

**A Fedora-focused automation tool for streamlined system setup.**  
Simplify package installation, system configuration, and utility setup with a single script.  

---

## 🌟 Features  

- **One-Click Setup**: Install essential packages, development tools, and gaming utilities.
- **Gaming Ready**: Install Steam, Lutris, and Heroic for comprehensive Linux gaming support.
- **Production Environment**: Set up development tools (Visual Studio Code, make, gcc).
- **System Tweaks**: Install GNOME Tweaks, Extension Manager, and system utilities.
- **System Updates**: Automatic DNF and Flatpak updates before package installation.
- **Safety First**: Error handling with detailed logging of all operations.

---

## � What Gets Installed

### Flatpak Packages
- Extension Manager
- Bazaar
- Mission Center
- Font Manager
- Visual Studio Code
- Lutris (gaming platform)
- Heroic Games Launcher

### DNF Packages
- yaru-sound-theme
- mc (Midnight Commander)
- htop
- alacritty
- fastfetch
- gnome-tweaks
- gnome-firmware
- steam
- gcc
- make

---

## 🔧 Prerequisites

✅ **Fresh Fedora Linux installation** (tested on Fedora 38+).
✅ **Active internet connection** (for package downloads).
✅ **Root privileges** (`sudo` access).

> **Note**: Designed for **fresh installs** but can be used on existing ones too.

---

## 🚀 Installation  

1. **Clone the repository**:  
   ```bash  
   git clone https://github.com/thorvatek/linux-helper.git  
   cd linux-helper  
   ```  

2. **Make the script executable**:  
   ```bash  
   chmod +x install-packages.sh  
   ```  

3. **Run the setup script**:  
   ```bash  
   sudo ./install-packages.sh  
   ```  

4. **Reboot your system** to apply changes:  
   ```bash  
   sudo reboot  
   ```  

---

## 🤝 Contributing  

Contributions are welcome! 🎯  

1. Fork the repository.  
2. Create a feature branch (`git checkout -b feature/awesome-feature`).  
3. Submit a pull request with clear documentation.  

**Bug reports and feature requests**: Open an issue [here](https://github.com/thorvatek/linux-helper/issues).  

---

## 📜 License  

This project is licensed under **MIT** — see the `LICENSE` file for details.  

---

## 💡 Inspiration  

Inspired by **[Crucible](https://github.com/typecraft-dev/crucible/)**, this project was built independently to deepen my understanding of Linux system automation. All credit for the original idea goes to the Crucible authors.  

---

### ✅ Quick Start Summary  

```bash  
git clone https://github.com/thorvatek/linux-helper.git  
cd linux-helper  
chmod +x install-packages.sh  
sudo ./install-packages.sh  
sudo reboot  
```  

**Your Fedora workstation, simplified.** 🖥️🎮💻  

--- 

*Built with ❤️ for Fedora users.*
