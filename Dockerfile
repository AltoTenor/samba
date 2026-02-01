# Pull a common image which has a Samba executable
FROM dperson/samba:latest

ENV TZ=Asia/Kolkata

# Set up your shared folder inside the container
RUN mkdir -p /mount && chmod -R 777 /mount

RUN apk add --no-cache git

COPY setup_cron.sh /setup_cron.sh
COPY github_sync.sh /github_sync.sh
RUN chmod +x /setup_cron.sh 
RUN chmod +x /github_sync.sh 

ENTRYPOINT ["/sbin/tini", "--", "/setup_cron.sh"]

# Configure Samba user and share
CMD ["-u", "alto;1234", \
     "-s", "store;/mount;yes;no;no;all;none;alto;force user=alto;force group=alto"]

