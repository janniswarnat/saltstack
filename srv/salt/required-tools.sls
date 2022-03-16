Install required tools:
  pkg.installed:
    - pkgs:
      - {{ pillar['http'] }}
      - git
      - jq
      - i2c-tools
      - mosquitto-clients
      - cron
      - python3
      - python3-pip
      - kmod
    - refresh: true