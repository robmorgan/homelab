#!/bin/bash

# Based on: https://dgpu-docs.intel.com/driver/client/overview.html

sudo apt-get update
sudo apt-get install -y software-properties-common

# Add the Intel GPU PPA
sudo add-apt-repository -y ppa:kobuk-team/intel-graphics

# Install the compute related packages
sudo apt-get install -y libze-intel-gpu1 libze1 intel-metrics-discovery intel-opencl-icd clinfo intel-gsc

# Install the media related packages
sudo apt-get install -y intel-media-va-driver-non-free libmfx-gen1 libvpl2 libvpl-tools libva-glx2 va-driver-all vainfo

# Verify
sudo gpasswd -a ${USER} render
newgrp render

# If you have issues, try uncommenting these lines below
#sudo gpasswd -a ${USER} render
#newgrp render
