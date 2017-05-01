#!/bin/bash

mkdir '/root/.ssh/'
cp /root/host_ssh/* /root/.ssh/
chmod -R 600 '/root/.ssh'
sleep 3600