#!/usr/bin/env python3

# Queries Amazon Comprehend (entity recognizer) from lines taken from STDIN.
# Optionally annotates them in the output.

import sys
import boto3
import argparse

def main(args):
    comprehend = boto3.client("comprehend", region_name="us-east-1")
    for line in sys.stdin:
        line = line.rstrip()
        if line:
            resp = comprehend.detect_entities(
                Text=line,
                LanguageCode=args.language)

            offset = 0
            for entity in resp['Entities']:
                e = entity['Text']
                i = entity['BeginOffset']
                j = entity['EndOffset']
                t = entity['Type']

                # Mark it up
                new_text = e
                if args.prefix is not None:
                    new_text = args.prefix + new_text
                if args.suffix is not None:
                    new_text = new_text + args.suffix.replace('%TYPE%', t)
                if args.merge is not None:
                    new_text = new_text.replace(' ', args.merge)

                # push back following punctuation
                if len(line) > j + offset and line[j+offset] in string.punctuation:
                    new_text += ' '

                line = line[0:i+offset] + new_text + line[j+offset:]
                offset += len(new_text) - len(e)
            print(line, flush=True)
        else:
            print(line, flush=True)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--language', '-l', type=str, default='en', help='Language of text')
    parser.add_argument('--prefix', '-p', default='#', type=str, help='Prefix for detected entities')
    parser.add_argument('--suffix', '-s', default='_%TYPE%', type=str, help='Suffix for detected entities')
    parser.add_argument('--merge', '-m', default='_', type=str, help='Merge multi-token entities with this string (e.g., _)')
    args = parser.parse_args()

    main(args)


