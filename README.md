# Samba Storage Setup

1. Build the dockerfile using the standard build command - `docker build -t storage-samba .`
1. Make the storage location `mkdir storage` and allow read write from all users - `sudo chmod -R 777 <storage-location>`
1. Initialize a new Git repository in this directory and add a remote containing the Github access token.
1. Set the variable `export SAMBA_GIT_PATH=<storage_location>`
1. Run the docker image - `docker compose up`

Optionally to enable temperature metrics - 
1. Install `lm-sensors` and allow it to probe for all possible sensors

Make sure if you are using a external drive to allow permissions to access the folder. 
Next thing to do is allow this storage to be accessed by using VPN + Samba from public internet. 


