FLATPAKS=(
  com.mattjakeman.ExtensionManager
	io.github.kolunmi.Bazaar
	io.missioncenter.MissionCenter
	org.gnome.FontManager
)

for pak in "${FLATPAKS[@]}"; do
  if ! flatpak list | grep -i $pak &> /dev/null; then
    echo "Installing Flatpak: $pak"
    flatpak install --user --noninteractive $pak
  else
    echo "Flatpak already installed: $pak"
  fi
done
