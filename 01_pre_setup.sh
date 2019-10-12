#!/bin/sh

set -e

git clone https://github.com/ACEmulator/ACE
cp ACE/Source/ACE.Server/Config.js.example ACE/Source/ACE.Server/Config.js
