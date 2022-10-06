/*
 * Copyright (C) 2014 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef _BDROID_BUILDCFG_H
#define _BDROID_BUILDCFG_H

#if !defined(OS_GENERIC)
#ifdef PROPERTY_VALUE_MAX
#define PVAL_MAX_ALREADY_DEFINED
#ifndef __CUTILS_PROPERTIES_H
#undef PROPERTY_VALUE_MAX
#endif
#endif
#include <cutils/properties.h>
#include <string.h>

static inline const char* getBTDefaultName()
{
    char device[PROPERTY_VALUE_MAX];
    property_get("ro.boot.device", device, "");

    if (!strcmp("guamna", device)) {
        return "moto g play (2021)";
    }

    if (!strcmp("borneo", device)) {
        return "moto g power (2021)";
    }

    if (!strcmp("capri", device)) {
        return "moto g10";
    }

    if (!strcmp("cebu", device)) {
        return "moto g9 power";
    }

    return "moto g";
}

#define BTM_DEF_LOCAL_NAME getBTDefaultName()

#ifndef PVAL_MAX_ALREADY_DEFINED
#undef PROPERTY_VALUE_MAX
#endif

#endif // OS_GENERIC

// Wide-band speech support
#define BTM_WBS_INCLUDED TRUE
#define BTIF_HF_WBS_PREFERRED TRUE

// QCOM power management workaround
#define BT_CLEAN_TURN_ON_DISABLED TRUE

// Vendor extensions
#define BLE_VND_INCLUDED TRUE

// Disables read remote device feature
#define MAX_ACL_CONNECTIONS   16
#define MAX_L2CAP_CHANNELS    32
#define GATT_MAX_PHY_CHANNEL  10

#define AVDT_NUM_SEPS 35

#endif