#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Version: 1
# Changelog:
# - Se cambió el DEVICE_PATH a pettyl.
# - Se actualizó el TARGET_OTA_ASSERT_DEVICE para reconocer pettyl y rpettyl.
# - El TARGET_KERNEL_CONFIG se ajustó a pettyl_defconfig (asegúrate de que exista en tu kernel source).
# - Se actualizaron las rutas de inclusión de los blobs del vendor a pettyl.
# - Se mantuvo la herencia del common msm8937 (que cubre al 8917).

# Inherit from msm8937-common
-include device/motorola/msm8937-common/BoardConfigCommon.mk

DEVICE_PATH := device/motorola/pettyl

# Assert (Esto evita que flashees un zip de pettyl en un james por error)
TARGET_OTA_ASSERT_DEVICE := pettyl,rpettyl

# Kernel
# NOTA: Si tu fuente de kernel no tiene pettyl_defconfig, usa james_defconfig, 
# pero lo ideal es que coincida con el nombre del dispositivo.
TARGET_KERNEL_CONFIG := pettyl_defconfig

# Partitions
# Los tamaños de partición deben ser exactos. Estos valores son los estándar para pettyl.
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16879616
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11490278400

# Security patch level
# Puedes subirlo si tienes parches más recientes, pero mantenemos el de la base por ahora.
VENDOR_SECURITY_PATCH := 2019-03-01

# Inherit from the proprietary version
# Asegúrate de haber renombrado tu carpeta en vendor/motorola/ a pettyl
-include vendor/motorola/pettyl/BoardConfigVendor.mk
