FROM ubuntu:18.04

#timezone
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#update and install apache
RUN apt-get -y update
RUN apt-get -y install apache2

#Example of creating html file
RUN echo 'Hello from my Docker 07.04.2022 today' > /var/www/html/index.html

#what commands shoud be perform
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]

#port
EXPOSE 80
