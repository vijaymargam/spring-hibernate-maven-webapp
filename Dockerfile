FROM tomcat:7

MAINTAINER vijay_margam

WORKDIR /usr/local/tomcat
ADD ./target/*.war /usr/local/tomcat/webapps/

COPY ./tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

EXPOSE 8080
