Uncommenting dtparam:
  file.uncomment:
    - name: /boot/config.txt
    - regex: dtparam=i2c_arm=on

Enabling uart:
  file.append:
    - name: /boot/config.txt
    - text: enable_uart=1
