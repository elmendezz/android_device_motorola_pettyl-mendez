#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Version: 2
# Changelog:
# - Se eliminó la restricción de huella digital (unavail.android.hardware.fingerprint.xml).
# - Se habilitó el soporte para el sensor de huellas en los permisos.
# - Se mantienen las correcciones de rutas de pettyl de la versión anterior.

# Inherit from msm8937-common
$(call inherit-product, device/motorola/msm8937-common/msm8937.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/motorola/pettyl/pettyl-vendor.mk)

# Boot animation
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
# Recuerda renombrar el archivo físico en configs/camera/ a msm8917_mot_pettyl_camera.xml
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/camera/mot_hi556_byd_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_hi556_byd_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/mot_hi556_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_hi556_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/mot_hi846_byd_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_hi846_byd_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/mot_hi846_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_hi846_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/msm8917_mot_pettyl_camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/msm8917_mot_pettyl_camera.xml

# Permissions
# Se quitó el "unavail" de fingerprint para que el sistema intente cargar el sensor.
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
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
