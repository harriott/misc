#!/bin/bash
# vim: set fdl=1:

# bash $misc/CP/workHours/makeGraphs.sh

set -e
cd $JHw/hours
cp $TeNo/md-JH-DailyLife/roles/roles.md roles-copy.md
perl $misc/CP/workHours/makeDats.pl
rm "$JHw/hours/roles-copy.md"
bCcg="$JHw/hours/barChart-chart.gpi"
cp $misc/CP/workHours/barChart-y2014.gpi $bCcg
sed -i '1,4d' $bCcg
# exit  # when testing just  2014
sed -i 's/14/15/' $bCcg; gnuplot $bCcg
sed -i 's/15/16/' $bCcg; gnuplot $bCcg
sed -i 's/16/17/' $bCcg; gnuplot $bCcg
sed -i 's/17/18/' $bCcg; gnuplot $bCcg
sed -i 's/18/19/' $bCcg; gnuplot $bCcg
sed -i 's/19/20/' $bCcg; gnuplot $bCcg
sed -i 's/020/021/' $bCcg; gnuplot $bCcg
sed -i 's/21/22/' $bCcg; gnuplot $bCcg
sed -i 's/22/23/' $bCcg; gnuplot $bCcg
sed -i 's/23/24/' $bCcg; gnuplot $bCcg
sed -i 's/360/18/' $bCcg
sed -i 's/024/025m01/' $bCcg
gnuplot $bCcg
for i in {1..5}; do
    sed -i "s/m0$i/m0$((i+=1))/" $bCcg
    gnuplot $bCcg
done # for months 02-09
# sed -i 's/m09/m10/' $bCcg; gnuplot $bCcg
# sed -i 's/m10/m11/' $bCcg; gnuplot $bCcg
rm $bCcg
montage y2014.png y2015.png y2016.png y2017.png y2018.png y2019.png y2020.png y2021.png y2022.png y2023.png y2024.png -geometry +0+0 -tile 4x3 ym2014-24.png
montage y2025m01.png y2025m02.png y2025m03.png y2025m04.png y2025m05.png y2025m06.png -geometry +0+0 -tile 4x3 ym2025m01-06.png

