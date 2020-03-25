


# To uniform themes do the following

sudo pacman -S arc-gtk-theme accountsservice

cat << EOF > ~/.gtkrc-2.0
gtk-icon-theme-name = "Arc-Darker"
gtk-theme-name = "Arc-Darker"
gtk-font-name = "DejaVu Sans 11"
EOF

mkdir -p $XDG_CONFIG_HOME/gtk-3.0

cat << EOF > $XDG_CONFIG_HOME/gtk-3.0/settings.ini
[Settings]
gtk-icon-theme-name = Arc-Dark
gtk-theme-name = Arc-Dark
gtk-font-name = DejaVu Sans 11
EOF

sudo pacman -S qt5-styleplugins

cat << EOF >> ~/.profile

QT_QPA_PLATFORMTHEME=gtk2
EOF


sudo sed -i -r 's/^#(theme-name=).*/\1Arc-Dark/' /etc/lightdm/lightdm-gtk-greeter.conf
