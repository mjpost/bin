#!/usr/bin/env python3

import sys
import gzip


def smart_open(file, mode='rt', encoding='utf-8'):
    if file == "-":
        return sys.stdin
    elif file.endswith('.gz'):
        return gzip.open(file, mode=mode, encoding=encoding, newline="\n")
    else:
        return open(file, mode=mode, encoding=encoding, newline="\n")



def main(args):
    for lineno, line in enumerate(args.infile, 1):
        fields = line.rstrip().split("\t")
        output_fields = []
        output_fields.append(lineno)
        output_fields += fields
        print(*output_fields, sep="\n", end="\n\n")


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument("infile", nargs="?", type=argparse.FileType("r"), default=sys.stdin)
    args = parser.parse_args()

    main(args)
