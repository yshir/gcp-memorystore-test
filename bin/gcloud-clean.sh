#!/bin/bash

set -eux

echo redis instance deleting...
gcloud redis instances delete $REDIS_INSTANCE_ID --region=$REGION
echo redis instance deleted successfully.

echo cloudfunction deleting...
gcloud functions delete $FUNCTION_NAME --region=$REGION
echo cloudfunction deleted.

echo vpc-access connectors deleting...
gcloud compute networks vpc-access connectors delete $VPC_CONNECTOR --region $REGION
echo vpc-access connectors deleted.

