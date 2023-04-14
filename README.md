# gcp-memorystore-test

Memorystore: https://cloud.google.com/memorystore?hl=ja

## Getting started

`cp .env.sample .env`

`make`

```sh
$ make
chmod 755 ./bin/*
docker compose run --rm gcloud bash
root@912645654a76:/workspaces#
```

`./bin/gcloud-init.sh`

```sh
root@912645654a76:/workspaces# ./bin/gcloud-init.sh
Welcome! This command will take you through the configuration of gcloud.

Your current configuration has been set to: [default]

You can skip diagnostics next time by using the following flag:
  gcloud init --skip-diagnostics

Network diagnostic detects and fixes local network connection issues.
Checking network connection...done.
Reachability Check passed.
Network diagnostic passed (1/1 checks passed).

You must log in to continue. Would you like to log in (Y/n)?  Y

Go to the following link in your browser:

    https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=32555940559.apps.googleusercontent.com&redirect_uri=https%3A%2F%2Fsdk.cloud.google.com%2Fauthcode.html&scope=openid+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcloud-platform+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fappengine.admin+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fsqlservice.login+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcompute+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Faccounts.reauth&state=YOjWZTTJxMhwt6SUtJgVwRa3HYxM5k&prompt=consent&access_type=offline&code_challenge=VI6ZIIfb6vyJ-dgsR12eodHgo2IOsuqdJiaG8n0Pl-w&code_challenge_method=S256

Enter authorization code: 4/0***********************************************
You are logged in as: [********@gmail.com].

Pick cloud project to use:
 [1] your-project-name
 [2] Enter a project ID
 [3] Create a new project
Please enter numeric choice or text value (must exactly match list item):  1

Your current project has been set to: [your-project-name].

Not setting default zone/region (this feature makes it easier to use
[gcloud compute] by setting an appropriate default value for the
--zone and --region flag).
See https://cloud.google.com/compute/docs/gcloud-compute section on how to set
default compute region and zone manually. If you would like [gcloud init] to be
able to do this for you the next time you run it, make sure the
Compute Engine API is enabled for your project on the
https://console.developers.google.com/apis page.

Created a default .boto configuration file at [/root/.boto]. See this file and
[https://cloud.google.com/storage/docs/gsutil/commands/config] for more
information about configuring Google Cloud Storage.
Your Google Cloud SDK is configured and ready to use!

* Commands that require authentication will use ********@gmail.com by default
* Commands will reference project `your-project-name` by default
Run `gcloud help config` to learn how to change individual settings

This gcloud configuration is called [default]. You can create additional configurations if you work with multiple accounts and/or projects.
Run `gcloud topic configurations` to learn more.

Some things to try next:

* Run `gcloud --help` to see the Cloud Platform services you can interact with. And run `gcloud help COMMAND` to get help on any gcloud command.
* Run `gcloud topic --help` to learn about advanced features of the SDK like arg files and output formatting
* Run `gcloud cheat-sheet` to see a roster of go-to `gcloud` commands.
```

`./bin/gcloud-redis-create.sh`

```sh
root@280a57ecbcba:/workspaces# ./bin/gcloud-redis-create.sh
+ instance_name=test-20230413
+ echo redis instance creating...
redis instance creating...
+ gcloud redis instances create test-20230413 --size=2 --region=us-central1 --redis-version=redis_6_x
API [redis.googleapis.com] not enabled on project [712468324858]. Would you like to enable and retry (this will take a few minutes)? (y/N)?  y

Enabling service [redis.googleapis.com] on project [712468324858]...
Operation "operations/acf.p2-712468324858-d873e036-3b48-4a20-a040-a2c8ff0975a4" finished successfully.
Create request issued for: [test-20230413]
Waiting for operation [projects/cloud-functions-test-361611/locations/us-central1/operations/operation-1681394182043-5f93816f2b5d6-7b5d35b0-ee46db41] to complete...done.
Created instance [test-20230413].
+ gcloud redis instances describe test-20230413 --region=us-central1
authorizedNetwork: projects/cloud-functions-test-361611/global/networks/default
availableMaintenanceVersions:
- '20230322_00_00'
connectMode: DIRECT_PEERING
createTime: '2023-04-13T13:56:22.975605132Z'
currentLocationId: us-central1-b
host: 10.216.40.35
locationId: us-central1-b
maintenanceVersion: '20220504_00_00'
memorySizeGb: 2
name: projects/cloud-functions-test-361611/locations/us-central1/instances/test-20230413
nodes:
- id: node-0
  zone: us-central1-b
persistenceConfig:
  persistenceMode: DISABLED
persistenceIamIdentity: serviceAccount:service-712468324858@cloud-redis.iam.gserviceaccount.com
port: 6379
readReplicasMode: READ_REPLICAS_DISABLED
redisVersion: REDIS_6_X
reservedIpRange: 10.216.40.32/29
state: READY
tier: BASIC
transitEncryptionMode: DISABLED
+ echo redis instance created successfully.
redis instance created successfully.
```
