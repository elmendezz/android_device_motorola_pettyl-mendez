# Version: 2
# Changelog:
# - Se cambió el nombre del producto de james a pettyl. [cite: 8]
# - Se actualizaron las rutas de herencia a pettyl. [cite: 8]
# - Se añadieron las flags de Android Go Edition para optimizar RAM.

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from Android Go configurations
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/mainline_low_ram.mk)

# Inherit from pettyl device setup
$(call inherit-product, device/motorola/pettyl/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier
PRODUCT_NAME := lineage_pettyl
PRODUCT_DEVICE := pettyl
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto E5 Play
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=pettyl \
    TARGET_DEVICE=pettyl
