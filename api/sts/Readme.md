## Create user with no permission
aws iam create-user --sts-machine-user

## creating access key 
aws iam create-access-key --user-name Bob

aws configure

aws s3 ls --profile sts

##  open aws credentials file in windowns
notepad open ~/.aws/credentials

'''sh
aws sts assume-role \
--role-arn <value you can copy from resouce >
--role-session-name <value>
--profile sts
## get caller identity
aws sts get-caller-identity --profile  default

## put user policy 
aws iam put-user-policy \
    --user-name sts-machine-user \
    --policy-name StsAssumePolicy \
    --policy-document file://Policy.json