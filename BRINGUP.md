# OnePlus 6 AOSP 17 bring-up

This branch is the active device layer for the independent Android 17 ROM.
It is intentionally **not** a LineageOS product branch.

## Product identity

- Product target: `aosp_enchilada`
- Userspace base: Google AOSP `android-17.0.0_r1`
- Do not inherit `vendor/lineage/config/*`.
- Do not add `ro.lineage.*`, `org.lineageos.*`, `vendor.lineage.*`, or Lineage SDK/runtime dependencies to the shipping image.
- Copyright/history comments inherited from upstream are not runtime identity and must not be stripped merely for branding.

## Current bridge state

The device description still reuses audited hardware facts from the established OnePlus 6 community tree. The current 4.19 kernel and legacy OOS vendor stack are Stage-0 bring-up inputs only.

Temporarily omitted while AOSP-native replacements are prepared:

- Lineage light service
- OnePlusPocketMode
- Lineage SDK overlays

The common SDM845 layer is inherited through `device/oneplus/sdm845-common/aosp-common.mk`, which filters Lineage-specific runtime packages.

## Milestones

1. AOSP product parsing / Soong bootstrap
2. boot → init → adb
3. display + touch
4. Wi-Fi / Bluetooth / audio / sensors
5. RIL / IMS / fingerprint / camera
6. GKI 5.15 replacement for the 4.19 bridge kernel
7. dynamic partitions / recovery / signed OTA
8. custom AVB root of trust + relocked bootloader
9. ReSukiSU LKM integration
10. feature/UI porting from audited donor commits
