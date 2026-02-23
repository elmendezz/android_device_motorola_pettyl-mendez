#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Version: 1
# Changelog:
# - Se cambió la herencia del vendor de james a pettyl.
# - Se actualizaron las rutas de copia de archivos de cámara (msm8917_mot_pettyl_camera.xml).
# - Se ajustó el TARGET_SCREEN_HEIGHT/WIDTH (confirmar si tu pettyl es 18:9 o 16:9).
# - Se mantienen los overlays y configuraciones de sensores para pettyl.

# Inherit from msm8937-common
$(call inherit-product, device/motorola/msm8937-common/msm8937.mk)

# Get non-open-source specific aspects
# ¡Asegúrate de que este archivo exista en tu carpeta vendor/motorola/pettyl/!
$(call inherit-product-if-exists, vendor/motorola/pettyl/pettyl-vendor.mk)

# Boot animation
# Nota: La mayoría de los Moto E5 Play son 720x1280 (16:9), pero si es el Go 18:9, sería 480x960.
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Camera
# IMPORTANTE: El archivo xml de la cámara debe llamarse como el dispositivo. 
# Si en tu carpeta configs/camera/ sigue diciendo james, cámbiale el nombre al archivo físico a pettyl.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/camera/mot_hi556_byd_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_hi556_byd_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/mot_hi556_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_hi556_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/mot_hi846_byd_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_hi846_byd_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/mot_hi846_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_hi846_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/msm8917_mot_pettyl_camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/msm8917_mot_pettyl_camera.xml

# Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/unavail.android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/unavail.android.hardware.fingerprint.xml \
    $(LOCAL_PATH)/configs/permissions/unavail.android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/unavail.android.hardware.sensor.gyroscope.xml

# Ramdisk
PRODUCT_PACKAGES += \
    init.device.rc

# Releasetools script
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/check_device.sh:install/bin/check_device.sh

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev.conf
