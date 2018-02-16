#!/bin/bash




aws s3 sync /root/ctrip/cdn-test-analysis-001/client-test/logs s3://aws-china-cs-sa-group/sample-data/cloudfront-logs/ctrip-201802-test/client-test/
