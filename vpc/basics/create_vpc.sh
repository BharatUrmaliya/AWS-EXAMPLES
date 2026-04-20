#!/usr/bin/env bash

VPC_ID=$(aws ec2 create-vpc --cidr-block "172.1.0.0/16" \
--tag-specifications 'ResourceType=vpc, Tags=[{Key=Name, Value=my-vpc-01}]' \
--region ap-south-1 \
--query Vpc.VpcId \
--output text)

echo "Created VPC with ID: $VPC_ID"

# create an IGW (An Internet Gateway (IGW) is a VPC component that allows communication between your VPC and the internet.)
IGW_ID=$(aws ec2 create-internet-gateway \
--region ap-south-1 \
--query InternetGateway.InternetGatewayId \
--output text)

echo "Created IGW with ID: $IGW_ID"

# attached IGW with your VPC
aws ec2 attach-internet-gateway \
--internet-gateway-id "$IGW_ID" \
--vpc-id "$VPC_ID" 

# create a new subnet in the VPC
SUBNET_ID=$(aws ec2 create-subnet \
--vpc-id "$VPC_ID" \
--cidr-block "172.1.1.0/16" \
--region "ap-south-1" \
--tag-specifications 'ResourceType=subnet, Tags=[{Key=Name, Value=my-subnet-01}]' \
--query Subnet.SubnetId \
--output text)

echo "Created Subnet with ID: $SUBNET_ID"

#explicity associate the subnet with the IGW
RT_ID=$(aws ec2 describe-route-tables \
--filters "Name=vpc-id,Values=$VPC_ID" "Name=association.main,Values=true" \
--query "RouteTables[].RouteTableId" \
--output text)

echo "Main Route Table ID: $RT_ID"

aws ec2 associate-route-table \
    --route-table-id "$RT_ID" \
    --subnet-id "$SUBNET_ID"

# enable DNS hostnames in the VPC
aws ec2 modify-vpc-attribute \
    --vpc-id "$VPC_ID" \
    --enable-dns-hostnames "{\"Value\":true}"