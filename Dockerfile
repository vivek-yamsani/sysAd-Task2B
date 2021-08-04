FROM ubuntu

RUN apt-get update
RUN apt-get install sudo
RUN apt-get install acl
RUN sudo apt-get install -y bsdmainutils

RUN apt-get install -y tzdata
RUN sudo apt-get install -y apache2
RUN sudo apt-get install -y php libapache2-mod-php php-mysql

COPY . /root/

WORKDIR /root/

RUN ./genUser.sh

RUN ./aliases.sh

RUN chmod u+x /root/commands.sh

RUN  /root/commands.sh

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
