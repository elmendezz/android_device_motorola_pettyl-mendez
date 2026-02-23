#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
# Version: 3
# Changelog:
# - Se cambiaron referencias de james a pettyl.
# - Se activó el modo Android Go Edition.
# - Se añadieron flags de optimización de memoria.

# Heredar del msm8937-common
$(call inherit-product, device/motorola/msm8937-common/msm8937.mk)

# Heredar configuraciones de Android Go
$(call inherit-product, $(SRC_TARGET_DIR)/product/go_defaults.mk)

# Obtener aspectos específicos de vendor (Propietarios)
$(call inherit-product-if-exists, vendor/motorola/pettyl/pettyl-vendor.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Propiedades
-include $(LOCAL_PATH)/vendor_prop.mk

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Camera (Ajustado para pettyl)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/camera/mot_hi556_byd_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_hi556_byd_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/mot_hi556_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_hi556_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/mot_hi846_byd_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_hi846_byd_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/mot_hi846_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_hi846_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/msm8917_mot_pettyl_camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/msm8917_mot_pettyl_camera.xml

# Keylayout e IDC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/uinput-egis.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-egis.kl \
    $(LOCAL_PATH)/idc/uinput-egis.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-egis.idc

# Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/unavail.android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/unavail.android.hardware.fingerprint.xml \
    $(LOCAL_PATH)/configs/permissions/unavail.android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/unavail.android.hardware.sensor.gyroscope.xml

# Ramdisk y Sensores
PRODUCT_PACKAGES += \
    init.device.rc \
    init.qcom.sensors.sh

# Releasetools script
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/check_device.sh:install/bin/check_device.sh

# Sensors Config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf \
    $(LOCAL_PATH)/configs/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev.conf

# Optimización de Memoria (Go Edition Specific)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true \
    ro.lmk.low=1001 \
    ro.config.max_starting_bg=2 \
    ro.sys.fw.bg_apps_limit=8

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
