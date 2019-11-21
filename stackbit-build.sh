#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dd651f6aac7e400194afc1e/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dd651f6aac7e400194afc1e
curl -s -X POST https://api.stackbit.com/project/5dd651f6aac7e400194afc1e/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5dd651f6aac7e400194afc1e/webhook/build/publish > /dev/null
