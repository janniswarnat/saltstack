FROM python:3.7-slim-bullseye
RUN apt-get update
RUN apt-get install -y gcc
RUN apt-get install -y g++
RUN apt-get install -y autoconf
RUN apt-get install -y make
RUN apt-get install -y libffi-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y libldap2-dev
RUN apt-get install -y libsasl2-dev
RUN apt-get install -y dumb-init
RUN apt-get install -y wget
RUN apt-get install -y curl
RUN apt-get install -y vim
RUN apt-get install -y nano
RUN apt-get install -y telnet
RUN apt-get install -y sqlite3
RUN apt-get install -y supervisor
RUN apt-get install -y git
# Needed because smart_proxy_salt uses which('sudo')
#RUN apt-get install -y sudo
#RUN apt-get install -y ruby
#RUN apt-get install -y ruby-dev

RUN rm -rf /var/lib/apt/lists/*

RUN addgroup --gid 450 --system salt
RUN adduser --shell /bin/sh --system --disabled-password --ingroup salt salt
RUN mkdir -p /etc/pki /etc/salt/pki /etc/salt/minion.d/ /etc/salt/master.d /etc/salt/proxy.d /var/cache/salt /var/log/salt /var/run/salt
RUN chmod -R 2775 /etc/pki /etc/salt /var/cache/salt /var/log/salt /var/run/salt
RUN chgrp -R salt /etc/pki /etc/salt /var/cache/salt /var/log/salt /var/run/salt

RUN mkdir -p /var/log/supervisor

ENTRYPOINT ["/usr/bin/dumb-init"]
CMD ["/usr/local/bin/saltinit"]
ADD saltinit.py /usr/local/bin/saltinit
RUN chmod u+rwx /usr/local/bin/saltinit
EXPOSE 4505 4506 8000 9000
VOLUME /etc/salt/pki/

RUN pip3 install --no-cache-dir python-ldap
RUN pip3 install --no-cache-dir pyzmq PyYAML pycrypto msgpack jinja2 psutil tornado cherrypy GitPython pygit2

WORKDIR /github.com
#RUN git clone https://github.com/saltstack/salt
RUN git clone --depth 1 --branch v3006.0rc1 https://github.com/saltstack/salt
RUN USE_STATIC_REQUIREMENTS=1 pip3 install --no-cache-dir salt=="v3006.0rc1"
RUN pip3 install -e ./salt
RUN su - salt -c 'salt-run salt.cmd tls.create_self_signed_cert'

#RUN git clone https://github.com/theforeman/smart-proxy.git -b 3.5-stable
#RUN git clone https://github.com/theforeman/smart_proxy_salt.git # -b 5.0.0 = master since 2022-02-14
#RUN git clone https://github.com/theforeman/smart_proxy_dynflow.git # -b v0.7.0

#WORKDIR /github.com/smart-proxy
#RUN gem install bundler
#ADD dynflow.local.rb /github.com/smart-proxy/bundler.d/dynflow.local.rb
#ADD salt.local.rb /github.com/smart-proxy/bundler.d/salt.local.rb
#ADD debug.rb /github.com/smart-proxy/bundler.d/debug.rb

#RUN bundle config set --local without 'development test krb5 puppet_proxy_legacy bmc libvirt journald'
#RUN bundle install

ADD prefix-log /usr/local/bin/prefix-log

# Workaround
#RUN ls /github.com/smart_proxy_salt
#RUN cp /github.com/smart_proxy_salt/bin/salt_python_wrapper /usr/bin
#RUN sed -i 's/sh/bash/g' /usr/bin/salt_python_wrapper


