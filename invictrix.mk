# Copyright (C) 2013-2018 The Dirty Unicorns Project
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
# This file is the build configuration for an aosp Android
# build for marlin hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, aosp and du, hence its name.
#

# Include vendor common configuration
include vendor/invictrix/config/common.mk
include vendor/invictrix/config/gsm.mk

# Inherit from AOSP products. Most specific first.
$(call inherit-product, device/google/marlin/aosp_marlin.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

## Camera
PRODUCT_PACKAGES += \
    libion

## IMS
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    PresencePolling \
    RcsService

## TextClassifier smart selection model files
PRODUCT_PACKAGES += \
    textclassifier.smartselection.bundle1

## Device identifier. This must come after all inclusions
PRODUCT_NAME := invictrix_marlin
PRODUCT_DEVICE := marlin
PRODUCT_BRAND := Google
PRODUCT_MODEL := Pixel XL
TARGET_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="marlin" \
    TARGET_DEVICE="marlin" \
    PRIVATE_BUILD_DESC="marlin-user 10 QP1A.190711.020 5800535 release-keys"

BUILD_FINGERPRINT := "google/marlin/marlin:10/QP1A.190711.020/5800535:user/release-keys"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=google/marlin/marlin:10/QP1A.190711.020/5800535:user/release-keys

$(call inherit-product-if-exists, vendor/google/marlin/marlin-vendor.mk)
$(call inherit-product-if-exists, vendor/pixelgapps/pixel-gapps.mk)
