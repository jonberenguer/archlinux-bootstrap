#!/bin/bash


GETPKG='pacman -S --noconfirm'


input () {
  $GETPKG xf86-input-libinput xorg-xinput

  # tips for xinput
  # xinput #returns list of input devices
  # xinput --disable <id>
  # xinput --enable <id>
}


input_gestures () {
  cd /opt/AUR
  git clone https://aur.archlinux.org/libinput-gestures.git

  cd libinput-gestures
  makepkg -si
}


video () {
  $GETPKG xf86-video-intel lib32-intel-dri lib32-mesa lib32-libgl
}


audio () {
  $GETPKG alsa-utils alsa-firmware
  amixer sset Master unmute
  amixer sset Headphone unmute
  amixer sset Speaker unmute
}


system () {
    $GETPKG dmicode
    $GETPKG dkms
    $GETPKG cpupower
}


firmware_service () {
  # linux vendor firmware service
  $GETPKG fwupd

  fwupmgr refresh
  fwupmgr get-updates
  # usage
  # fwupdmgr get-devices
  # fwupdmgr refresh
  # fwupdmgr get-updates
  # fwupdmgr update
}


throttling () {
 # x1c 6th throttling issue
 $GETPKG throttled
 systemctl enable --now lenovo_fix.service
}


ssdtrim () {
  $GETPKG utils-linux
  systemctl enable fstrim.timer
}


wifi () {
  $GETPKG iw wpa_supplicant
}


bluetooth () {
  $GETPKG bluez bluez-utils
  systemctl enable --now bluetooth.service
}


usb () {
  $GETPKG usbutils
}


input
video
audio
firmware_service
throttling
ssdtrim
wifi
bluetooth


# verify suspend support
dmesg | grep -i "acpi: (supports"
