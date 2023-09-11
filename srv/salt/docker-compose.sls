docker-compose:
  pip:
    - installed
    - extra_args:
      - --no-build-isolation

dockercompose.create:
  module.run:
    - path: /tmp/docker-compose-created.yml
    - docker_compose: >
        services:
          nginx-hello-world:
            image: nginxdemos/hello:latest
            container_name: nginx-hello-world
            ports:
              - 8082:8080

dockercompose.up:
  module.run:
    - path: /tmp/docker-compose-created.yml

nginxdemos/hello:
  docker_image.present:
    - tag: latest
  docker_container.running:
    - name: nginx-hello-world-original   
    - image: nginxdemos/hello:latest
    - port_bindings:
      - 8082:80
    - require:
      - docker_image: nginxdemos/hello
  http.wait_for_successful_query:
    - name: 'http://{{ grains['fqdn'] }}:8081'
    - status: 200
    - wait_for: 10
    - require:
      - docker_container: nginxdemos/hello
