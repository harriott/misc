#! /usr/bin/python3
# vim: set cc=80 tw=79:

# python $misc/CP/timeSubtraction.py 0:11:26 0:6:36
# python $misc/CP/timeSubtraction.py 0:07:11 0:0:00
# python $misc/CP/timeSubtraction.py 0:19:15 0:8:20
# python $misc/CP/timeSubtraction.py 0:14:30 0:3:07
# python $misc/CP/timeSubtraction.py 0:13:35 0:0:00
# python $misc/CP/timeSubtraction.py 0:11:23 0:4:46
# python $misc/CP/timeSubtraction.py 0:08:46 0:4:06

import datetime
import sys
time1 = datetime.datetime.strptime(sys.argv[1], "%H:%M:%S")
time2 = datetime.datetime.strptime(sys.argv[2], "%H:%M:%S")
delta = time1 - time2
print(f'first time is ', time1.time(),
      ', second time is ', time2.time(),
      ', difference is ', int(delta.total_seconds()), ' seconds', sep='')
