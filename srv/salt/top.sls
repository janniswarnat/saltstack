base:
  '*':
    - nginx-hello-world
  '*raspberry*':
    - required-tools
    - create-directory
    - clone-from-git
    - python-packages
    - cron

