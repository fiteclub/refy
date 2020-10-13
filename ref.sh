#!/bin/bash

case "$1" in 

  -r | r | --rails | -rails | rails )
    ccat --bg=dark ~/repos/ref_sheet/rails.txt
    ;;

  -v | v | --vi | -vi | vi | --vii | -vii | vii | --vim | -vim | vim )
    ccat --bg=dark ~/repos/ref_sheet/vi.txt
    ;;

  -c | c | --code | -code | code | --vscode | -vscode | vscode | --vsc | -vsc | vsc )
    ccat --bg=dark ~/repos/ref_sheet/vscode.txt
    ;;

  *)
    echo " Usage: ref [options]"
    echo "  -r, --rails, -v, --vii, -c, --code, --vscode"
    ;;
esac
