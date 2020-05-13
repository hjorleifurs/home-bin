#!/bin/bash

# Laga white noise hljóð sem kemur eftir að laptop kemur úr suspend/sleep/hibernation

#slökkva á pulseaudio
systemctl --user stop pulseaudio pulseaudio.socket
# force reconfig á hljóðið
echo 1 | sudo tee /sys/class/sound/hwC0D0/reconfig
#kveikja aftur á pulseaudio
systemctl --user start pulseaudio pulseaudio.socket

