#!/bin/bash

cat << 'EOF' >  $HOME/.config/polybar/system-uptime.sh
#!/bin/sh

uptime --pretty | sed 's/up //' | sed 's/\ years\?,/y/' | sed 's/\ weeks\?,/w/' | sed 's/\ days\?,/d/' | sed 's/\ hours\?,\?/h/' | sed 's/\ minutes\?/m/'
EOF

chmod a+x $HOME/.config/polybar/system-uptime.sh

cat << 'EOF' >> $HOME/.config/polybar/config

[module/system-uptime-pretty]
type = custom/script
exec = ~/.config/polybar/system-uptime.sh
interval = 30

EOF

