FROM ubuntu:16.04
LABEL maintainer="Hernan Santos"
LABEL version="1.0"

#Mudando data e hora
RUN apt -y update && apt install -y tzdata
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo $TZ > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata  && date
#
RUN apt -y update && apt install -y cron rsyslog
CMD service cron start && service rsyslog start && tail -f /var/log/syslog
