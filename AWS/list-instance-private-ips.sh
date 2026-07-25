#!/usr/bin/env bash

set -euo pipefail

AWS_REGION="${1:-ca-central-1}"

if ! command -v aws >/dev/null 2>&1; then
  echo "Error: AWS CLI is not installed." >&2
  exit 1
fi

echo "EC2 instances in ${AWS_REGION}:"

aws ec2 describe-instances \
  --region "${AWS_REGION}" \
  --query 'Reservations[].Instances[].{Name: Tags[?Key==`Name`].Value | [0], InstanceId: InstanceId, PrivateIP: PrivateIpAddress, State: State.Name}' \
  --output table
