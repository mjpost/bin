#!/usr/bin/env python

import sys
import locale

locale.setlocale(locale.LC_ALL, 'en_US')

for line in sys.stdin:
    line = line.strip()
    print locale.format("%d", int(line), grouping=True)
