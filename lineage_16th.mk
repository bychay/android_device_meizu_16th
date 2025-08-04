#
# Copyright (C) 2018 The MoKee Open Source Project
# Copyright (C) 2022 The LineageOS Project
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

$(call inherit-product, device/meizu/16th/device.mk)

LINEAGE_BUILDTYPE := GAPPS

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
