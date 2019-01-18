#!/bin/bash

choice=$(find ~/base16-pick/shots/*.png | sxiv -ftio)
theme=$(basename "$choice" | sed 's/\.png//')
~/base16-pick/base16-pick $theme
