#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)

# Evolution X Phase-1 bring-up intentionally keeps the known-good Lineage
# hardware-facing overlays/services. The clean AOSP-facing implementation stays
# on bringup/aosp17 for the later de-identification phase.
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage \
    $(LOCAL_PATH)/overlay-lineage

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(LOCAL_PATH)/overlay/frameworks/base/packages/overlays/NoCutoutOverlay

PRODUCT_PACKAGES += \
    NoCutoutOverlay

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

TARGET_SCREEN_HEIGHT := 2280
TARGET_SCREEN_WIDTH := 1080

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Hardware-facing Lineage services retained only for fast Phase-1 bring-up.
PRODUCT_PACKAGES += \
    android.hardware.light-service.lineage \
    OnePlusPocketMode

# Power
PRODUCT_COPY_FILES += \
    system/core/libprocessgroup/profiles/cgroups_28.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    system/core/libprocessgroup/profiles/task_profiles_28.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

PRODUCT_PACKAGES += \
    TargetWifiOverlay

# Known-good OnePlus SDM845 userspace/HAL stack.
$(call inherit-product, device/oneplus/sdm845-common/common.mk)

# Proprietary OOS-derived blobs.
$(call inherit-product, vendor/oneplus/enchilada/enchilada-vendor.mk)
