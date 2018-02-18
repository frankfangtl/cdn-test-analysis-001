#!/bin/bash

# kinesis agent
#sudo yum install -y kinesis-agent
#cp agent.json /etc/aws-kinesis/agent.json
#sudo service aws-kinesis-agent restart


# Fluentd
# https://docs.fluentd.org/v1.0/articles/install-by-rpm
curl -L https://toolbelt.treasuredata.com/sh/install-amazon2-td-agent3.sh | sh


#/usr/lib/systemd/system/td-agent

exit 0
