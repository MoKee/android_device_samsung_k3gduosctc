#
# Copyright (C) 2016-2018 The Mokee OpenSource Project
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

TARGET_OTA_ASSERT_DEVICE := k3g,k3gduosctc,klte

# Kernel
TARGET_KERNEL_CONFIG := mokee_k3gduosctc_defconfig

# Fingerprint
include $(COMMON_PATH)/fingerprint/board.mk

# Init
TARGET_INIT_VENDOR_LIB := libinit_msm8974
TARGET_LIBINIT_MSM8974_DEFINES_FILE := device/samsung/k3gduosctc/init/init_k3g.cpp

# NFC
include $(COMMON_PATH)/nfc/pn547/board.mk

# Radio/RIL
include $(COMMON_PATH)/radio/dual/board.mk

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# inherit from the proprietary version
-include vendor/samsung/k3gduosctc/BoardConfigVendor.mk
