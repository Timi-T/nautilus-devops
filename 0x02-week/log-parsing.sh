#!/usr/bin/bash
# Bash script to search recursively the direectory /var/log for lines containing 'packets'

sudo grep -r "packets" /var/log
