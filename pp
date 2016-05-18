#!/usr/bin/env python

"""
Does pretty-printing of numbers.
Usage:
    echo 382834242324 | pp
    -> prints 382,834,242,324 
"""

import sys
import locale

locale.setlocale(locale.LC_ALL, 'en_US')

for line in sys.stdin:
    line = line.strip()
    print locale.format("%d", int(line), grouping=True)
