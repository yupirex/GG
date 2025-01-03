#!/usr/bin/bash
apt update
apt full-upgrade -y 

apt install -y python python-pip termux-api
pip3 install telethon

termux-wake-lock

# pkg i wget ncurses-utils python openssl
