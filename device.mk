# Copyright (C) 2009 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for leo hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/htc/leo/overlay

# Sensors & Lights
PRODUCT_PACKAGES += \
	sensors.htcleo \
	lights.htcleo \
	leo-reference-ril 

# Ramdisk
PRODUCT_COPY_FILES += \
	device/htc/leo/ramdisk/init.htcleo.rc:root/init.htcleo.rc \
	device/htc/leo/ramdisk/init.htcleo.usb.rc:root/init.htcleo.usb.rc \
	device/htc/leo/ramdisk/ueventd.htcleo.rc:root/ueventd.htcleo.rc \
	device/htc/leo/ramdisk/logo.rle:root/logo.rle \

# GPS
PRODUCT_COPY_FILES += \
     device/htc/leo/configs/gps.conf:system/etc/gps.conf

# Add the postrecoveryboot.sh so that the recovery.fstab can be changed
PRODUCT_COPY_FILES += \
    device/htc/leo/scripts/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

# media config xml file
PRODUCT_COPY_FILES += \
	device/htc/leo/configs/media_profiles.xml:system/etc/media_profiles.xml

# Scripts
PRODUCT_COPY_FILES += \
	device/htc/leo/scripts/init.d/00_cpufreq:system/etc/init.d/00_cpufreq \
	device/htc/leo/scripts/init.d/01_modules:system/etc/init.d/01_modules \
	device/htc/leo/scripts/init.d/02usb_tethering:system/etc/init.d/02usb_tethering \
	device/htc/leo/scripts/init.d/10mic_level:system/etc/init.d/10mic_level \
	device/htc/leo/scripts/init.d/99_libhtc_ril_fix:system/etc/init.d/99_libhtc_ril_fix \
	device/htc/leo/scripts/init.d/99_button_light_off:system/etc/init.d/99_button_light_off \
	device/htc/leo/scripts/init.d/99_youtube_fix:system/etc/init.d/99_youtube_fix 

# Keylayouts
PRODUCT_COPY_FILES += \
	device/htc/leo/keylayout/htcleo-keypad.kl:system/usr/keylayout/htcleo-keypad.kl \
	device/htc/leo/keylayout/htcleo-keypad.kcm:system/usr/keychars/htcleo-keypad.kcm \
	device/htc/leo/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
	device/htc/leo/keylayout/htcleo-touchscreen.idc:system/usr/idc/htcleo-touchscreen.idc

# Kernel modules
#ifeq ($(TARGET_PREBUILT_KERNEL),)
PRODUCT_COPY_FILES += $(shell \
    find device/htc/leo/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')
#endif

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml 

# QSD8K Commomn Stuff
$(call inherit-product, device/htc/qsd8k-common/qsd8k.mk)

# Vendor
$(call inherit-product, vendor/htc/leo/leo-vendor.mk)