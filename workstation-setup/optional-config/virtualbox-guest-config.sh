#!/bin/bash



cat << 'EOF' > /boot/startup.nsh
FS0:
\EFI\GRUB\grubx64.efi
EOF


