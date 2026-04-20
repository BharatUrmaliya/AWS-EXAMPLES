#!/usr/bin/env bash

echo "== Sending a message to the SQS Standard Queue =="
QUEUE_URL = https://sqs.ap-south-1.amazonaws.com/455095160597/SQS-Standard-Stack-MyQueue-UPKauEU10ZEM

aws sqs send-message \
  --queue-url $QUEUE_URL \
  --message-body "Hello, SQS!" \
  --delay-seconds 1 \
  --message-attributes '{"AttributeName": {"DataType": "String", "StringValue": "Hello Sir"}}'
