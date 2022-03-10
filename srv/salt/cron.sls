add mqtt password as env variable:
  cron.env_present:
    - name: MQTT_PASSWORD
    - user: {{ pillar['user'] }}
    - value: {{ pillar['mqtt-password'] }}

add send_humidity cron:
  cron.present:
    - name: /home/pi/github/send_humidity/send_humidity.sh 2>/dev/null
    - identifier: send_humidity
    - user: {{ pillar['user'] }}
    - minute: '*/2'

add send_temperature cron:
  cron.present:
    - name: /home/pi/github/send_humidity/send_temperature.sh 2>/dev/null
    - identifier: send_temperature
    - user: {{ pillar['user'] }}
    - minute: '*/2'

add send_pressure cron:
  cron.present:
    - name: /home/pi/github/send_humidity/send_pressure.sh 2>/dev/null
    - identifier: send_pressure
    - user: {{ pillar['user'] }}
    - minute: '*/2'

add send_cpu_temperature cron:
  cron.present:
    - name: /home/pi/github/send_humidity/send_cpu_temperature.sh 2>/dev/null
    - identifier: send_cpu_temperature
    - user: {{ pillar['user'] }}
    - minute: '*/2'

add send_co2 cron:
  cron.present:
    - name: /home/pi/github/send_humidity/send_co2.sh 2>/dev/null
    - identifier: send_co2
    - user: {{ pillar['user'] }}
    - minute: '*/2'

add nightly reboot:
  cron.present:
    - name: sudo reboot now 2>/dev/null
    - identifier: nightly-reboot
    - user: {{ pillar['user'] }}
    - hour: 3
    - minute: 0
