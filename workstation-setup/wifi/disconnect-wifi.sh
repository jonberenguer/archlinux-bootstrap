#!/bin/bash

killall wpa_supplicant

rfkill list wifi

rfkill block `rfkill list all | grep Wireless | cut -c1-1`

rfkill list wifi
