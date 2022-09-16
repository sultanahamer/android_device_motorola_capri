#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from capri device
$(call inherit-product, device/motorola/capri/device.mk)

PRODUCT_DEVICE := capri
PRODUCT_NAME := lineage_capri
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g(10)
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="capri_retail-user 11 RRB31.Q1-3-58 2b9e1 release-keys"

BUILD_FINGERPRINT := motorola/capri_retail/capri:11/RRB31.Q1-3-58/2b9e1:user/release-keys
