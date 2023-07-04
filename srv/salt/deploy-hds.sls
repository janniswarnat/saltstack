hds-jannis-test:
  docker_network.present:
    - driver: bridge
    - subnet: 172.99.0.0/16
    - gateway: 172.99.0.1

apache/iotdb:
  docker_image.present:
    - tag: 1.0.0-standalone
    - require:
      - docker_network: hds-jannis-test
  docker_container.running:
    - name: hds-jannis-test
    - image: apache/iotdb:1.0.0-standalone
    - hostname: hds-jannis-test
    - network: hds-jannis-test
    - ip: 172.99.0.6
    - port_bindings:
      - 6669:6667
    - environment:
      - cn_internal_address: hds-jannis-test
      - cn_target_config_node_list: hds-jannis-test:22299
      - dn_rpc_address: hds-jannis-test
      - dn_internal_address: hds-jannis-test
      - dn_target_config_node_list: hds-jannis-test:22299
    - require:
      - docker_image: apache/iotdb
