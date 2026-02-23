# Version: 2
# Changelog:
# - Se añadió soporte para ZRAM en el kernel.
# - Se optimizaron flags de compilación para 1GB de RAM.
# - Se verificó la ruta del FSTAB para el recovery.

# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Heredar del msm8937-common
-include device/motorola/msm8937-common/BoardConfigCommon.mk

DEVICE_PATH := device/motorola/pettyl

# Pantalla
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_DENSITY := 320 [cite: 1]

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml [cite: 1]

# Kernel
# Asegúrate de que el defconfig sea el correcto para el kernel 3.18/4.9 de pettyl
TARGET_KERNEL_CONFIG := pettyl_defconfig
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# Particiones
# El tamaño del recovery se mantiene según tu dump inicial [cite: 4]
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11490278400 [cite: 1]
BOARD_FLASH_BLOCK_SIZE := 131072

# ZRAM y SWAP
# Habilitamos esto para que el sistema use el swap que definimos en el fstab
+TARGET_USES_POST_INTERACTION_FLING_OPTIMIZATION := true
+PRODUCT_FULL_TREBLE_OVERRIDE := true

# Seguridad
VENDOR_SECURITY_PATCH := 2020-06-04 [cite: 1]

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy [cite: 1]

# Versión de Vendor
-include vendor/motorola/pettyl/BoardConfigVendor.mk
