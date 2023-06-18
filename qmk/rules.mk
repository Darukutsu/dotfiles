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
KEY_OVERRIDE_ENABLE = yes
TAP_DANCE_ENABLE = no
DYNAMIC_MACRO_ENABLE = yes
SPACE_CADET_ENABLE = no
GRAVE_ESC_ENABLE = no 
#MAGIC_ENABLE = no 
#AVR_USE_MINIMAL_PRINTF = yes

LAYOUTS_HAS_RGB = yes
#LTO_ENABLE = yes # Link time optimization

UNICODEMAP_ENABLE = yes
CAPS_WORD_ENABLE = yes
