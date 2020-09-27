#!/bin/bash

./build.sh
# copy the build result to s3
aws s3 cp ./build/ s3://m-docs/ --recursive --acl public-read
# invalidate cloudfront cache to refelct the currect deployment
aws cloudfront create-invalidation --distribution-id E1ELZNX381MP7Q --paths "/*"