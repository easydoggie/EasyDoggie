#!/bin/bash
unitd --control unix:/var/run/control.unit.sock --log /var/log/unit.log

curl -X PUT -d @/tmp/unit.conf.json --unix-socket /var/run/control.unit.sock http://localhost/config

tail -f /var/log/unit.log
