#!/bin/sh -eux

mkdir -p /work/src/hello-world
cp -r /workspace/* /work/src/hello-world
cd /work/src/hello-world

goapp test .

appcfg.py update --application $PROJECT_ID --version 1 --oauth2_access_token $(gcloud auth print-access-token 2> /dev/null) .
