#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from capri device
$(call inherit-product, device/motorola/capri/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)


# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_capri
PRODUCT_DEVICE := capri
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g(10)
PRODUCT_MANUFACTURER := motorola
# Shipping API level TODO: this seems to be removed in 19.1 check later
PRODUCT_SHIPPING_API_LEVEL := 30

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1600

TARGET_SCREEN_DENSITY := 280

# Build info
BUILD_FINGERPRINT := motorola/capri_retail/capri:11/RRB31.Q1-3-58/2b9e1:user/release-keys
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="capri_retail-user 11 RRB31.Q1-3-58 2b9e1 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-motorola
