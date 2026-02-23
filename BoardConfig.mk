# Version: 1
# Changelog:
# - Se actualizó DEVICE_PATH a pettyl.
# - Se ajustó el tamaño de la partición de recovery para pettyl.
# - Se incluyeron las rutas de vendor correspondientes.

# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from msm8937-common
-include device/motorola/msm8937-common/BoardConfigCommon.mk

DEVICE_PATH := device/motorola/pettyl

# Display
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
[cite_start]TARGET_SCREEN_DENSITY := 320 [cite: 1]

# HIDL
[cite_start]DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml [cite: 1]

# Kernel
TARGET_KERNEL_CONFIG := pettyl_defconfig

# Partitions (Asegúrate de verificar estos valores con un dump real de pettyl)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
[cite_start]BOARD_USERDATAIMAGE_PARTITION_SIZE := 11490278400 [cite: 1]

# Security patch level
[cite_start]VENDOR_SECURITY_PATCH := 2020-06-04 [cite: 1]

# SELinux
[cite_start]BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy [cite: 1]

# Inherit from the proprietary version
-include vendor/motorola/pettyl/BoardConfigVendor.mk
