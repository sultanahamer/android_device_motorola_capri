#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/capri

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    system \
    system_ext \
    vendor \
    product
BOARD_USES_RECOVERY_AS_BOOT := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a9

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := capri
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 280
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1600

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_CONFIG := capri_defconfig
TARGET_KERNEL_SOURCE := kernel/motorola/capri

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo.img
BOARD_KERNEL_SEPARATED_DTBO := 
endif

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_SUPER_PARTITION_SIZE := 10267656192
BOARD_SUPER_PARTITION_GROUPS := motorola_dynamic_partitions
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext vendor product
# DYNAMIC_PARTITIONS_SIZE = (SUPER_PARTITION_SIZE / 2) - 4MB
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_SIZE := 5129633792

# Platform
TARGET_BOARD_PLATFORM := bengal

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml

DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/device_framework_matrix.xml \
                                              $(DEVICE_PATH)/device_framework_matrix_system.xml

# Users setup

TARGET_FS_CONFIG_GEN += $(DEVICE_PATH)/config.fs

# Inherit the proprietary files
include vendor/motorola/capri/BoardConfigVendor.mk
