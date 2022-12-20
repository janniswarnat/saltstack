## Salt

https://localhost:8000/

https://saltproject.io/

https://hub.docker.com/r/saltstack/salt

https://www.linkedin.com/pulse/how-setup-docker-saltstack-development-environment-dehvon-curtis/

https://stackoverflow.com/questions/64352223/problem-with-salt-master-and-salt-minion-connection-in-docker

### Install on Minion

```
curl -L https://bootstrap.saltproject.io -o install_salt.sh
sudo sh install_salt.sh --help
sudo sh install_salt.sh -P
master:
  - 192.168.178.42
  - 192.168.178.40
  - 192.168.178.44
sudo systemctl restart salt-minion
sudo systemctl stop salt-minion
```

On master:
salt-key -F master

Set master.pub fingerprint in minion configuration:

master_finger: 'f3:c6:4a:d4:d3:f2:36:42:eb:e2:b4:5c:a6:77:7d:ea:70:b8:60:b9:22:ee:38:02:6c:2e:62:d2:50:d5:29:9e'

Set IP address of master in `/etc/salt/minion`

Restart minion.

On master:

salt-key -A

salt '*' state.apply nettools
salt '*' state.apply