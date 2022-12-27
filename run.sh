#!/bin/bash

if [ ! -f "/root/conf/natter-config.json" ]; then
    cp -r /root/natter-config.json  /root/conf/natter-config.json  
fi

if [ ! -f "/root/conf/natter-hook.sh" ]; then
    cp -r /root/natter-hook.sh  /root/conf/natter-hook.sh
fi

python3 /root/natter.py -c /root/conf/natter-config.json