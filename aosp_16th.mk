#
# Copyright (C) 2018-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, device/meizu/16th/device.mk)

# Inherit some common Elixir stuff.
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_INCLUDE_STOCK_ACORE := false
TARGET_INCLUDE_LIVE_WALLPAPERS := true
TARGET_FACE_UNLOCK_SUPPORTED := true
EXTRA_UDFPS_ANIMATIONS := true
IS_PHONE := true
FORCE_LAWNCHAIR := true
# Official
ELIXIR_BUILD_TYPE := UNOFFICIAL
BUILD_USERNAME := unknown
BUILD_HOSTNAME := Elixir

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := aosp_16th
PRODUCT_DEVICE := 16th
PRODUCT_BRAND := Meizu
PRODUCT_MODEL := 16th
PRODUCT_MANUFACTURER := Meizu

PRODUCT_SYSTEM_NAME := 16th

BUILD_FINGERPRINT := "google/cheetah_beta/cheetah:16/BP22.250325.007/13352765:user/release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="cheetah_beta-user 16 BP22.250325.007 13352765 release-keys" \
    TARGET_PRODUCT="16th"

PRODUCT_GMS_CLIENTID_BASE := android-meizu
