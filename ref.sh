#!/bin/bash

txt_path="$(realpath .)/txt"

case "$1" in 

  -r | r | --rails | -rails | rails )
    ccat --bg=dark $txt_path/rails.txt
    ;;

  -v | v | --vi | -vi | vi | --vii | -vii | vii | --vim | -vim | vim )
    ccat --bg=dark $txt_path/vi.txt
    ;;

  -c | c | --code | -code | code | --vscode | -vscode | vscode | --vsc | -vsc | vsc )
    ccat --bg=dark $txt_path/vscode.txt
    ;;

  *)
    echo " Usage: ref [options]"
    echo "  -r, --rails, -v, --vii, -c, --code, --vscode"
    ;;
esac
