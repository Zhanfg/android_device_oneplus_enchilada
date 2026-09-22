#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
#

# Keep the stock OnePlus 6 hardware identity while using Evolution X/Lineage
# product infrastructure for the Phase-1 Android 17 bring-up.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, device/oneplus/enchilada/device.mk)
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_enchilada
PRODUCT_DEVICE := enchilada
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := ONEPLUS A6003

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

# Legacy proprietary blobs expect the final OOS vendor identity. This is a
# vendor-compatibility override, not the long-term ROM/product identity.
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="OnePlus6-user 11 release-keys" \
    BuildFingerprint=OnePlus/OnePlus6/OnePlus6:11/RKQ1.201217.002/2111252325:user/release-keys \
    DeviceName=OnePlus6 \
    DeviceProduct=OnePlus6 \
    SystemDevice=OnePlus6 \
    SystemName=OnePlus6
