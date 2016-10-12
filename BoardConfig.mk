#
# Copyright (C) 2014 The CyanogenMod Project
#
# Copyright (C) 2016 The Mokee OpenSource Project
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

# inherit from common klte
-include device/samsung/klte-common/BoardConfigCommon.mk

TARGET_OTA_ASSERT_DEVICE := k3gduos,k3gduosctc,k3g,k3gctc,klte

# Audio
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_SAMSUNG_DUAL_SIM := true

# Kernel
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 zcache.enabled=1 zcache.compressor=lz4 androidboot.selinux=permissive
TARGET_KERNEL_VARIANT_CONFIG := msm8974pro_sec_k3gduos_ctc_defconfig

# Init
TARGET_INIT_VENDOR_LIB := libinit_msm8974
TARGET_LIBINIT_MSM8974_DEFINES_FILE := device/samsung/k3gduosctc/init/init_klte.cpp
TARGET_UNIFIED_DEVICE := true

# NFC
BOARD_NFC_CHIPSET := pn547

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 13631488
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 15728640
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2831155200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12187581440

# Radio
SIM_COUNT := 2
TARGET_GLOBAL_CFLAGS += -DANDROID_MULTI_SIM
TARGET_GLOBAL_CPPFLAGS += -DANDROID_MULTI_SIM

# inherit from the proprietary version
-include vendor/samsung/k3gduosctc/BoardConfigVendor.mk
