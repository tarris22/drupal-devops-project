# Serverless Upload Processing

1. An object is uploaded to the S3 bucket.
2. S3 sends an ObjectCreated event to the Lambda function.
3. Lambda reads the uploaded object's metadata using HeadObject.
4. Lambda stores the filename, bucket, file size and upload timestamp in DynamoDB.

Resources:
- S3: drupal-serverless-uploads-244678446741
- Lambda: drupal-s3-upload-processor
- DynamoDB: drupal-upload-metadata
- Region: eu-north-1
