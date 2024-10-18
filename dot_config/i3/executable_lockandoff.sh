#!/bin/bash

# Lock the screen
i3lock-fancy -gp &

# Get the process ID of the lock command
lock_pid=$!

# Run sleep in the background and kill it if i3lock-fancy exits
(sleep 10 && xset dpms force off) &
sleep_pid=$!

wait $lock_pid
kill $sleep_pid
