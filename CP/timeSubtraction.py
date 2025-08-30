#! /usr/bin/python3
# vim: set cc=80 tw=79:

# python $misc/CP/timeSubtraction.py 0:23:21 0:6:24
# python $misc/CP/timeSubtraction.py 0:19:26 0:0:00

import datetime
import sys
time1 = datetime.datetime.strptime(sys.argv[1], "%H:%M:%S")
time2 = datetime.datetime.strptime(sys.argv[2], "%H:%M:%S")
delta = time1 - time2
print(f'first time is ', time1.time(),
      ', second time is ', time2.time(),
      ', difference is ', int(delta.total_seconds()), ' seconds', sep='')
