# Pull a common image which has a Samba executable
FROM dperson/samba

ENV TZ=Asia/Kolkata

# Set up your shared folder inside the container
RUN mkdir -p /mount && chmod 777 /mount

# Configure Samba user and share
CMD ["-u", "altotenor;1234", \
     "-s", "store;/mount;yes;no;no;all;none;altotenor"]

