# Version: 5
# Changelog:
# - Se cambió el nombre del producto de james a pettyl.
# - Se actualizaron las rutas de herencia a pettyl.
# - Se añadieron las flags de Android Go Edition para optimizar RAM.
# - Se corrigió el orden de herencia para asegurar que vendor/lineage cargue después de las bases de AOSP.
# - Se eliminó la herencia de core_64bit.mk y full_base_telephony.mk, ya que el dispositivo opera en 32 bits y LineageOS ya provee la base con common_full_phone.mk.
# - Se eliminó mainline_low_ram.mk (no existe en Android 10/LineageOS 17.1) y se reemplazó por la variable nativa PRODUCT_IS_LOW_RAM := true.

# Configuración de idiomas
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Configuración de Android Go (Low RAM) compatible con LineageOS 17.1 (Android 10)
PRODUCT_IS_LOW_RAM := true

# Heredar del árbol de dispositivo (el cual define la arquitectura base y particiones)
$(call inherit-product, device/motorola/pettyl/device.mk)

# IMPORTANTE: Heredar de Lineage al final para que sobreescriba configuraciones globales y aporte la base del sistema
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Identificadores del Producto
PRODUCT_NAME := lineage_pettyl
PRODUCT_DEVICE := pettyl
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto E5 Play
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=pettyl \
    TARGET_DEVICE=pettyl
