# Pull all dictionaries (This makes sure it gets called)
TARGET_USE_KEYBOARD := international

# Call this first so apn list is actually copied
$(call inherit-product, vendor/slim/config/gsm.mk)

# Inherit AOSP device configuration for leo.
$(call inherit-product, device/htc/leo/device_leo.mk)

# Inherit some common Slimroms stuff.
$(call inherit-product, vendor/slim/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions
PRODUCT_MODEL := HTC HD2
PRODUCT_MANUFACTURER := HTC
PRODUCT_BRAND := htc
PRODUCT_DEVICE := leo
PRODUCT_NAME := slim_leo
PRODUCT_CODENAME := leo

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=leo BUILD_FINGERPRINT=google/htc_leo/leo:4.2.2/JDQ39/573038:user/release-keys PRIVATE_BUILD_DESC="leo-user 4.2.2 JDQ39 573038 release-keys"

#
# Set up the product codename, build version & MOTD.
#
PRODUCT_CODENAME := King
PRODUCT_VERSION_DEVICE_SPECIFIC := a1

PRODUCT_MOTD :="\n\n\n--------------------MESSAGE---------------------\nThank you for choosing Slimroms for your HTC HD2\nPlease visit us at \#Slimroms.net to get the latest rom\n------------------------------------------------\n"

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/common/bootanimation/480.zip:system/media/bootanimation.zip

# Hot reboot
#PRODUCT_PACKAGE_OVERLAYS += vendor/slim/overlay/hot_reboot
