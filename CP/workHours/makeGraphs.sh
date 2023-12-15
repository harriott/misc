#!/bin/bash
# vim: set fdl=1:

# bash $misc/CP/workHours/makeGraphs.sh

set -e
cd $JHw/hours/
cp $TeNo/md-JH-DailyLife/roles/roles.md roles-copy.md
perl $misc/CP/workHours/makeDats.pl
rm roles-copy.md
gnuplot $misc/CP/workHours/barChart-y2014.gpi
cp $misc/CP/workHours/barChart-y2014.gpi barChart-chart.gpi
sed -i '1,4d' barChart-chart.gpi
sed -i 's/14/15/' barChart-chart.gpi
gnuplot barChart-chart.gpi
sed -i 's/15/16/' barChart-chart.gpi
gnuplot barChart-chart.gpi
sed -i 's/16/17/' barChart-chart.gpi
gnuplot barChart-chart.gpi
sed -i 's/17/18/' barChart-chart.gpi
gnuplot barChart-chart.gpi
sed -i 's/18/19/' barChart-chart.gpi
gnuplot barChart-chart.gpi
sed -i 's/19/20/' barChart-chart.gpi
gnuplot barChart-chart.gpi
sed -i 's/020/021/' barChart-chart.gpi
gnuplot barChart-chart.gpi
sed -i 's/21/22/' barChart-chart.gpi
gnuplot barChart-chart.gpi
sed -i 's/360/18/' barChart-chart.gpi
sed -i 's/022/023m01/' barChart-chart.gpi
gnuplot barChart-chart.gpi
for i in {1..8}; do
    sed -i "s/m0$i/m0$((i+=1))/" barChart-chart.gpi
    gnuplot barChart-chart.gpi
done
sed -i 's/m09/m10/' barChart-chart.gpi
gnuplot barChart-chart.gpi
sed -i 's/m10/m11/' barChart-chart.gpi
gnuplot barChart-chart.gpi
rm barChart-chart.gpi
montage y2014.png y2015.png y2016.png y2017.png y2018.png y2019.png y2020.png y2021.png y2022.png -geometry +0+0 -tile 3x3 ym2014-22.png
montage y2023m01.png y2023m02.png y2023m03.png y2023m04.png y2023m05.png y2023m06.png y2023m07.png y2023m08.png y2023m09.png y2023m10.png y2023m11.png -geometry +0+0 -tile 4x3 ym2023m01-11.png

