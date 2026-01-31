FROM tomcat:10-jdk17

LABEL maintainer="Durga <durgaprasadsetti67@gmail.com>"

EXPOSE 8080

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/naturefood.war /usr/local/tomcat/webapps/
