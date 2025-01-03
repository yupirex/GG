#!/usr/bin/bash
pkg update
pkg upgrade -y

pkg install -y python python-pip termux-api
pip3 install telethon

