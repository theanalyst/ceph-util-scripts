#!/bin/bash
# deletes a bucket and all objects in it

bucket=$1
buckets=$(s3 -us list $bucket | awk '{print $1}' | tail -n +4)

for i in $buckets
do
    s3 -us delete $bucket/$i
done

s3 -us delete $bucket
