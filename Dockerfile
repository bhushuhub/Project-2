FROM tomcat:9
COPY target/*.war /mnt/apache-tomcat-9.0.69/webapps
