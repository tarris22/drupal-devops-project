import json
import os
import urllib.parse
from datetime import datetime, timezone

import boto3

s3 = boto3.client("s3")
dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table(os.environ["TABLE_NAME"])

def lambda_handler(event, context):
    results = []

    for record in event["Records"]:
        bucket = record["s3"]["bucket"]["name"]
        key = urllib.parse.unquote_plus(record["s3"]["object"]["key"])

        response = s3.head_object(Bucket=bucket, Key=key)

        item = {
            "uploadId": context.aws_request_id + "-" + key,
            "fileName": key,
            "bucket": bucket,
            "fileSize": response["ContentLength"],
            "uploadedAt": datetime.now(timezone.utc).isoformat()
        }

        table.put_item(Item=item)
        results.append(item)

    return {
        "statusCode": 200,
        "body": json.dumps(results)
    }
