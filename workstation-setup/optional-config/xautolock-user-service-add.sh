#!/bin/bash


sudo pacman -S --noconfirm xautolock

mkdir -p ~/.config/systemd/$USER

cat << 'EOF' > ~/.config/systemd/$USER/xautolocker.service
[Unit]
Description=xautolocker

[Service]
ExecStart=/usr/bin/xautolock -time 60 -locker "/usr/bin/systemctl suspend"

[Install]
WantedBy=default.target
EOF

systemctl --user daemon-reload
systemctl --user enable --now xautolocker.service


