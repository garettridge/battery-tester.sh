#!/bin/bash
LOG="$HOME/battery_test/battery_drain_$(date +%Y%m%d_%H%M%S).log"
START=$(date +%s)

mkdir -p "$HOME/battery_test/"

echo "start_time=$START $(date -Is)" > "$LOG"

while true; do
    NOW=$(date +%s)
    ELAPSED=$((NOW - START))
    CAPACITY=$(cat /sys/class/power_supply/BAT*/capacity 2>/dev/null)
    VOLT=$(cat /sys/class/power_supply/BAT0/voltage_now 2>/dev/null)

    echo "Time: $NOW $ELAPSED Claimed capacity: $CAPACITY Volts: $VOLT" >> "$LOG"

    # Stop if voltage drops below e.g. 11.0V (11000000 uV)
    LOW=11000000
    if [ -n "$VOLT" ] && [ "$VOLT" -lt "$LOW" ]; then
        echo "Fell under low voltage at: $(date +%s)" >> "$LOG"
        break
    fi

    sleep 5
done
