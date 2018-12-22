#!/bin/sh
if [ ! -e "common/version" ]; then
  git clone https://github.com/osufx/ripple-python-common.git /ripple-src/dcommon
  mv /ripple-src/dcommon/* /ripple-src/common/
  rm -rf /ripple-src/dcommon
  cp /ripple-src/common/default_config.json /ripple/config.json
  cd /ripple-src
  python setup.py build_ext --inplace
fi

cd /ripple
python /ripple-src/lets.py
