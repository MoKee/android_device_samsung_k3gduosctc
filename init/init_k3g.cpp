/*
   Copyright (c) 2013, The Linux Foundation. All rights reserved.

   Copyright (c) 2016-2018, The Mokee OpenSource Project. 

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>
#include <stdio.h>

#include <android-base/logging.h>
#include <android-base/properties.h>

#include "property_service.h"
#include "vendor_init.h"

#include "init_msm8974.h"

using android::base::GetProperty;
using android::init::property_set;

void cdma_properties(char const default_cdma_sub[], char const operator_numeric[],
        char const operator_alpha[],
        char const default_network[])
{
    set_rild_libpath(rild_lib_variant);

    property_set("ril.subscription.types", "NV,RUIM");
    property_set("rild.lib2_type", "cdma");
    property_set("ro.cdma.home.operator.numeric", operator_numeric);
    property_set("ro.cdma.home.operator.alpha", operator_alpha);
    property_set("ro.telephony.default_cdma_sub", default_cdma_sub);
    property_set("ro.telephony.default_network", default_network);
    property_set("telephony.lteOnCdmaDevice", "0");
}
void init_target_properties()
{
    std::string platform = GetProperty("ro.board.platform", "");
    if (platform != ANDROID_TARGET)
        return;

    std::string bootloader = GetProperty("ro.bootloader", "");

    if (bootloader.find("G9009D") == 0) {
        /* k3gduosctc */
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint", "samsung/k3gduosctc/k3g:6.0.1/MMB29M/G9009DKEU1CQB1:user/release-keys");
        property_override("ro.build.description", "k3gduosctc-user 6.0.1 MMB29M G9009DKEU1CQB1 release-keys");
        property_override_dual("ro.product.model", "ro.vendor.product.model", "SM-G9009D");
        property_override_dual("ro.product.device", "ro.vendor.product.device", "k3gduosctc");
        property_set("gsm.current.vsid", "0");
        property_set("gsm.current.vsid2", "1");
        cdma_properties("0", "46003", "中国电信", "4");
    }

    std::string device = GetProperty("ro.product.device", "");
    LOG(ERROR) << "Found bootloader id " << bootloader <<  " setting build properties for "
        << device <<  " device" << std::endl;
}
