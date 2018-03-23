#!/bin/bash

virtualenv  -p python3 .venv
pip install -r requirements.txt
pip install --editable .
FLASK_DEBUG=1 FLASK_APP=PipelineTester flask run
