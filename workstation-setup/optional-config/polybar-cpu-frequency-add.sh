#!/bin/bash

sudo pacman -S bc

cat << 'EOF' > $HOME/.config/polybar/system-cpu-frequency.sh
#!/bin/sh

c=0;t=0

awk '/MHz/ {print $4}' < /proc/cpuinfo | (while read -r i
do
    t=$( echo "$t + $i" | bc )
    c=$((c+1))
done
echo "scale=2; $t / $c / 1000" | bc | awk '{print $1" GHz"}')
EOF

chmod a+x $HOME/.config/polybar/system-cpu-frequency.sh

cat << 'EOF' >> $HOME/.config/polybar/config

[module/system-cpu-frequency]
type = custom/script
exec = ~/.config/polybar/system-cpu-frequency.sh
interval = 10

format-prefix = " "
format-prefix-foreground = ${colors.foreground-alt}
format-underline = #4bffd

EOF



