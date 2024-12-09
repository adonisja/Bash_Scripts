#!/usr/bin/env python3
import shutil as s

with open('disk_usage.log', 'a') as log_file:
    total, used, free = s.disk_usage(".")
    print(type(used))
    pct_used = (used/total)*100
    log_file.write(f'{pct_used:.2f}% of total space\n')
    if pct_used > 80:
        log_file.write(f'Warning! File usage is at {pct_used}% capacity\n')
