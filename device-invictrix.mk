# Camera
PRODUCT_PACKAGES += \
    libion

# IMS
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    PresencePolling \
    RcsService

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/google/marlin/overlay-invictrix

# Pixel Experience
PRODUCT_COPY_FILES += \
    device/google/marlin/nexus.xml:system/etc/sysconfig/nexus.xml

# TextClassifier smart selection model files
PRODUCT_PACKAGES += \
    textclassifier.smartselection.bundle1
