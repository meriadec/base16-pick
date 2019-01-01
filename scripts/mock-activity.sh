#!/bin/env bash

THEME=$1
SUB_CMD=$2

base16-pick "$THEME"

if [[ "$SUB_CMD" == "vim" ]]; then
  nvim src/components/DashboardPage/index.js +74
fi
