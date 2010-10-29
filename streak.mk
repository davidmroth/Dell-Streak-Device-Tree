LOCAL_PATH := $(call my-dir)

$(call inherit-product, $(SRC_TARGET_DIR)/product/core.mk)



# Overrides
PRODUCT_BRAND := dell
PRODUCT_NAME := streak
PRODUCT_DEVICE := streak


#Additional Build Settings
PRODUCT_MODEL := Dell Streak
PRODUCT_LOCALES := en_US
PRODUCT_MANUFACTURER := Dell Inc. 



PRODUCT_PACKAGES := \
    AccountAndSyncSettings \
    CarHome \
    DeskClock \
    AlarmProvider \
    Bluetooth \
    Calculator \
    Calendar \
    Camera \
    CertInstaller \
    DrmProvider \
    Email \
    Gallery3D \
    LatinIME \
    Launcher2 \
    Mms \
    Music \
    Protips \
    Settings \
    Sync \
    Updater \
    CalendarProvider \
    SyncProvider \
    Email \
    IM \
    VoiceDialer

#Add GApps
PRODUCT_PACKAGES += \
	GoogleServicesFramework \
	MediaUploader \
	googlevoice \
	talkback \
	GoogleContactsSyncAdapter \
	GenieWidget \
	Street \
	kickback \
	Talk \
	GoogleFeedback \
	Maps \
	Gmail \
	soundback \
	VoiceSearch \
	SetupWizard \
	CarHomeLauncher \
	GoogleCalendarSyncAdapter \
	CarHomeGoogle \
	GoogleBackupTransport \
	LatinImeTutorial \
	MarketUpdater \
	Vending \
	GooglePartnerSetup \
	GoogleQuickSearchBox \
	NetworkLocation \
	YouTube


PRODUCT_COPY_FILES := \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/base/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \

PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

#$(call inherit-product, build/target/product/generic.mk)

PRODUCT_PROPERTY_OVERRIDES := \
    wifi.supplicant_scan_interval=120 \

# Sets a Dell Streak specific device-agnostic overlay
#DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

#PRODUCT_COPY_FILES += \
     #$(LOCAL_PATH)/custom/boot/init.rc:root/init.rc 
     #$(LOCAL_PATH)/custom/boot/init.qcom.rc:root/init.qcom.rc \
     #$(LOCAL_PATH)/custom/boot/init.qcom.sh:root/init.qcom.sh \
     #$(LOCAL_PATH)/custom/boot/init.qcom.post_boot.sh:root/init.qcom.post_boot.sh

#Enabling Ring Tones
include frameworks/base/data/sounds/OriginalAudio.mk
