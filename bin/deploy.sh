#!/bin/bash
set -euo pipefail
source "$(dirname "$0")/functions.sh"

echo "~~~ Updating infra ~~~"
cd infra
terraform apply
cd ../

# Extract distribution ID from terraform
export CLOUDFRONT_DISTRIBUTION_ID=$(terraform output \
  -state=infra/terraform.tfstate cloudfront_distribution_id)
export WEBSITE_BUCKET=$(terraform output \
  -state=infra/terraform.tfstate website_bucket_name)

echo "~~~ Deploying to s3 ~~~"
# Deploy to S3
aws s3 sync website/ s3://$WEBSITE_BUCKET

echo "~~~ Invalidating Cloudfront ~~~"
wait_for_outstanding_invalidations

# Create validation
aws cloudfront create-invalidation \
  --distribution-id $CLOUDFRONT_DISTRIBUTION_ID \
  --paths "/*"

wait_for_completed_invalidation
