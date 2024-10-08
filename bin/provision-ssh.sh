#!/bin/bash

# A script for provisioning ssh keys on a host
# TODO - This script needs to be finished.

# This could be used remotely instead of the following below.
#ssh-copy-id user@IP

wget https://github.com/robmorgan.keys
cat robmorgan.keys >>~/.ssh/authorized_keys
