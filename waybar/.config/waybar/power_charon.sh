# /usr/bin/env bash

BAT_PATH=/sys/class/power_supply/qcom-battmgr-bat/power_now

POWER_USAGE=$(awk '{printf "%.2f W\n", ($1 < 0 ? -$1 : $1) * 1e-6}' $BAT_PATH)

echo $POWER_USAGE
