#!/bin/sh
docker run -it --rm -v $(pwd):/work/src/hello-world -w /work/src/hello-world -p 8080:8080 -p 8000:8000 ryutah/gcloud-gaego "goapp" "serve" "-host" "0.0.0.0" "."
