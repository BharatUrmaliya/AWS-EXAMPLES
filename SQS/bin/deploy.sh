#!/usr/bin/env bash


echo "== Deploying SQS Standard Queue =="
aws cloudformation deploy \
  --template-file /c/Data/github/AWS-EXAMPLES/SQS/standard/template.yml \
  --stack-name SQS-Standard-Stack \
  --capabilities CAPABILITY_NAMED_IAM