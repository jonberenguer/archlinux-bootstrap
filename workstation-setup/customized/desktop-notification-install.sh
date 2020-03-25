#!/bin/bash


# original notification use dunst instead

old-notification () {
	pacman -S notification-daemon libnotify

	cat << 'EOF' >> /usr/share/dbus-1/services/org.freedesktop.Notifications.service
	[D-BUS Service]
	Name=org.freedesktop.Notifications
	Exec=/usr/lib/notification-daemon-1.0/notification-daemon
	EOF

	# test with non-root user
	#notify-send "Hello World"
}

dunst () {
  sudo pacman -S dunst libnotify
  mkdir ~/.config/dunst
  cp /usr/share/dunst/dunstrc ~/.config/dunst/dunstrc

  # example to have root send notification to regular user
  # sudo -U user DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "Hello World"

}
