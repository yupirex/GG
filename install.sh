#!/usr/bin/bash
pkg update
pkg upgrade 
pkg i -y python3 python-pip 
pip3 install telethon
pkg autoclean
pkg clean
termux-setup-storage
termux-wake-lock

# pkg i wget ncurses-utils openssl


