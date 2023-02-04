#!/bin/sh

# make bluetooth click to on/off  maybe also connect
#
# Check if a device is connected by bluetooth using bluetoothctl
info=$(bluetoothctl info | grep Device)

# Show some output when it is
if echo "$info" | grep -q "Device"; 
then
    # Connected to a device
    echo ''
else 
    # Not connected to a device, hide label
    echo ''
fi
