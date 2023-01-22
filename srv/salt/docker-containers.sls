docker-pkg:
  pkg.installed:
    - name: docker
    - order: 1

docker-service-enabled:
   service.enabled:
     - name: docker
     - order: 3

docker-service-running:
   service.running:
     - name: docker
     - order: 4

docker-python:
  pip.installed:
    - name: docker
    - order: 5

nginxdemos/hello:
  docker_image.present:
    - tag: latest
    - order: 6

helloworld:
  docker_container.running:
    - image: nginxdemos/hello:latest
    - port_bindings:
      - 8081:80
    - order: 7

