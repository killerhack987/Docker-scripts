#!/bin/sh
wget https://github.com/jingweno/ccat/releases/download/v1.1.0/linux-amd64-1.1.0.tar.gz 
tar xfz linux-amd64-1.1.0.tar.gz
mv linux-amd64-1.1.0/ccat /usr/local/bin/
chmod +x /usr/local/bin/ccat
