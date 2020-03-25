

# scripts are specific to Lenovo 6th X1 Carbon

## wifi quick referece
cat << EOF > /etc/wpa_supplicant/wpa_supplicant.conf
ctrl_interface=/run/wpa_supplicant
update_config=1

EOF

# run the following as root
# wpa_supplicant -B -i wlp2s0 -c <(wpa_passphrase ESSID passphrase)
# dhcpcd wlp2s0


## specfic for cpu freq scaling
cpupower frequency-info
analyzing CPU 0:
  driver: intel_pstate
  CPUs which run at the same hardware frequency: 0
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency:  Cannot determine or is not supported.
  hardware limits: 400 MHz - 4.00 GHz
  available cpufreq governors: performance powersave
  current policy: frequency should be within 400 MHz and 4.00 GHz.
                  The governor "powersave" may decide which speed to use
                  within this range.
  current CPU frequency: Unable to call hardware
  current CPU frequency: 2.22 GHz (asserted by call to kernel)
  boost state support:
    Supported: yes
    Active: yes


pacman -S cpupower
systemctl start cpupower.service

# max
cpupower frequency-set -u 4.00GHz

# min
cpupower frequency-set -d 400MHz


# disable turbo boost
echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo




## quick reference for bluetooth pairing
(https://wiki.archlinux.org/index.php/Bluetooth)

bluetoothctl

power on
devices
scan on
agent on
pair <mac>
trust <mac>
connect <mac>

# configs

/etc/bluetooth/main.conf

[Policy]
AutoEnable=true

