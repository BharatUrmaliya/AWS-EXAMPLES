#!/usr/bin/env bash

# Read the VPC ID, IGW ID, Subnet ID, Route Table ID from the user
read -p "Enter VPC ID: " VPC_ID
read -p "Enter Internet Gateway ID: " IGW_ID
read -p "Enter Subnet ID: " SUBNET_ID
read -p "Enter Route Table ID: " RT_ID

# detach IGW from VPC
aws ec2 detach-internet-gateway --internet-gateway-id "$IGW_ID" --vpc-id "$VPC_ID"

#delete IGW
aws ec2 delete-internet-gateway --internet-gateway-id "$IGW_ID"

#delete subnet
aws ec2 delete-subnet --subnet-id "$SUBNET_ID"

#delete route table
aws ec2 delete-route-table --route-table-id "$RT_ID"

#delete VPC
aws ec2 delete-vpc --vpc-id "$VPC_ID"


