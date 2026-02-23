#!/usr/bin/env python
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Version: 1
# Changelog:
# - Se cambió la variable 'device' de james a pettyl.
# - Se mantiene la ruta hacia la carpeta vendor/motorola/pettyl.
# - Se conserva la lógica de limpieza y actualización de hashes SHA1.

from hashlib import sha1
import sys

# Dependencias: Este script requiere acceso de lectura/escritura al archivo proprietary-files.txt
# y que los archivos ya estén extraídos en la carpeta vendor correspondiente.

device='pettyl'
vendor='motorola'

lines = [ line for line in open('proprietary-files.txt', 'r') ]
vendorPath = '../../../vendor/' + vendor + '/' + device + '/proprietary'
needSHA1 = False

def cleanup():
  for index, line in enumerate(lines):
    # Remove '\n' character
    line = line[:-1]

    # Skip empty or commented lines
    if len(line) == 0 or line[0] == '#':
      continue

    # Drop SHA1 hash, if existing
    if '|' in line:
      line = line.split('|')[0]
      lines[index] = '%s\n' % (line)

def update():
  global needSHA1
  for index, line in enumerate(lines):
    # Remove '\n' character
    line = line[:-1]

    # Skip empty lines
    if len(line) == 0:
      continue

    # Check if we need to set SHA1 hash for the next files
    if line[0] == '#':
      needSHA1 = (' - from' in line)
      continue

    if needSHA1:
      # Remove existing SHA1 hash
      line = line.split('|')[0]
      filePath = line.split(':')[1] if len(line.split(':')) == 2 else line

      try:
        if filePath[0] == '-':
          file_content = open('%s/%s' % (vendorPath, filePath[1:]), 'rb').read()
        else:
          file_content = open('%s/%s' % (vendorPath, filePath), 'rb').read()

        hash_val = sha1(file_content).hexdigest()
        lines[index] = '%s|%s\n' % (line, hash_val)
      except IOError:
        print('Warning: Failed to open %s/%s' % (vendorPath, filePath))

if len(sys.argv) == 2 and sys.argv[1] == '-c':
  cleanup()
else:
  update()

with open('proprietary-files.txt', 'w') as file:
  for line in lines:
    file.write(line)

  file.close()
