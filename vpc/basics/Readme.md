## create a vpc using aws cli

aws ec2 create-vpc --cidr-block "172.1.0.0/16" \
--tag-specifications 'ResourceType=vpc, Tags=[{Key=Name, Value=my-vpc-01}]' \
--region ap-south-1 \
--query Vpc.VpcId \
--output text

## create an IGW (An Internet Gateway (IGW) is a VPC component that allows communication between your VPC and the internet.)
 aws ec2 create-internet-gateway

 ## attached IGW with your VPC
  aws ec2 attach-internet-gateway --internet-gateway-id '' --vpc-id ''

  ## Create a new subnet in the VPC

  ## Associate the subnet with IGW

  ## enable DSN hostname to the VPC
