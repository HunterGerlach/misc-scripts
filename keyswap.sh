#!/bin/bash

# @Description: A script to help swap the caps lock key with
# the escape key, which is helpful in Vim
# Per https://www.youtube.com/watch?v=_NUO4JEtkDw
# This can also be used to switch the keys back to
# their original state
# TODO: Implement checks and error handling

ESCAPE="Escape"
CAPSLOCK="Caps_Lock"

get_keycode() {
  echo $(xmodmap -pk | grep $1 | awk '{print $1}')
}

set_keycode() {
  xmodmap -e "keycode $1 = $2"
}

ESCAPE_KEYCODE=$(get_keycode "$ESCAPE")
CAPSLOCK_KEYCODE=$(get_keycode "$CAPSLOCK")
echo "Current $ESCAPE keycode:" $ESCAPE_KEYCODE
echo "Current $CAPSLOCK keycode:" $CAPSLOCK_KEYCODE

echo "Swapping $CAPSLOCK keycode with $ESCAPE keycode..."

set_keycode "$ESCAPE_KEYCODE" "$CAPSLOCK"
set_keycode "$CAPSLOCK_KEYCODE" "$ESCAPE"

echo "New $ESCAPE keycode:" $(get_keycode "$ESCAPE")
echo "New $CAPSLOCK keycode:" $(get_keycode "$CAPSLOCK")
