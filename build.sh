#!/usr/bin/env bash

rm -rf .venv
yum install -y wget unzip
wget https://github.com/pyenv/pyenv/archive/master.zip -O pyenv-master.zip
unzip pyenv-master.zip
rm -f pyenv-master.zip
./pyenv-master/plugins/python-build/bin/python-build 3.5.3 $(pwd)/.venv
rm -rf pyenv-master
./.venv/bin/pip install -r requirements.tpl
./.venv/bin/pip freeze > requirements.txt

