#!/bin/bash

# commands to execute when a specified program is started
initcmd() {
  nvidia-settings --assign CurrentMetaMode="DVI-I-1: 1920x1080_144 {ForceFullCompositionPipeline=Off}, HDMI-0: nvidia-auto-select {ForceFullCompositionPipeline=Off}"
}
# commands to execute when a specified program is exited
exitcmd() {
  nvidia-settings --assign CurrentMetaMode="DVI-I-1: 1920x1080_144 {ForceFullCompositionPipeline=On}, HDMI-0: nvidia-auto-select {ForceFullCompositionPipeline=On}"
}
# specify programs here (separate by a space)
programs='hl2_linux RocketLeague payday2_release'

while true; do
while true; do
  sleep 2
  pidof $programs
  status=$?
  if [ "$status" = 0 ]; then
    break
  fi
done

initcmd

while true; do
  sleep 2
  pidof $programs
  status=$?
  if [ "$status" = 1 ]; then
    break
  fi
done

exitcmd

done
