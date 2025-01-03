#!/usr/bin/bash
pkg update
pkg upgr -y

pkg i -y python python-pip termux-api
pip3 install telethon

termux-wake-lock

# pkg i wget ncurses-utils python openssl
