#!/usr/bin/env bash

echo "== Sending a message to the SQS Standard Queue =="
aws recieve-message \
  --queue-url https://sqs.ap-south-1.amazonaws.com/455095160597/SQS-Standard-Stack-MyQueue-UPKauEU10ZEM \
  --message-attribute-names All \
  --max-number-of-messages 1    
  