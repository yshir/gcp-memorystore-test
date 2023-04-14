#!/bin/bash

set -eux

echo redis instance deleting...
gcloud redis instances delete $REDIS_INSTANCE_ID --region=$REGION -q
echo redis instance deleted successfully.

echo cloudfunction deleting...
gcloud functions delete $FUNCTION_NAME --region=$REGION -q
echo cloudfunction deleted.

echo vpc-access connectors deleting...
gcloud compute networks vpc-access connectors delete $VPC_CONNECTOR --region $REGION -q
echo vpc-access connectors deleted.
