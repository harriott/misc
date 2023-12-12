#!/bin/bash
# vim: set fdl=1:

cp $TeNo/md-JH-DailyLife/roles/roles.md roles-copy.md
cp roles-copy.md rc.md
cp rc.md roles-copy.md
perl makeDats.pl

