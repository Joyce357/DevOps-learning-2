#!/usr/bin/env bash

set -euo pipefail

readonly REGION="ca-central-1"
readonly VPC_ID="vpc-0f895a571d181dff7"
readonly JENKINS_INSTANCE_ID="i-02aae04aa3e3f4408"

usage() {
  cat <<'EOF'
Usage: ./stop-vpc-instances.sh [--yes] [--dry-run]

Stops all running EC2 instances in vpc-0f895a571d181dff7 in ca-central-1,
except for the Jenkins instance i-02aae04aa3e3f4408.

Options:
  --yes      Skip the confirmation prompt.
  --dry-run  Ask AWS to validate the stop request without stopping instances.
  -h, --help Show this help message.
EOF
}

assume_yes=false
dry_run=false

while (($# > 0)); do
  case "$1" in
    --yes) assume_yes=true ;;
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

# Select only running instances in the target VPC, while explicitly excluding Jenkins.
instance_ids=()
while IFS= read -r instance_id; do
  [[ -n "$instance_id" ]] && instance_ids+=("$instance_id")
done < <(
  aws ec2 describe-instances \
    --region "$REGION" \
    --filters \
      "Name=vpc-id,Values=$VPC_ID" \
      "Name=instance-state-name,Values=running" \
    --query "Reservations[].Instances[?InstanceId!='${JENKINS_INSTANCE_ID}'].InstanceId" \
    --output text | tr '\t' '\n'
)

if ((${#instance_ids[@]} == 0)); then
  echo "No running EC2 instances need to be stopped in $VPC_ID."
  echo "Jenkins remains excluded: $JENKINS_INSTANCE_ID"
  exit 0
fi

echo "Region: $REGION"
echo "VPC: $VPC_ID"
echo "Excluded Jenkins instance: $JENKINS_INSTANCE_ID"
echo "Instances selected for shutdown:"
printf '  %s\n' "${instance_ids[@]}"

if [[ "$dry_run" == false && "$assume_yes" == false ]]; then
  read -r -p "Stop these ${#instance_ids[@]} instance(s)? [y/N] " answer
  [[ "$answer" =~ ^[Yy]$ ]] || { echo "Cancelled; no instances were stopped."; exit 0; }
fi

stop_args=(
  ec2 stop-instances
  --region "$REGION"
  --instance-ids "${instance_ids[@]}"
)

if [[ "$dry_run" == true ]]; then
  stop_args+=(--dry-run)
  echo "Running AWS dry-run validation..."
fi

aws "${stop_args[@]}"

if [[ "$dry_run" == false ]]; then
  echo "Stop request submitted. Jenkins was not included."
fi
