#!/usr/bin/env sh
# First argument is the notebook you would like to run
# when in directory with the ipython notbook run './run_ipynb.sh Admissions_Essays_Production.ipynb'

if [ ! -d ../data/scratch_dir ]; then
  mkdir -p ../data/scratch_dir;
fi

notebook=$1
scriptname="$(basename $notebook .ipynb)".py

jupyter nbconvert --to script --execute ${notebook} && python3 ${scriptname}
mv ${scriptname} ../data/scratch_dir