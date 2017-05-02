#!/usr/bin/env sh
# First argument is the notebook you would like to run
# when in directory with the ipython notbook run './run_ipynb.sh Admissions_Essays_Production.ipynb'

if [ ! -d ../data/scratch_dir ]; then
  mkdir -p ../data/scratch_dir;
else
	echo "Directory already exist.  Check contents before continuing"
fi

notebook=$1
scriptname="$(basename $notebook .ipynb)".py

#this uses nbconvert, a Jupyter library, to create a .py and run it in python3
jupyter nbconvert --to script --execute ${notebook} && python3 ${scriptname}

#this moves the .py to the data archive folder for future reproduceability
mv ${scriptname} ../data/scratch_dir/${scriptname}

#This creates the variable to be passed to the new file name
date=$(date +%Y-%m-%d_at_%H-%M)
#This renames the folder for future reference
mv ../data/scratch_dir ../data/$date