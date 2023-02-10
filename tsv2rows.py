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
        if len(args.labels) > 0 and len(fields) != len(args.labels):
            print(f"Fatal: # of labels ({len(args.labels)}) doesn't match number of fields ({len(fields)})", file=sys.stderr)
            sys.exit(1)

        output_fields = []
        output_fields.append(lineno)
        output_fields += fields

        if len(args.labels):
            for i, label in enumerate(args.labels, 1):
                output_fields[i] = f"{label}\t{output_fields[i]}"

        print(*output_fields, sep="\n", end="\n\n")


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument("infile", nargs="?", type=argparse.FileType("r"), default=sys.stdin)
    parser.add_argument("--labels", nargs="*", default=[], help="provide labels for each column")
    args = parser.parse_args()

    main(args)
