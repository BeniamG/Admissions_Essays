#!/usr/bin/env sh
# First argument is the notebook you would like to run
# when in directory with the ipython notbook run './run_ipynb.sh Admissions_Essays_Production.ipynb'

# This makes a new folder called scratch_dir where we put our output
if [ ! -d ../data/scratch_dir ]; then
  mkdir -p ../data/scratch_dir;
else
	echo "Directory already exist.  Check contents before continuing"
fi

# This creates a date variable
date=$(date +%Y-%m-%d_at_%H-%M)

notebook=$1
scriptname="$(basename $notebook .ipynb)".py
date_name="$(basename $notebook .ipynb)"'-'$date.py


#date_name=$scriptname'-'$date

#this uses nbconvert, a Jupyter library, to create a .py and run it in python3
jupyter nbconvert --to script --execute ${notebook} && python3 ${scriptname}

#this moves the .py to the data archive folder for future reproduceability
mv ${scriptname} ../data/scratch_dir/$date_name

#This renames the folder for future reference
mv ../data/scratch_dir ../data/$date