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
#

# Inherit some common MK stuff.
$(call inherit-product, vendor/mk/config/common_full_phone.mk)

$(call inherit-product, device/samsung/k3gduosctc/full_k3gduosctc.mk)

PRODUCT_DEVICE := k3gduosctc
PRODUCT_NAME := mk_k3gduosctc
