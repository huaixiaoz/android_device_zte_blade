#
# Copyright (C) 2011 The Android Open-Source Project
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

# This file includes all definitions that apply to ALL blade devices, and
# are also specific to blade devices
#
# Everything in this directory will become public

DEVICE_PACKAGE_OVERLAYS := device/zte/blade/overlay
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_PACKAGES := \
        lights.blade \
        sensors.blade \
        librpc \
        gps.blade \
        BladeParts \
        libmm-omxcore \
        libOmxCore \
        libOmxVdec \
        libOmxVenc \
        libstagefrighthw \
        dexpreopt \
        camera.msm7x27 \
        gralloc.msm7x27 \
        copybit.msm7x27 \
        hwcomposer.msm7x27

PRODUCT_PACKAGES += \
        audio.primary.blade \
        audio_policy.blade \
        audio.a2dp.default \
        libaudioutils

DISABLE_DEXPREOPT := false

PRODUCT_COPY_FILES := \
        device/zte/blade/init.blade.rc:root/init.blade.rc \
        device/zte/blade/init.blade.usb.rc:root/init.blade.usb.rc \
        device/zte/blade/ueventd.blade.rc:root/ueventd.blade.rc \
        device/zte/blade/vold.fstab:system/etc/vold.fstab \
        device/zte/blade/prebuilt/blade_keypad.kl:/system/usr/keylayout/blade_keypad.kl \
        device/zte/blade/AudioFilter.csv:system/etc/AudioFilter.csv \
        device/zte/blade/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
        device/zte/blade/media_profiles.xml:system/etc/media_profiles.xml \
        device/zte/blade/prebuilt/start_usb0.sh:system/etc/start_usb0.sh \
        device/zte/blade/gps.conf:system/etc/gps.conf

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
        device/zte/blade/init.bt.sh:system/etc/init.bt.sh \
        system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

# WiFi
PRODUCT_COPY_FILES += \
        device/zte/blade/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
        device/zte/blade/prebuilt/ar6000.ko:system/wifi/ar6000.ko \
        device/zte/blade/firmware/regcode:system/wifi/regcode \
        device/zte/blade/firmware/data.patch.hw2_0.bin:system/wifi/data.patch.hw2_0.bin \
        device/zte/blade/firmware/athwlan.bin.z77:system/wifi/athwlan.bin.z77 \
        device/zte/blade/firmware/athtcmd_ram.bin:system/wifi/athtcmd_ram.bin \
        device/zte/blade/firmware/device.bin:system/wifi/device.bin \
        device/zte/blade/firmware/eeprom.bin:system/wifi/eeprom.bin \
        device/zte/blade/firmware/eeprom.data:system/wifi/eeprom.data

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers \
        librs_jni

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
         frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
         frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
         frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
         frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
         frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
         frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
         frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
         frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
         packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
         librs_jni

# for bugmailer
ifneq ($(TARGET_BUILD_VARIANT),user)
         PRODUCT_PACKAGES += send_bug
         PRODUCT_COPY_FILES += \
                 system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
                 system/extras/bugmailer/send_bug:system/bin/send_bug
endif

$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)
#$(call inherit-product, frameworks/base/build/phone-hdpi-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/zte/blade/blade-vendor.mk)