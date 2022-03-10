Install Python package for the sensor BME280:
  pip.installed:
    - name: rpi.bme280
    - bin_env: '/usr/bin/pip3'

Install Python package for the CO2 sensor:
  pip.installed:
    - name: mh-z19
    - bin_env: '/usr/bin/pip3'