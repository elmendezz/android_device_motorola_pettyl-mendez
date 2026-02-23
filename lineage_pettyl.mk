#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Version: 1
# Changelog:
# - Renombrado de james a pettyl en todas las rutas de herencia.
# - Actualizado PRODUCT_NAME y PRODUCT_DEVICE a pettyl.
# - Ajuste de PRODUCT_BUILD_PROP_OVERRIDES para reflejar el modelo pettyl.
# - Actualización de BUILD_FINGERPRINT con valores específicos de pettyl (Moto E5 Play GO).
# - Mantenimiento de la base GMS de Motorola.

# Heredar del device.mk del pettyl (asegúrate de renombrar esa carpeta también)
$(call inherit-product, device/motorola/pettyl/device.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_pettyl
PRODUCT_DEVICE := pettyl
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto e5 play go
PRODUCT_MANUFACTURER := motorola

PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
    ro.product.model \
    ro.product.name

# Ajuste de descripción de build y fingerprint para PETTYL
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="pettyl-user 8.1.0 OPG28.54-53 26038 release-keys" \
    PRODUCT_NAME="pettyl"

BUILD_FINGERPRINT := motorola/pettyl/pettyl:8.1.0/OPG28.54-53/26038:user/release-keys

PRODUCT_GMS_CLIENTID_BASE := android-motorola
