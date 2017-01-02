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
echo 'plot "'$PLOTFILE'" using 2 with steps ls 1 title "core0",\
"'$PLOTFILE'" using 3 with steps ls 2 title "core1", \
"'$PLOTFILE'" using 4 with steps ls 3 title "core2", \
"'$PLOTFILE'" using 5 with steps ls 2 title "core3", \
"'$PLOTFILE'" using 6 with steps ls 3 title "core4", \
"'$PLOTFILE'" using 7 with steps ls 2 title "core5", \
"'$PLOTFILE'" using 8 with steps ls 3 title "core6", \
"'$PLOTFILE'" using 9 with steps ls 4 title "core7"' | gnuplot -persist
