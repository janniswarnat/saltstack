# FROM debian:bullseye-slim
FROM debian:bullseye

#RUN apt-get update && apt-get install -y \
#  salt-minion \
#  && rm -rf /var/lib/apt/lists/* \

RUN apt-get update
RUN apt-get install -y salt-minion
RUN apt-get install -y man
RUN apt-get install -y telnet
RUN apt-get install -y inetutils-ping

RUN mkdir -p /var/lib/salt/pki/minion


