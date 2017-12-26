# Simple web server
## Usage
### Execute application
```console
$ ./start.sh
```

Then show `http://localhost:8080`.  
Press `Ctrl-C` to stop application.


### Run test
```console
$ ./test.sh
```


### Run build by CircleCI
#### Settings
1. Create service account has role appengine deploy.
2. Download JSON key file of created service account.
3. Copy contents of key file
4. At CircleCI settings, add `GOOGLE_AUTH` environment variable set value key file contents.
5. Add `PROJECT_ID` environment variable set value your project id.
6. Run CI.

#### Running Build Localy
1. Install [CircleCI CLI](https://circleci.com/docs/2.0/local-jobs/)
2. Create service account, and download JSON key file.
3. Run below command.  
  ```console
  $ export GOOGLE_AUTH=$(cat {SERVICE_ACCOUNT_KEYFILE_PATH})
  $ export PROJECT_ID={YOUR_PROJECT_ID}
  $ circleci build -e GOOGLE_AUTH=$GOOGLE_AUTH -e PROJECT_ID=$PROJECT_ID
  ```


### Run build by Google Cloud Container Builder
#### Settings
1. Enable Google Cloud Container Builder on GCP Console
2. Add appengine deploy role to container builder service account.(`{YOUR_PROJECT_NUMBER}@cloudbuild.gserviceaccount.com`)

#### Running Build
1. Install Google Cloud SDK
2. Run below command.  
  ```console
  $ gcloud container builds submit --config gccb/cloudbuild.yaml .
  ```
