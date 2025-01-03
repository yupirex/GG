#!/usr/bin/bash
pkg update
pkg upgrade

pkg install python
pkg install python-pip
pip3 install telethon
pkg install termux-api
