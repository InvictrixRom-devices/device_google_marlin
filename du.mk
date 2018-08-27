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

# Inherit from AOSP products. Most specific first.
$(call inherit-product, device/google/marlin/aosp_marlin.mk)

# Inherit DU product configuration
$(call inherit-product, vendor/du/config/common_full_phone.mk)

# Custom device configuration

$(call inherit-product-if-exists, vendor/google/marlin/device-vendor-marlin.mk)
$(call inherit-product-if-exists, vendor/pixelgapps/pixel-gapps.mk) #TODO: To be removed

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
PRODUCT_NAME := du_marlin
PRODUCT_DEVICE := marlin
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel XL
TARGET_MANUFACTURER := HTC
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=marlin \
    PRIVATE_BUILD_DESC="marlin-user 9 PPR1.180610.009 4898911 release-keys"

BUILD_FINGERPRINT="google/marlin/marlin:9/PPR1.180610.009/4898911:user/release-keys"
BUILD_THUMBPRINT="9/PPR1.180610.009/4898911:user/release-keys"