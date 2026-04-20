#!/usr/bin/env bash
aws cloudformation deploy \
 --template-file ../bin/template.yml \
 --stack-name my-new-stack  \
 --capabilities CAPABILITY_NAMED_IAM