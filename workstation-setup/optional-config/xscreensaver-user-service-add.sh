#!/bin/bash


mkdir -p ~/.config/systemd/$USER

cat << 'EOF' > ~/.config/systemd/$USER/xscreensaver.service 
[Unit]
Description=XScreenSaver

[Service]
ExecStart=/usr/bin/xscreensaver -nosplash

[Install]
WantedBy=default.target

EOF


systemctl --user enable xscreensaver.service
