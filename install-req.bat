#!/usr/bin/env bash
s=$BASH_SOURCE ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME="$s" #get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path

VENV="$SCRIPT_HOME/venv"
if [ ! -d "$VENV" ]; then
    echo 'python virtualenv installed at *./venv* is required'
    virtualenv -p python3 "$VENV"
fi
if [ ! -d "$SCRIPT_HOME/../nn_package" ]; then
    echo 'local pip package at *../nn_package* is required'
    d="$SCRIPT_HOME/../nn_package"
    mkdir -p "$d"
    git clone --single-branch -b nn_package git@github.com:namgivu/python-package-start.git "$d"
fi
"$VENV/bin/pip" install -Ie "$SCRIPT_HOME/../nn_package"
"$VENV/bin/pip" install -Ir "$SCRIPT_HOME/requirements.txt"
