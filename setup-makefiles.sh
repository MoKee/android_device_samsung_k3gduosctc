#!/bin/sh

set -e

export VENDOR=samsung
export DEVICE=k3gduosctc
./../../$VENDOR/klte-common/setup-makefiles.sh $@
