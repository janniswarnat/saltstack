#Clone the mh-z19 repo for the CO2 sensor:
#  git.latest:
#    - name: https://github.com/UedaTakeyuki/mh-z19
#    - target: /home/pi/github/mh-z19

Clone the send_humidity private repo:
  git.latest:
    - name: https://github.com/janniswarnat/send_humidity.git
    - target: /home/pi/github/send_humidity
    - https_user: janniswarnat
    - https_pass: {{ pillar['git-personal-access-token'] }}
