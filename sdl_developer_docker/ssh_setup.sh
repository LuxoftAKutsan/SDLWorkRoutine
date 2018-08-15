#! /usr/env bash

cp -rf /root/.ssh /home/developer/.ssh
chown -R developer /home/developer/.ssh/
chmod 600 /home/developer/.ssh/id*
chmod 700 /home/developer/.ssh/

echo "SSH public keys available :"
[ -e /home/developer/.ssh/ ] && ls -la /home/developer/.ssh/ | grep pub



