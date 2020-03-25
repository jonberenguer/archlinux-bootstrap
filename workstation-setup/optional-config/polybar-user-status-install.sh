#!/bin/bash

cat << 'EOF' >> ~/.config/polybar/config
[module/user-services]
type = custom/script
exec = ~/.config/polybar/user-service
interval = 300
format-underline = #f90000
EOF


cat << 'EOF' > ~/.config/polybar/user-service
#!/bin/bash
STATE=`systemctl --user status | grep "State" | cut -d ':' -f2 | sed 's/ //'`
[[ "${STATE}" != "running"  ]] && echo "user services: ${STATE}"
EOF

chmod 744 ~/.config/polybar/user-service



