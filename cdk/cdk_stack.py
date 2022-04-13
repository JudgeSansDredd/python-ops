from aws_cdk import App, Stack
from aws_cdk import aws_dynamodb as dynamodb
from aws_cdk import aws_s3 as s3
from constructs import Construct

# from stacks import DynamoDB


class DynamoDB(Stack):

    def __init__(self, scope: App, construct_id: str, **kwargs) -> None:
        super().__init__(scope, construct_id)
        table = dynamodb.Table(
            self,
            'insights-messaging',
            table_name="insights-messaging",
            partition_key=dynamodb.Attribute(
                name="insights-messaging",
                type=dynamodb.AttributeType.STRING
            )
        )

class S3Bucket(Stack):

    def __init__(self, scope: App, construct_id: str, **kwargs) -> None:
        super().__init__(scope, construct_id)
        table = s3.Bucket(
            self,
            "insights-messaging",
            bucket_name="insights-messaging"
        )
