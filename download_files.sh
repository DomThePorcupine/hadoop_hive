#! /bin/bash
wget -i files.txt
bzip2 -d *.bz2
mkdir src/data
mv *.csv src/data
