#!/bin/bash

txt_path="$(dirname "$0")/txt"

case "$1" in 

  -p | p | --pry | -pry | pry )
    type=pry
    ;;

  -r | r | --rails | -rails | rails )
    type=rails
    ;;

  -v | v | --vi | -vi | vi | --vii | -vii | vii | --vim | -vim | vim )
    type=vim
    ;;

  -c | c | --code | -code | code | --vscode | -vscode | vscode | --vsc | -vsc | vsc )
    type=vscode
    ;;

  ## Easter Eggs

  doh )
    type=wtflol
    ;;

  ##

  *)
    echo " Usage: ref [options]"
    echo "  -p, --pry, -r, --rails, -v, --vii, -c, --code, --vscode"
    ;;
esac

ccat --bg=dark $txt_path/$type.txt
