#!/bin/bash

# Define variables
REGION="eu-north-1"
UNIQUE_ID=$(date +%s)
BUCKET_NAME="my-tf-state-jagan-$UNIQUE_ID"
DYNAMO_TABLE="terraform-locks"

echo "Creating S3 bucket: $BUCKET_NAME"

aws s3api create-bucket \
  --bucket $BUCKET_NAME \
  --region $REGION \
  --create-bucket-configuration LocationConstraint=$REGION

echo "Creating DynamoDB table for state locking (if not exists)..."

aws dynamodb create-table \
  --table-name $DYNAMO_TABLE \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --region $REGION || echo "DynamoDB table already exists. Skipping creation."

echo "✅ Setup complete. Use this bucket name in your backend config:"
echo "   $BUCKET_NAME"
#!/bin/bash

REGION="eu-north-1"
BUCKET_NAME="my-tf-state-bucket"
DYNAMO_TABLE="terraform-locks"

echo "Creating S3 bucket..."
aws s3api create-bucket \
  --bucket $BUCKET_NAME \
  --region $REGION \
  --create-bucket-configuration LocationConstraint=$REGION

echo "Creating DynamoDB table for state locking..."
aws dynamodb create-table \
  --table-name $DYNAMO_TABLE \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --region $REGION

echo "✅ Setup complete. S3 and DynamoDB are ready."
#!/bin/bash
aws s3api create-bucket --bucket my-tf-state-bucket --region eu-north-1

aws dynamodb create-table \
  --table-name terraform-locks \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST

