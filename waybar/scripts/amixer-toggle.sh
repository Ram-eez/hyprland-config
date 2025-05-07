#!/bin/bash

# Check the current state of the speaker
state=$(amixer -D pulse sget Master | awk '/\[on\]/{print "unmute"; exit} /\[off\]/{print "mute"; exit}')

# Toggle the state of the speaker
if [ "$state" = "unmute" ]; then
  amixer -D pulse sset Master mute > /dev/null
else
  amixer -D pulse sset Master unmute > /dev/null
fi
