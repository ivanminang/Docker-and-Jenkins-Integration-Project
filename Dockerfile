# specifying base image
FROM centos:7

# description
LABEL description="Building this image for apache container"
LABEL Maintenance="IVAN"

# Executing command to update the packages
RUN yum -y update 

# Executing command to install Apache
RUN yum -y install httpd

# copying index file from our local into the container at a specified location
COPY index.html /var/www/html/

# Container will listen on port 80
EXPOSE 80 

# start our container with HTTPD
# systemctl start httpd
ENTRYPOINT [ "/usr/sbin/httpd" ]

# /usr/sbin/httpd" -D FOREGROUND
CMD [ "-D", "FOREGROUND" ]