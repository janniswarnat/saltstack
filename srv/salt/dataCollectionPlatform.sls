#/mnt/rabbitmq/data-from-salt:
#  file.directory:
#    - user:  user
#    - name:  /home/init_dir
#    - group:  group
#    - mode:  755

#/tmp/nginxdemos-hello.tar:
#  file.managed:
#    - source:
#      - salt://images/nginxdemos-hello.tar

/tmp/2_edgeRealTimeBroker:
  file.recurse:
    - source:
      - salt://gitfiles/2_edgeRealTimeBroker

/tmp/1_dataCollectionPlatform:
  file.recurse:
    - source:
      - salt://gitfiles/1_dataCollectionPlatform

#pkg-uptodate:
#  pkg.uptodate:
#    - refresh : True
#    - security: True

#python3:
#  pkg:
#    - installed
#    - require:
#      - pkg: pkg-uptodate
  
# This will not work without Internet, we assume docker and docker-compose to be installed as a prerequisite
#docker:
#  pkg:
#    - installed
#    - require:
#      - pkg: python3
#  pip:
#    - installed
#    - require:
#      - pkg: docker
#  service.running:
#    - enable: True
#    - require:
#      - pip: docker
#  group.present:
#    - addusers:
#      - ec2-user
#    - require:
#      - pkg: docker

#docker-compose:
#  pip:
#    - installed
#    - require:
#      - pip: docker

#nginxdemos/hello:
#  docker_image.present:
#    - tag: latest
#    - load: salt://images/nginxdemos-hello.tar
#    - require:
#      - service: docker

dockercompose.build:
  module.run:
    - path: /tmp/1_dataCollectionPlatform  

#dockercompose.create:
#  module.run:
#    - path: /tmp/docker-compose.yml
#    - docker_compose: |+
#      services:
#        nginx-hello-world:
#          image: nginxdemos/hello:latest
#          ports:
#            - 8081:8080

dockercompose.up:
  module.run:
    - path: /tmp/1_dataCollectionPlatform/docker-compose.yml

#  docker_container.running:
#    - name: nginx-hello-world
#    - image: nginxdemos/hello:latest
#    - port_bindings:
#      - 8081:80
#    - require:
#      - docker_image: nginxdemos/hello
#  http.wait_for_successful_query:
#    - name: 'http://{{ grains['fqdn'] }}:8081'
#    - status: 200
#    - wait_for: 10
#    - require:
#      - docker_container: nginxdemos/hello


