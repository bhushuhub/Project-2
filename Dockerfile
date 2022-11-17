FROM tomcat
COPY target/*.war /mnt/apache-tomcat-9.0.69/webapps
