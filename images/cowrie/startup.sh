#!/bin/bash

echo 'password' | su -c 'service filebeat start' root && /bin/bash