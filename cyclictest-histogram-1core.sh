#!/bin/bash

# Define a timestamp functions
datestamp() {
  date +"%F"
}
hourstamp() {
  date +"%H"
}
minstamp() {
  date +"%M"
}
secstamp() {
  date +"%S"
}

PLOTFILE=$(datestamp)_$(hourstamp)-$(minstamp)-$(secstamp)

sudo cyclictest -l1000000 -m -Sp80 -i100 -h200 -q > $PLOTFILE


echo "file: $PLOTFILE"
echo 'plot "'$PLOTFILE'" using 2 with steps ls 1 title "core0"' | gnuplot -persist
