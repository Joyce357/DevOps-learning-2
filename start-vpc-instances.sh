#!/usr/bin/env bash

set -euo pipefail

readonly REGION="ca-central-1"
readonly VPC_ID="vpc-0f895a571d181dff7"
readonly JENKINS_INSTANCE_ID="i-02aae04aa3e3f4408"

usage() {
  cat <<'EOF'
Usage: ./start-vpc-instances.sh [--dry-run]

Starts all stopped EC2 instances in vpc-0f895a571d181dff7 in ca-central-1,
except for the Jenkins instance i-02aae04aa3e3f4408.

Options:
  --dry-run  Ask AWS to validate the start request without starting instances.
  -h, --help Show this help message.
EOF
}

dry_run=false

while (($# > 0)); do
  case "$1" in
    --dry-run) dry_run=true ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage >&2; exit 2 ;;
  esac
  shift
done

command -v aws >/dev/null 2>&1 || {
  echo "Error: AWS CLI is not installed or is not in PATH." >&2
  exit 1
}

# Select only stopped instances in the target VPC, while explicitly excluding Jenkins.
instance_output="$(
  aws ec2 describe-instances \
    --region "$REGION" \
    --filters \
      "Name=vpc-id,Values=$VPC_ID" \
      "Name=instance-state-name,Values=stopped" \
    --query "Reservations[].Instances[?InstanceId!='${JENKINS_INSTANCE_ID}'].InstanceId" \
    --output text
)"

instance_ids=()
while IFS= read -r instance_id; do
  [[ -n "$instance_id" ]] && instance_ids+=("$instance_id")
done < <(printf '%s\n' "$instance_output" | tr '\t' '\n')

if ((${#instance_ids[@]} == 0)); then
  echo "No stopped EC2 instances need to be started in $VPC_ID."
  echo "Jenkins remains excluded: $JENKINS_INSTANCE_ID"
  exit 0
fi

echo "Region: $REGION"
echo "VPC: $VPC_ID"
echo "Excluded Jenkins instance: $JENKINS_INSTANCE_ID"
echo "Instances selected for startup:"
printf '  %s\n' "${instance_ids[@]}"

start_args=(
  ec2 start-instances
  --region "$REGION"
  --instance-ids "${instance_ids[@]}"
)

if [[ "$dry_run" == true ]]; then
  start_args+=(--dry-run)
  echo "Running AWS dry-run validation..."
fi

aws "${start_args[@]}"

if [[ "$dry_run" == false ]]; then
  echo "Start request submitted. Jenkins was not included."
fi
