#!/bin/bash
set -euo pipefail

BUCKET="gatus-tf-state-hamsa"
REGION="eu-west-2"

echo "🚀 Cleaning up bucket: $BUCKET in region: $REGION"

while true; do
  # Get versions and delete markers
  versions=$(aws s3api list-object-versions --bucket "$BUCKET" --region "$REGION" \
    --output text --query 'Versions[].{Key:Key,VersionId:VersionId}' || true)

  markers=$(aws s3api list-object-versions --bucket "$BUCKET" --region "$REGION" \
    --output text --query 'DeleteMarkers[].{Key:Key,VersionId:VersionId}' || true)

  # If nothing left, break out
  if [ -z "$versions" ] && [ -z "$markers" ]; then
    echo "✅ All objects and delete markers removed."
    break
  fi

  # Delete versions
  if [ -n "$versions" ]; then
    echo "$versions" | while read -r key vid; do
      if [ -n "$key" ] && [ -n "$vid" ]; then
        echo "Deleting object: $key (version $vid)"
        aws s3api delete-object --bucket "$BUCKET" --key "$key" --version-id "$vid" --region "$REGION"
      fi
    done
  fi

  # Delete delete markers
  if [ -n "$markers" ]; then
    echo "$markers" | while read -r key vid; do
      if [ -n "$key" ] && [ -n "$vid" ]; then
        echo "Deleting marker: $key (version $vid)"
        aws s3api delete-object --bucket "$BUCKET" --key "$key" --version-id "$vid" --region "$REGION"
      fi
    done
  fi
done

# Finally, delete the bucket
echo "🪣 Deleting bucket: $BUCKET"
aws s3api delete-bucket --bucket "$BUCKET" --region "$REGION"
echo "🎉 Bucket $BUCKET deleted successfully!"
