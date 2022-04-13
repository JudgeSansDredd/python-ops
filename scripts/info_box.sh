#!/bin/bash

green=$(tput setaf 2)
gold=$(tput setaf 3)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
red=$(tput setaf 1)
default=$(tput sgr0)
gray=$(tput setaf 243)

info_box() {
  NUM=$((${#1} + 4))
  echo "${cyan}"

  # print the top of the info box
  eval printf %.0s# '{1..'"${NUM}"\}; echo

  # print the middle of the info box
  echo "# $1 #"

  # print the bottom of the info box
  eval printf %.0s# '{1..'"${NUM}"\}; echo

  echo "${default}"
}