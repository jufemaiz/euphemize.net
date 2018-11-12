#!/bin/bash
function invalidation_status {
  invalidation_status=$(aws cloudfront list-invalidations \
    --max-items 1 \
    --distribution-id $CLOUDFRONT_DISTRIBUTION_ID \
    --query 'InvalidationList.Items[0].Status')
  echo "Last invalidation status: $invalidation_status ($SECONDS s)"
}

function wait_for_outstanding_invalidations {
  SECONDS=0
  while [ $(aws cloudfront get-distribution \
    --id $CLOUDFRONT_DISTRIBUTION_ID \
    --query 'Distribution.InProgressInvalidationBatches') -ne "0" ]; do
    echo "Invalidation in progress ($SECONDS s)"
    sleep 20
  done
  echo "No outstanding invalidations"
}

function wait_for_completed_invalidation {
  SECONDS=0
  invalidation_status
  while [ "$invalidation_status" != \"Completed\" ]; do
    sleep 20
    invalidation_status
  done
}
