#!/usr/bin/env sh
# First argument is the notebook you would like to run

notebook=$1
scriptname="$(basename $notebook .ipynb)".py

jupyter nbconvert --to script --execute ${notebook} && python3 ${scriptname}
rm ${scriptname}