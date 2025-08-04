#
# Copyright (C) 2018-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sdm845-common
include device/meizu/sdm845-common/BoardConfigCommon.mk

DEVICE_PATH := device/meizu/16th

# Assert
TARGET_OTA_ASSERT_DEVICE := 16th

# Audio
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true

# FM
BOARD_HAS_QCA_FM_SOC := "cherokee"
BOARD_HAVE_QCOM_FM := true

# Display
TARGET_SCREEN_DENSITY := 400

# Kernel
#TARGET_KERNEL_CONFIG += vendor/meizu/16th.config

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Partitions
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67092480

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop

# Power
TARGET_TAP_TO_WAKE_NODE := "/dev/input/event2"

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# Inherit from the proprietary version
include vendor/meizu/16th/BoardConfigVendor.mk
