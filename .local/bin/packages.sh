#!/bin/bash

. ~/bin/nord.sh

PKGS=$(sudo dnf check-update -q | wc -l)

#echo -e "${BGRED}${FGBLACK} 󰏖 ${PKGS} ${FGORANGE}"
echo -e "󰏖 ${PKGS}"
