#!/usr/bin/env sh

# More info on
# https://ukbaz.github.io//howto/python_gio_1.html
# https://gist.github.com/madushan1000/9744eb6350a5dd9685fb6bfbb25fbb8a

left_battery=$(
  busctl introspect org.bluez /org/bluez/hci0/dev_D0_AD_70_06_3E_45 |
    grep 'Percentage' | grep -Eo '[0-9]+'
)

# 00002a19-0000-1000-8000-00805f9b34fb
right_battery=$(
  busctl introspect org.bluez /org/bluez/hci0/dev_D0_AD_70_06_3E_45/service0015/char0016 |
    grep '^.Value' | grep -Eo '[0-9]+' | tail -n1
)

if [ -z "$right_battery" ]; then
  echo " $left_battery  $right_battery"
else
  echo ""
fi
