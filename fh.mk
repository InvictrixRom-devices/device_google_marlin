# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440

# Inherit some common FireHound stuff.
$(call inherit-product, vendor/fh/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/marlin/aosp_marlin.mk)
$(call inherit-product, vendor/nepo/my-apps.mk)

# Disable FH Prebuilts
DISABLE_CNM := true
DISABLE_CWB := true

-include device/google/marlin/marlin/device-lineage.mk

# Device identifier. This must come after all inclusions
PRODUCT_NAME := fh_marlin
PRODUCT_BRAND := Google
PRODUCT_MODEL := Pixel XL
TARGET_MANUFACTURER := HTC
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=marlin \
    BUILD_FINGERPRINT=google/marlin/marlin:8.1.0/OPM2.171019.029/4657601:user/release-keys \
    PRIVATE_BUILD_DESC="marlin-user 8.1.0 OPM2.171019.029 4657601 release-keys"

$(call inherit-product-if-exists, vendor/google/marlin/marlin-vendor.mk)

