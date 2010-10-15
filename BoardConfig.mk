#
# Product-specific compile-time definitions

TARGET_BOARD_PLATFORM := qsd8k
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon

TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := inc

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := bcm4329
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/firmware/fw_bcm4329.bin nvram_path=/proc/calibration"
WIFI_DRIVER_MODULE_NAME     := "bcm4329"

BOARD_KERNEL_CMDLINE := no_console_suspend=1
BOARD_KERNEL_BASE := 0x20000000

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_USES_GENERIC_AUDIO := false

BOARD_VENDOR_QCOM_AMSS_VERSION := 3200
BOARD_USES_QCOM_LIBS := true

BOARD_VENDOR_USE_AKMD := akm8973

BOARD_GPS_LIBRARIES := libgps librpc

BOARD_EGL_CFG := device/htc/inc/egl.cfg

BOARD_USE_HTC_USB_FUNCTION_SWITCH := true

BOARD_BOOTIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x00300000)
BOARD_RECOVERYIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x00480000)
BOARD_SYSTEMIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x0f800000)
BOARD_USERDATAIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x09500000)
# The size of a block that can be marked bad.
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common
TARGET_OTA_SCRIPT_MODE := edify
TARGET_NO_RECOVERY := true

USE_CAMERA_STUB := false
