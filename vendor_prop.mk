# Version: 1
# Changelog:
# - Ajuste de densidad de pantalla y optimización de dalvik para low-ram.

# Audio
TARGET_CORE_DATA_SUBSYS_CONFIG := /vendor/etc/audio_platform_info.xml

# Display
ro.sf.lcd_density=320

# Dalvik heap configurations for 1GB/1.5GB RAM
dalvik.vm.heapstartsize=8m
dalvik.vm.heapgrowthlimit=128m
dalvik.vm.heapsize=256m
dalvik.vm.heaptargetutilization=0.75
dalvik.vm.heapminfree=512k
dalvik.vm.heapmaxfree=8m

# ZRAM and Low RAM Props
ro.config.low_ram=true
ro.lmk.low=1001
config.disable_atlas=true
