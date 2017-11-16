FROM python:2.7-alpine

ARG GCLOUD_SDK_VERSION=180.0.0

ENV GOPATH=/work
ENV PATH=${GOPATH}/bin:/google-cloud-sdk/bin:/google-cloud-sdk/platform/google_appengine:$PATH

RUN apk update \
 && apk add ca-certificates wget \
 && update-ca-certificates

RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GCLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
 && tar xvf google-cloud-sdk-${GCLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
 && google-cloud-sdk/install.sh --quiet \
 && rm google-cloud-sdk-${GCLOUD_SDK_VERSION}-linux-x86_64.tar.gz

RUN google-cloud-sdk/bin/gcloud --quiet components install app-engine-go \
 && chmod +x /google-cloud-sdk/platform/google_appengine/appcfg.py \
 && chmod +x /google-cloud-sdk/platform/google_appengine/goapp

WORKDIR /work

CMD goapp version
