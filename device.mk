# Copyright 2014 The Android Open Source Project
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

# Device path
DEVICE_PATH := device/motorola/capri/rootdir

# Device Specific Permissions
PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml

# Kernel
PRODUCT_COPY_FILES += \
    device/motorola/sm4250-common-kernel/bengal-moto-capri-Image.gz:kernel

# TODO: validate these files present in vendor
# Audio Configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/vendor/etc/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(DEVICE_PATH)/vendor/etc/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(DEVICE_PATH)/vendor/etc/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Device Init
PRODUCT_PACKAGES += \
    fstab.capri \
    ramdisk-fstab.capri \
    init.recovery.qcom.rc

# These should be output of the ROM build, we can ignore for TWRP
# Telephony Packages (AOSP)
PRODUCT_PACKAGES += \
    InCallUI \
    Stk

# Overlays, these should be output as well which we can ignore for TWRP I believe
# if not, we can comment these
PRODUCT_PACKAGES += \
   capriFrameworkOverlay \
   capriMotoActionsOverlay \
   capriSystemUIOverlay

# TODO LATER: Should be similar, may be come back in case stuff isnt' working out
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=280

# Inherit from those products. Most specific first.
$(call inherit-product, device/motorola/sm4250-common/platform.mk)

# TODO: include vendor
# include board vendor blobs
$(call inherit-product-if-exists, vendor/motorola/capri/capri-vendor.mk)
