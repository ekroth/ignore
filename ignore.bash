#!/bin/bash
# Andrée Ekroth 2014
# Enjoy.

function usage() {
    echo -e "Usage: ignore [OPTION]... [LANG]..."
    echo "Output gitignore for a LANG(s) from Github."
    echo ""
    echo -e "  -v,\t\t\t verbose, output extra information"
    echo -e "  -s,\t\t\t silent, only output gitignore(s)"
    echo -e "  -h,\t\t\t this help"
    echo ""
    echo "Examples:"
    echo -e "  ignore Haskell\t\t Output Haskell gitignore"
    echo -e "  ignore -v Haskell Global/Emacs Output Haskell and Emacs gitignore with verbose"
    echo -e "  ignore -s Scala\t\t Scala gitignore without any extra information"
}

if [ $# -eq 0 ]; then
   usage
   exit 1
fi

VERBOSE=0
SILENT=0

while getopts "vsh" opt; do
  case $opt in
    v) VERBOSE=1
    SILENT=0;;
    s) VERBOSE=0
    SILENT=1;;
    h)
    usage
    exit 1;;
  esac
done

shift $(($OPTIND - 1))

BASE='https://raw.githubusercontent.com/github/gitignore/master/'
EXT='.gitignore'

for ARG in "$@"; do
    URL="${BASE}$ARG${EXT}"

    if ((VERBOSE)); then
       echo "###> Parsing LANG: $ARG ###"
       echo "###> Downloading from URL: $URL ###"
    fi

    IGNORE=$(curl -sf "$URL")

    if [[ ! $IGNORE = "" ]]; then 
        if ((SILENT)); then
           echo "$IGNORE"
        else
           echo "### Gitignore: $ARG ###"
           echo "## File: $URL ##"
           echo "$IGNORE"
           echo "### End: $ARG ###" 
        fi
    else if !((SILENT)); then
           echo "### Not found: $ARG ###"
        fi
    fi
done
