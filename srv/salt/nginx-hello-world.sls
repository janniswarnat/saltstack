#pkg-uptodate:
#  pkg.uptodate:
#    - refresh : True
#    - security: True

#python3:
#  pkg:
#    - installed
#    - require:
#      - pkg: pkg-uptodate

#python3-pip:
#  pkg:
#    - installed
#    - require:
#      - pkg: python3



## prereq: https://docs.docker.com/engine/install/ubuntu/

# Add Docker's official GPG key:
#sudo apt-get update
#sudo apt-get install ca-certificates curl gnupg
#sudo install -m 0755 -d /etc/apt/keyrings
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
#sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
#echo \
#  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
#  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
#  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
#sudo apt-get update

#docker-ce:
#  pkg:
#    - installed

#docker-ce-cli:
#  pkg:
#    - installed
#    - require:
#      - pkg: docker-ce

#containerd.io:
#  pkg:
#    - installed
#    - require:
#      - pkg: docker-ce-cli

#docker-buildx-plugin:
#  pkg:
#    - installed
#    - require:
#      - pkg: docker-ce-cli

#docker-compose-plugin:
#  pkg:
#    - installed
#    - require:
#      - pkg: docker-buildx-plugin

docker:
#  pkg:
#    - installed
  pip:
    - installed
#    - require:
#      - pkg: docker
#  service.running:
#    - enable: True
#    - require:
#      - pip: docker

refresh_pillar:
  module.run:
    - name: saltutil.refresh_pillar

docker_login:
  module.run:
    - name: docker.login

registry.gitlab.cc-asp.fraunhofer.de/janniswarnat/nginx-demos:
  docker_image.present:
    - tag: hello-plain-text
    - force: True
#    - require:
#      - service: docker
  docker_container.running:
    - name: nginx-hello-world
    - image: registry.gitlab.cc-asp.fraunhofer.de/janniswarnat/nginx-demos:hello-plain-text
    - port_bindings:
      - 8081:80
    - require:
      - docker_image: registry.gitlab.cc-asp.fraunhofer.de/janniswarnat/nginx-demos
  http.wait_for_successful_query:
    - name: 'http://{{ grains['fqdn'] }}:8081'
    - status: 200
    - wait_for: 10
    - require:
      - docker_container: registry.gitlab.cc-asp.fraunhofer.de/janniswarnat/nginx-demos
