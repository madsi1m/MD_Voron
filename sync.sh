#!/bin/bash

rsync -avh --delete ~/printer_data/config ~/MD_Voron/

mkdir ~/MD_Voron/klipper 2>/dev/null
cd ~/klipper
git status -s | awk '{print $2}' | while read f; do
  if [ -f "$f" ]; then
    mkdir -p ~/MD_Voron/klipper/$(dirname "$f") 2>/dev/null
    cp $f ~/MD_Voron/klipper/$f
  fi
done
