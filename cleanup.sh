StudentMarkingBucket=$(aws cloudformation describe-stacks --stack-name testmonitor \
--query 'Stacks[0].Outputs[?OutputKey==`StudentMarkingBucket`].OutputValue' --output text)
StudentLabDataBucket=$(aws cloudformation describe-stacks --stack-name testmonitor \
--query 'Stacks[0].Outputs[?OutputKey==`StudentLabDataBucket`].OutputValue' --output text)
aws s3 rm s3://$StudentMarkingBucket  --recursive
aws s3 rm s3://$StudentLabDataBucket  --recursive
sleep 10
aws cloudformation delete-stack --stack-name testmonitor