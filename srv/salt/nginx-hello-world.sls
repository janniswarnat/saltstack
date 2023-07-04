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

#docker.io:
#  pkg:
#    - installed
#    - require:
#      - pkg: python3-pip

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
#      - pkg: docker-buildx-plugin,

#docker:
#  pkg:
#    - installed
#    - require:
#      - pkg: docker.io
#  pip:
#    - installed
#    - require:
#      - pkg: docker
#  service.running:
#    - enable: True
#    - require:
#      - pip: docker

nginxdemos/hello:
  docker_image.present:
    - tag: latest
#    - require:
#      - service: docker
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


