base:
  '*':
    - required-tools
    - create-directory
    - clone-from-git
    - python-packages
    - cron
  '*ec2*':
    - docker-containers

