#!/bin/sh
echo -e "$PASS\n$PASS" | passwd root
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
