#!/bin/bash
#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Version: 1
# Changelog:
# - Se actualizó la variable DEVICE de james a pettyl para la generación de archivos vendor.
# - Se mantiene la herencia del script común de msm8937.

set -e

# Required!
export DEVICE=pettyl
export DEVICE_COMMON=msm8937-common
export VENDOR=motorola

export DEVICE_BRINGUP_YEAR=2019

"./../../${VENDOR}/${DEVICE_COMMON}/setup-makefiles.sh" "$@"
