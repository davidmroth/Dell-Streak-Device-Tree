# Copyright (c) 2009, Code Aurora Forum.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# config.mk
#
# Product-specific compile-time definitions.
#

ifeq ($(QC_PROP),true)

    BOARD_USES_QCOM_HARDWARE := true
    BOARD_USES_ADRENO_200 :=true
    HAVE_ADRENO200_SOURCE := true
    HAVE_ADRENO200_SC_SOURCE := true
    HAVE_ADRENO200_FIRMWARE := true

    ifneq ($(BUILD_TINY_ANDROID), true)
    BOARD_HAVE_BLUETOOTH := true
    BOARD_GPS_LIBRARIES := libloc_api
    #BOARD_CAMERA_LIBRARIES := libcamera
    endif   # !BUILD_TINY_ANDROID

    BOARD_OPENCORE_LIBRARIES := libOmxCore
    BOARD_OPENCORE_FLAGS := -DHARDWARE_OMX=1

    USE_CAMERA_STUB := true
else
    #BOARD_USES_GENERIC_AUDIO := true
    USE_CAMERA_STUB := true

endif # QC_PROP

TARGET_HAVE_TSLIB := true

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
TARGET_NO_RADIOIMAGE := true
#if TARGET_GRALLOC_USES_ASHMEM is enabled, set debug.sf.hw=1 in system.prop
#TARGET_GRALLOC_USES_ASHMEM := false
TARGET_GRALLOC_USES_ASHMEM := true

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

#TARGET_HARDWARE_3D := false
TARGET_HARDWARE_3D := true
TARGET_BOARD_PLATFORM := qsd8k
TARGET_BOOTLOADER_BOARD_NAME := QSD8250_SURF
QCOM_TARGET_PRODUCT := qsd8250_surf

BOARD_KERNEL_BASE    := 0x20000000
BOARD_NAND_PAGE_SIZE := 2048

ifeq ($(ENABLE_SERIAL_CONSOLE),true)
    BOARD_KERNEL_CMDLINE := console=ttyMSM2,115200n8 console=ttyDCC0 androidboot.hardware=qcom
    #BOARD_KERNEL_CMDLINE := console=tty androidboot.hardware=qcom
else
    BOARD_KERNEL_CMDLINE := console=ttyDCC0 androidboot.hardware=qcom

endif # ENABLE_SERIAL_CONSOLE

RECOVERY_BOARD_KERNEL_CMDLINE := console=ttyDCC0 androidboot.hardware=qcom 
BOARD_EGL_CFG := device/$(PRODUCT_BRAND)/$(TARGET_PRODUCT)/egl.cfg

#~ # cat /proc/mtd
#dev:    size   erasesize  name
#mtd0: 00500000 00020000 "boot"
#mtd1: 00600000 00020000 "recovery"
#mtd2: 00600000 00020000 "recovery_bak"
#mtd3: 00040000 00020000 "LogFilter"
#mtd4: 00300000 00020000 "oem_log"
#mtd5: 00100000 00020000 "splash"
#mtd6: 10400000 00020000 "system"
#mtd7: 08c00000 00020000 "userdata"

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00500000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00600000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x10400000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x08C00000
BOARD_FLASH_BLOCK_SIZE := $(BOARD_NAND_PAGE_SIZE) * 64

TARGET_CUSTOM_RECOVERY_UI_LIB := librecovery_ui_surf


#Other Edits
BUILD_WITH_FULL_STAGEFRIGHT := true
WITH_JIT := true
ENABLE_JSC_JIT := true
