#!/usr/bin/env python3

import aws_cdk as cdk

from cdk.cdk_stack import DynamoDB, S3Bucket

app = cdk.App()

namespace = "insights-messaging"
DynamoDB(app, f'{namespace}-dynamodb')
S3Bucket(app, f'{namespace}-s3')
app.synth()
