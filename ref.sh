#!/bin/bash

txt_path="$(dirname "$0")/txt"

show_me(){
  type=$1
  ccat --bg=dark $txt_path/$type.txt
}

case "$1" in 

  -p | p | --pry | -pry | pry )
    show_me pry
    ;;

  -r | r | --rails | -rails | rails )
    show_me rails
    ;;

  -v | v | --vi | -vi | vi | --vii | -vii | vii | --vim | -vim | vim )
    show_me vi
    ;;

  -c | c | --code | -code | code | --vscode | -vscode | vscode | --vsc | -vsc | vsc )
    show_me vscode
    ;;

  ## Easter Eggs

  doh )
    show_me wtflol
    ;;

  ##

  *)
    echo " Usage: ref [options]"
    echo "  -p, --pry, -r, --rails, -v, --vii, -c, --code, --vscode"
    ;;
esac
