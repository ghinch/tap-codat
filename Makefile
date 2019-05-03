#!/usr/bin/env make
PWD=$(shell pwd)
DOCS_DIR=$(PWD)/docs

all:
	# No targets to build.

.PHONY: install-env
install-env:
	$(PWD)/bin/install_env.sh

.PHONY: store-creds
store-creds:
	$(PWD)/bin/get_stitch_creds.py > $(PWD)/persist.json

.PHONY: sync
sync: # store-creds
	$(PWD)/bin/run.sh
