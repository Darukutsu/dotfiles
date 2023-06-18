# MCU name
MCU = atmega32u4

# Bootloader selection
BOOTLOADER = atmel-dfu

# Build Options
#   change yes to no to disable
#
BOOTMAGIC_ENABLE = yes      # Enable Bootmagic Lite
MOUSEKEY_ENABLE = yes       # Mouse keys
EXTRAKEY_ENABLE = yes       # Audio control and System control
CONSOLE_ENABLE = no         # Console for debug
COMMAND_ENABLE = no         # Commands for debug and configuration
NKRO_ENABLE = no            # Enable N-Key Rollover
BACKLIGHT_ENABLE = no       # Enable keyboard backlight functionality
AUDIO_ENABLE = no           # Audio output
RGB_MATRIX_ENABLE = yes
RGB_MATRIX_DRIVER = WS2812
KEY_OVERRIDE_ENABLE = yes
TAP_DANCE_ENABLE = no
DYNAMIC_MACRO_ENABLE = yes

LAYOUTS = planck_mit
LAYOUTS_HAS_RGB = yes

#UNICODE_ENABLE = yes
UNICODEMAP_ENABLE = yes
CAPS_WORD_ENABLE = yes
