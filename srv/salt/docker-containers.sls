janniswarnat/hello-world-express-app:
  docker_image.present:
    - tag: latest

Run the app:
  docker_container.running:
    - image: janniswarnat/helloworld-express-app:latest
    - port_bindings:
      - 8081:8080

