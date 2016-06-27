#!/bin/bash
XSD_DIRECTORY=target/generated-sources/aqSchema
AQ_HOST=$1

echo "Downloading XSDs from $AQ_HOST"

pwd
mkdir -p $XSD_DIRECTORY

COUNTER=0
while [ `curl -s -o /dev/null -w "%{http_code}" "http://$AQ_HOST/AQUARIUS/Publish/v2/metadata?xsd=$COUNTER"` -eq 200 ]; do
	wget "http://$AQ_HOST/AQUARIUS/Publish/v2/metadata?xsd=$COUNTER" -O$XSD_DIRECTORY/$COUNTER.xsd
	let COUNTER=COUNTER+1
done