#! /usr/bin/python3
# vim: set cc=80 tw=79:

# python $onGH/misc/timeSubtraction.py 0:7:6 0:3:26
# python $onGH/misc/timeSubtraction.py 0:37:59 0:4:20
# python $onGH/misc/timeSubtraction.py 0:33:13 0:0:0
# python $onGH/misc/timeSubtraction.py 1:15:26 0:5:3
# python $onGH/misc/timeSubtraction.py 0:14:11 0:7:57

import datetime
import sys
time1 = datetime.datetime.strptime(sys.argv[1], "%H:%M:%S")
time2 = datetime.datetime.strptime(sys.argv[2], "%H:%M:%S")
delta = time1 - time2
print(f'first time is ', time1.time(),
      ', second time is ', time2.time(),
      ', difference is ', int(delta.total_seconds()), ' seconds', sep='')
