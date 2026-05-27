#!/bin/bash

AMI_ID="ami-0220d79f3f480ecf5"
ZONE_ID="Z04296232TPHCB0NK6KLW"
DOMAIN_NAME="robo.lokesh23.online"

for instance in $@
do
    echo "Launching instance: $instance"
    INSTANCE_ID=$(aws ec2 run-instances \
        --image-id ami-0220d79f3f480ecf5 \
        --instance-type t3.micro \
        --security-groups "roboshop-common" "roboshop-$instance" \
        --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=robo-$instance}]" \
        --query 'Instances[0].InstanceId' \
        --output text
    )
done