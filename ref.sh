#!/bin/bash

txt_path="$(dirname "$0")/txt"

case "$1" in 

  -p | p | --pry | -pry | pry )
    ccat --bg=dark $txt_path/pry.txt
    ;;

  -r | r | --rails | -rails | rails )
    ccat --bg=dark $txt_path/rails.txt
    ;;

  -v | v | --vi | -vi | vi | --vii | -vii | vii | --vim | -vim | vim )
    ccat --bg=dark $txt_path/vi.txt
    ;;

  -c | c | --code | -code | code | --vscode | -vscode | vscode | --vsc | -vsc | vsc )
    ccat --bg=dark $txt_path/vscode.txt
    ;;

  ## Easter Eggs
  kitteh )
    sed -n 4,31p $txt_path/wtflol.txt 
    ;;

  doh )
    sed -n 35,96p $txt_path/wtflol.txt 
    ;;

  ##

  *)
    echo " Usage: ref [options]"
    echo "  -p, --pry, -r, --rails, -v, --vii, -c, --code, --vscode"
    ;;
esac
