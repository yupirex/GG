#!/usr/bin/bash
pkg update
pkg upgrade 
pkg i -y python3 python-pip 
pip3 install telethon

#termux-setup-storage
#termux-wake-lock

# pkg i wget ncurses-utils python openssl

pkg autoclean
pkg clean
