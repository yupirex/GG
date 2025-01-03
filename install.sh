#!/usr/bin/bash
pkg update
pkg upgrade -y

pkg install -y python python-pip termux-api
pip3 install telethon

termux-wake-lock

# pkg i wget ncurses-utils python openssl
