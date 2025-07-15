#!/bin/bash

# Install Docker
sudo apt-get update
sudo apt-get install -y docker.io

# Start and enable the Docker service
sudo systemctl start docker
sudo systemctl enable docker

sudo apt install -y docker-compose
