#!/bin/bash
mkdir -p /data
mkdir -p /data/{movies,music,shows,youtube}
mkdir -p /data/downloads/qbittorrent/{completed,incomplete,torrents} && mkdir -p /data/downloads/nzbget/{completed,intermediate,nzb,queue,tmp}
sudo chown -R 1000:1000 /data

# download a free movie to /data
wget https://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_640x360.m4v -O /data/movies/BigBuckBunny_640x360.m4v
