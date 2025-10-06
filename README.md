# Samba Storage Setup

1. Build the dockerfile using the standard build command - `docker build -t storage-samba .`
2. Make the storage location `mkdir storage` and allow read write from all users - `sudo chmod -R 777 <storage-location>`
3. Run the docker image - `docker run --name samba -p 139:139 -p 445:445 -v <storage-location>:/mount storage-samba`

Make sure if you are using a external drive to allow permissions to access the folder. 
Next thing to do is allow this storage to be accessed by using VPN + Samba from public internet. 


