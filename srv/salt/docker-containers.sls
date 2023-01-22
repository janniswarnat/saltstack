nginxdemos/hello:
  docker_image.present:
    - tag: latest

helloworld:
  docker_container.running:
    - image: nginxdemos/hello:latest
    - port_bindings:
      - 8081:80

