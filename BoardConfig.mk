# Version: 4
# Changelog:
# - Se corrigió la resolución de pantalla a 480x960 según especificaciones del usuario.
# - Se ajustó la densidad de pantalla (DPI) a 240 para FWVGA+.
# - Se eliminaron etiquetas de texto y caracteres especiales que causaban error de target patterns.
# - Se mantiene el soporte para ZRAM y optimizaciones de 1GB RAM.
# - Se mantiene la ruta del manifest y sepolicy.

# Heredar del msm8937-common
-include device/motorola/msm8937-common/BoardConfigCommon.mk

DEVICE_PATH := device/motorola/pettyl

# Pantalla
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 480
TARGET_SCREEN_DENSITY := 240

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Kernel - Usando Prebuilt
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/kernel
BOARD_BOOTIMG_HEADER_VERSION := 0
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_BASE     := 0x80000000
BOARD_KERNEL_TAGS_ADDR := 0x80000100
BOARD_KERNEL_OFFSET    := 0x00008000
BOARD_RAMDISK_OFFSET   := 0x01000000
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 androidboot.console=ttyMSM0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3f ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 earlycon=msm_hsl,0x78b0000

# Particiones
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11490278400
BOARD_FLASH_BLOCK_SIZE := 131072

# ZRAM y SWAP
TARGET_USES_POST_INTERACTION_FLING_OPTIMIZATION := true
PRODUCT_FULL_TREBLE_OVERRIDE := true

# Seguridad
VENDOR_SECURITY_PATCH := 2020-06-04

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Versión de Vendor
-include vendor/motorola/pettyl/BoardConfigVendor.mk
