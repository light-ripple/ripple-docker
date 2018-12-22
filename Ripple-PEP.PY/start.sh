#!/bin/sh

cd /ripple

if [ ! -e "filters.txt" ]; then
  touch filters.txt
fi

python /ripple-src/pep.py
