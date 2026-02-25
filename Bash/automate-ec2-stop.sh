#!/bin/bash

# stop-ec2-by-tag.sh


REGION="ca-central-1"
TAG_KEY="Environment"
TAG_VALUE="Dev"


echo "Checking AWS CLI..."

if ! command -v aws &> /dev/null
then
    echo "AWS CLI not installed. Please install AWS CLI."
    exit 1
fi

echo "Fetching running EC2 instances with tag $TAG_KEY=$TAG_VALUE in region $REGION..."

INSTANCE_IDS=$(aws ec2 describe-instances \
    --region $REGION \
    --filters "Name=tag:$TAG_KEY,Values=$TAG_VALUE" "Name=instance-state-name,Values=running" \
    --query "Reservations[].Instances[].InstanceId" \
    --output text)

if [ -z "$INSTANCE_IDS" ]; then
    echo "No running instances found with tag $TAG_KEY=$TAG_VALUE"
    exit 0
fi

echo "Instances to stop:"
echo "$INSTANCE_IDS"

echo "Stopping instances..."

aws ec2 stop-instances --region $REGION --instance-ids $INSTANCE_IDS

echo "Stop request sent successfully."
