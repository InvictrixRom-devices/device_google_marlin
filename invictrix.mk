# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440

# Inherit some common stuff.
$(call inherit-product, vendor/invictrix/config/common.mk)

# Inherit device configuration
$(call inherit-product, device/google/marlin/aosp_marlin.mk)

-include device/google/marlin/marlin/device-invictrix.mk

INVICTRIX_MAINTAINER := NepoRood

# Device identifier. This must come after all inclusions
PRODUCT_NAME := invictrix_marlin
PRODUCT_BRAND := Google
PRODUCT_MODEL := Pixel XL
TARGET_MANUFACTURER := HTC
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=marlin \
    PRIVATE_BUILD_DESC="marlin-user 8.1.0 OPM4.171019.021.D1 4768809 release-keys"

BUILD_FINGERPRINT := google/marlin/marlin:8.1.0/OPM4.171019.021.D1/4768809:user/release-keys

$(call inherit-product-if-exists, vendor/google/marlin/marlin-vendor.mk)

