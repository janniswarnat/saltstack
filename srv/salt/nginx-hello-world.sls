pkg-uptodate:
  pkg.uptodate:
    - refresh : True
  
docker:
  pkg:
    - installed
    - require:
      - pkg: pkg-uptodate
  pip:
    - installed
    - require:
      - pkg: docker
  service.running:
    - enable: True
    - require:
      - pip: docker

nginxdemos/hello:
  docker_image.present:
    - tag: latest
    - require:
      - service: docker
  docker_container.running:
    - name: nginx-hello-world
    - image: nginxdemos/hello:latest
    - port_bindings:
      - 8081:80
    - require:
      - docker_image: nginxdemos/hello
  http.wait_for_successful_query:
    - name: 'http://{{ grains['fqdn'] }}:8081'
    - status: 200
    - wait_for: 10
    - require:
      - docker_container: nginxdemos/hello


