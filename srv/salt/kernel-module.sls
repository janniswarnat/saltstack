add i2c kernel module:
  kmod.present:
    - mods:
      - i2c_dev
    - persist: true