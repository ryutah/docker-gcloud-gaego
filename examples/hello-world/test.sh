#!/bin/sh
docker run --rm -it -v $(pwd):/work/src/hello-world -w /work/src/hello-world ryutah/gcloud-gaego "go" "test" "."
