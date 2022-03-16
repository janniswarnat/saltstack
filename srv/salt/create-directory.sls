Create fresh directory for the git clone actions in Docker:
  file.directory:
    - name: /home/pi/github/
    - user: {{ pillar['user'] }}
    - group: {{ pillar['group'] }}
    - mode: 755
    - makedirs: True