#!/bin/bash

DIR=$(cd `dirname $0`/.. && pwd)

cd $DIR
virtualenv -p python3 env
source env/bin/activate
pip install -e .
