* Note: localstack 0.11.0 부터는 모든 APIs 단위 포인트(http://localhost:4566)로 연결을 됨
* API Gateway at http://localhost:4567
* Kinesis at http://localhost:4568
* DynamoDB at http://localhost:4569
* DynamoDB Streams at http://localhost:4570
* S3 at http://localhost:4572
* Firehose at http://localhost:4573
* Lambda at http://localhost:4574
* SNS at http://localhost:4575
* SQS at http://localhost:4576
* Redshift at http://localhost:4577
* Elasticsearch Service at http://localhost:4578
* SES at http://localhost:4579
* Route53 at http://localhost:4580
* CloudFormation at http://localhost:4581
* CloudWatch at http://localhost:4582
* SSM at http://localhost:4583
* SecretsManager at http://localhost:4584
* StepFunctions at http://localhost:4585
* CloudWatch Logs at http://localhost:4586
* EventBridge (CloudWatch Events) at http://localhost:4587
* STS at http://localhost:4592
* IAM at http://localhost:4593
* EC2 at http://localhost:4597
* KMS at http://localhost:4599
* ACM at http://localhost:4619

### SQS

* create a SQS queue named testQueue:

```bash
echo "Create SQS queue testQueue"

aws \
  sqs create-queue \
  --queue-name testQueue \
  --endpoint-url http://localhost:4566 
```

* create an SNS topic named testTopic and subscribe testQueue to it:

```bash
echo "Create SNS Topic testTopic"

aws \
  sns create-topic \
  --name testTopic \
  --endpoint-url http://localhost:4566 
  
echo "Subscribe testQueue to testTopic"

aws \
  sns subscribe \
  --endpoint-url http://localhost:4566 \
  --topic-arn arn:aws:sns:us-east-1:000000000000:testTopic \
  --protocol sqs \
  --notification-endpoint arn:aws:sqs:us-east-1:000000000000:testQueue
```