# Linux Helper 🛠️  

**A Fedora-focused automation tool for streamlined system setup.**  
Simplify package installation, and utility setup with a single script.  

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
- Yaru Sound Theme
- mc (Midnight Commander)
- htop
- Alacritty
- FastFetch
- Gnome-Tweaks
- Gnome-Firmware
- Steam
- gcc
- make

---

## 🔧 Prerequisites

* **Fresh Fedora Linux installation** (tested on Fedora 38+),
* **Active internet connection** (for package downloads), 
* **Root privileges** (`sudo` access).

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

## 📜 License  

This project is licensed under **MIT** — see the `LICENSE` file for details.  

---

## 💡 Inspiration  

Inspired by **[Crucible](https://github.com/typecraft-dev/crucible/)**, this project was built independently to deepen my understanding of Linux system automation. All credit for the original idea goes to the Crucible authors.  
