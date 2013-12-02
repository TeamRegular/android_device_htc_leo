# Release name
PRODUCT_RELEASE_NAME := Leo

# Inherit device configuration for leo.
$(call inherit-product, device/htc/leo/full_leo.mk)

# Inherit some common cm stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_htcleo
PRODUCT_DEVICE := htcleo

# Bootanimation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=leo BUILD_FINGERPRINT=google/htc_leo/leo:4.2.2/JDQ39/573038:user/release-keys PRIVATE_BUILD_DESC="leo-user 4.2.2 JDQ39 573038 release-keys"

