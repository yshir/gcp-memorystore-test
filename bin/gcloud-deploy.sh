#!/bin/bash

set -eux

gcloud services enable vpcaccess.googleapis.com
gcloud services enable cloudfunctions.googleapis.com

echo redis instance creating...

gcloud redis instances create $REDIS_INSTANCE_ID -q \
  --size=2 \
  --region=$REGION \
  --redis-version=redis_6_x

gcloud redis instances describe $REDIS_INSTANCE_ID \
  --region=$REGION

echo redis instance created successfully.

echo vpc-access connectors creating...

gcloud compute networks vpc-access connectors create $VPC_CONNECTOR -q \
  --network default \
  --range 10.8.0.0/28 \
  --region $REGION

gcloud compute networks vpc-access connectors describe $VPC_CONNECTOR \
  --region $REGION

echo vpc-access connectors created.

echo cloudfunction deploy...

redis_host=$(gcloud redis instances describe $REDIS_INSTANCE_ID --region=$REGION --format="value(host)")
redis_port=$(gcloud redis instances describe $REDIS_INSTANCE_ID --region=$REGION --format="value(port)")

echo "redis_host=$redis_host, redis_port=$redis_port"

gcloud functions deploy $FUNCTION_NAME -q \
  --region=$REGION \
  --runtime=nodejs16 \
  --source=. \
  --entry-point=$FUNCTION_ENTRYPOINT \
  --trigger-http \
  --allow-unauthenticated \
  --vpc-connector=projects/$PROJECT_ID/locations/$REGION/connectors/$VPC_CONNECTOR \
  --set-env-vars=REDIS_HOST=$redis_host,REDIS_PORT=$redis_port

gcloud functions describe $FUNCTION_NAME \
  --region=$REGION \
  --format="value(serviceConfig.uri)"

echo cloudfunction deploy finished.
