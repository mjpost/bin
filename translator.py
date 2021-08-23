#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# This simple app uses the '/translate' resource to translate text from
# one language to another.

# Adapted from https://docs.microsoft.com/en-us/azure/cognitive-services/translator/reference/v3-0-reference#authentication

import json
import os
import requests
import sys
import uuid

def main(args):

     key_var_name = 'TRANSLATOR_TEXT_SUBSCRIPTION_KEY'
     if not key_var_name in os.environ:
         raise Exception('Please set/export the environment variable: {}'.format(key_var_name))
     subscription_key = os.environ[key_var_name]

     endpoint_var_name = 'TRANSLATOR_TEXT_ENDPOINT'
     if not endpoint_var_name in os.environ:
         raise Exception('Please set/export the environment variable: {}'.format(endpoint_var_name))
     endpoint = os.environ[endpoint_var_name]

     path = '/translate?api-version=3.0'
     params = "&from={args.from}" if args.params else ""
     for lang in args.langs.split(","):
         params += f"&to={lang}"
     constructed_url = endpoint + path + params
     region = args.region

     headers = {
         'Ocp-Apim-Subscription-Key': subscription_key,
         'Ocp-Apim-Subscription-Region': region,
         'Content-type': 'application/json',
         'X-ClientTraceId': str(uuid.uuid4())
     }

     # You can pass more than one object in body.
     body = [{
         'text' : " ".join(args.text)
     }]
     request = requests.post(constructed_url, headers=headers, json=body)
     response = request.json()

     print(json.dumps(response, sort_keys=True, indent=4, separators=(',', ': ')))


if __name__ == "__main__":

    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("text", nargs="+")
    parser.add_argument("--from", "-f", default=None, help="Source language (default: LID)")
    parser.add_argument("--langs", "-l", required=True)
    parser.add_argument("--region", "-r", default="eastus")
    args = parser.parse_args()

    main(args)
