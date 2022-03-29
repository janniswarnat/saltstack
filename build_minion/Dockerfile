# FROM debian:bullseye-slim
FROM debian:bullseye

#RUN apt-get update && apt-get install -y \
#  salt-minion \
#  && rm -rf /var/lib/apt/lists/* \

RUN apt-get update
RUN apt-get install -y man
RUN apt-get install -y telnet
RUN apt-get install -y inetutils-ping
RUN apt-get install -y curl

RUN curl -fsSL -o /usr/share/keyrings/salt-archive-keyring.gpg https://repo.saltproject.io/py3/debian/11/amd64/latest/salt-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/salt-archive-keyring.gpg arch=amd64] https://repo.saltproject.io/py3/debian/11/amd64/latest bullseye main" | tee /etc/apt/sources.list.d/salt.list

RUN apt-get update
RUN apt-get install -y salt-minion



