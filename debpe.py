#!/usr/bin/env python3
# -*- coding: utf-8 -*-


def clean(line: str):
  if '▁' in line:
    return line.replace(' ', '').replace('▁', ' ').strip()
  else:
    return line.replace('@@ ', '').replace('@@', '')


if __name__ == '__main__':
  import argparse, sys
  parser = argparse.ArgumentParser()
  parser.add_argument('file', nargs='?', type=argparse.FileType("r"), default=sys.stdin)
  args = parser.parse_args()

  for line in args.file:
    line = line.rstrip()
    print(clean(line), flush=True)
