#!/usr/bin/env python3

import sys
import boto3
import argparse

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--source', '-s', default='auto',
                        help='input language')
    parser.add_argument('--target', '-t', default='en',
                        help='output language')
    args = parser.parse_args()

    translate = boto3.client("translate")
    for line in sys.stdin:
        line = line.rstrip()
        if line:
            resp = translate.translate_text(
                Text=line,
                SourceLanguageCode=args.source,
                TargetLanguageCode=args.target)

            print(resp['TranslatedText'], flush=True)
        else:
            print(line)

if __name__ == '__main__':
    main()

