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

/tmp/2_edgeRealTimeBrokerViaSalt:
  file.recurse:
    - source:
      - salt://gitfiles/2_edgeRealTimeBroker

/tmp/1_dataCollectionPlatformViaSalt:
  file.recurse:
    - source:
      - salt://gitfiles/1_dataCollectionPlatform

datacollectionplatform:
  docker_image.present:
    - tag: local

dockercompose.build:
  module.run:
    - path: /tmp/1_dataCollectionPlatformViaSalt  

dockercompose.up:
  module.run:
    - path: /tmp/1_dataCollectionPlatformViaSalt/docker-compose.yml

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


