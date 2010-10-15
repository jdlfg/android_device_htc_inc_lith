################# DEVICE SPECIFIC STUFF #####################
#
# Below are some things that make sure that the rom runs
# properly on htc incredible hardware
#

$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/inc/overlay

PRODUCT_PROPERTY_OVERRIDES += \
	ro.build.changelist=231334 \
	ro.product.version=3.21.605.1 \
	keyguard.no_require_sim=1 \
	ro.com.google.clientidbase=android-verizon \
	ro.com.google.gmsversion=2.2_r5 \
	ro.com.google.clientidbase=ms-android-htc \
	media.a1026.nsForVoiceRec=0 \
	htc.audio.alt.enable=1 \
	htc.audio.hac.enable=1 \
	ro.media.enc.hprof.file.format=mp4 \
	ro.media.enc.hprof.codec.vid=m4v \
	ro.media.enc.hprof.codec.aud=amrnb \
	ro.media.enc.hprof.vid.width=720 \
	ro.media.enc.hprof.vid.height=480 \
	ro.media.enc.hprof.vid.fps=24 \
	ro.media.enc.hprof.vid.bps=2000000 \
	ro.media.enc.hprof.aud.bps=12200 \
	ro.media.enc.hprof.aud.hz=8000 \
	ro.media.enc.hprof.aud.ch=1 \
	ro.media.enc.hprof.duration=60 \
	ro.media.enc.lprof.file.format=3gp \
	ro.media.enc.lprof.codec.vid=m4v \
	ro.media.enc.lprof.codec.aud=amrnb \
	ro.media.enc.lprof.vid.width=176 \
	ro.media.enc.lprof.vid.height=144 \
	ro.media.enc.lprof.vid.fps=15 \
	ro.media.enc.lprof.vid.bps=256000 \
	ro.media.enc.lprof.aud.bps=12200 \
	ro.media.enc.lprof.aud.hz=8000 \
	ro.media.enc.lprof.aud.ch=1 \
	ro.media.enc.lprof.duration=30 \
	ro.media.enc.file.format=3gp,mp4 \
	ro.media.enc.vid.codec=m4v,h263,h264 \
	ro.media.enc.aud.codec=amrnb \
	ro.media.enc.vid.h263.width=176,1280 \
	ro.media.enc.vid.h263.height=144,720 \
	ro.media.enc.vid.h263.bps=64000,6000000 \
	ro.media.enc.vid.h263.fps=1,30 \
	ro.media.enc.vid.m4v.width=176,1280 \
	ro.media.enc.vid.m4v.height=144,720 \
	ro.media.enc.vid.m4v.bps=64000,8000000 \
	ro.media.enc.vid.m4v.fps=1,30 \
	ro.media.enc.vid.h264.width=176,800 \
	ro.media.enc.vid.h264.height=144,480 \
	ro.media.enc.vid.h264.bps=64000,6000000 \
	ro.media.enc.vid.h264.fps=1,30 \
	ro.media.enc.aud.amrnb.bps=5525,12200 \
	ro.media.enc.aud.amrnb.hz=8000,8000 \
	ro.media.enc.aud.amrnb.ch=1,1 \
	ro.media.dec.aud.wma.enabled=1 \
	ro.media.dec.vid.wmv.enabled=1 \
	ro.media.cam.preview.fps=0 \
	ro.media.dec.jpeg.memcap=20000000 \
	ro.media.enc.jpeg.quality=95,85,70 \
	ro.setupwizard.enterprise_mode=1
# although these are in the leaked build.prop... no reason to set them as they're empty
#	ro.product.ua= \
#	ro.build.project= \

# media config xml file
PRODUCT_COPY_FILES += \
        frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
        frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
        frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
        frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
        frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
        frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
        frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
        frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
        frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
        frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
        frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
        packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
        frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	device/htc/inc/media_profiles.xml:system/etc/media_profiles.xml \
	device/htc/inc/vold.fstab:system/etc/vold.fstab \
	device/htc/inc/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
	device/htc/inc/firmware/fw_bcm4329.bin:system/etc/firmware/fw_bcm4329.bin \
	device/htc/inc/firmware/fw_bcm4329_apsta.bin:system/etc/firmware/fw_bcm4329_apsta.bin

PRODUCT_PACKAGES += \
	librs_jni

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Passion uses high-density artwork where available
PRODUCT_LOCALES += hdpi

# include proprietaries
ifneq ($(USE_PROPRIETARIES),)
# if we aren't including google, we need to include some basic files
ifeq ($(filter google,$(USE_PROPRIETARIES)),)
PRODUCT_PACKAGES += \
        Provision \
        LatinIME \
        QuickSearchBox
endif

# actually include the props
$(foreach prop,$(USE_PROPRIETARIES), \
  $(if $(wildcard device/htc/inc/proprietary.$(prop)), \
    $(eval \
PRODUCT_COPY_FILES += $(shell \
        cat device/htc/inc/proprietary.$(prop) \
        | sed -r 's/^\/(.*\/)([^/ ]+)$$/device\/htc\/inc\/proprietary\/\2:\1\2/' \
        | tr '\n' ' ') \
     ), \
    $(error Cannot include proprietaries from $(prop). List file device/htc/inc/proprietary.$(prop) does not exist) \
   ) \
 )
endif
