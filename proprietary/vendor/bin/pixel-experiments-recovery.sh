#!/vendor/bin/sh

# This script delays experiments by the specified amount of seconds. The delay is not needed for
# the normal operation, but becomes essential for the rare case (which "should not happen") where
# an experiment causes really bad issues (e.g. crashes the kernel). In such case the delay gives
# GMSCore an opportunity to fetch fresh experiments snapshot (with the bad experiment disabled).
#
# See go/pixel-perf-experiment-whatif for more info.

delay_seconds="$1"
prop_name="$2"

if [ -n "$delay_seconds" ] && [ -n "$prop_name" ]; then
    sleep "$delay_seconds"
    /vendor/bin/setprop "$prop_name" 1
fi
