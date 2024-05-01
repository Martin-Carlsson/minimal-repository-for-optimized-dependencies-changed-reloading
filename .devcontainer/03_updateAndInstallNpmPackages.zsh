#!/bin/zsh

bold="\033[1m"
blue="\033[0;34m"
green="\033[0;32m"
red="\033[0;31m"
reset="\033[0m"


echo "${blue}Updating npm packages ....${reset}"
cd app 
npm install -g npm-check-updates && ncu -u --reject eslint && npm i
echo ""

# If you want to reject a specific package from updating, you can use the --reject flag
# npm install -g npm-check-updates && ncu -u --reject eslint && npm i
# npm install -g npm-check-updates && ncu -u && npm i