#!/bin/bash

cat << 'EOF' > $HOME/opt/bspwm-floating.sh
#!/bin/bash

FLOATING_DESKTOP_ID=$(bspc query -D -d '^3')

bspc subscribe node | while read -a msg ; do
  desk_id=${msg[2]}
  wid=${msg[3]}
  [ "$FLOATING_DESKTOP_ID" = "$desk_id" ] && bspc node "$wid" -t floating
done

EOF

chmod a+x $HOME/opt/bspwm-floating.sh


cat << 'EOF' >> $HOME/.config/bspwm/bspwmrc
$HOME/opt/bspwm-floating.sh &
EOF



