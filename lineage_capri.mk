#
# Copyright (C) 2017-2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
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
PRODUCT_MODEL := moto g(10) power
PRODUCT_MANUFACTURER := motorola
PRODUCT_SHIPPING_API_LEVEL := 30

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 720
TARGET_SCREEN_WIDTH := 1600

# Build info
BUILD_FINGERPRINT := motorola/capri_retail/capri:11/RRB31.Q1-3-58/2b9e1:user/release-keys
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=capri_retail \
    PRIVATE_BUILD_DESC="capri_retail-user 11 RRB31.Q1-3-58 2b9e1 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-motorola


# TODO Notes:
# copied bootcrl from moto-common
# bootcrl has recovery directory which isn't present in moto-common
# copied bluetooth from moto-common and added missing flags from nio
# TODO Stopper: copy system.prop and update accordingly
# TODO Stopper: root directory might have extra stuff related to vintf or
# something not around, might have to remove them
# TODO Stopper: work on proprietary-files-rec as well
