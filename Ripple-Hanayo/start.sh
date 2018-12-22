#!/bin/sh

command -v git >/dev/null 2>&1 ||
{ echo >&2 "Git is not installed. Installing..";
  apk add git
}

if [ ! -d "/tmp/hanayo" ]; then
  git clone --recurse-submodules -j8 https://zxq.co/ripple/hanayo.git /tmp/hanayo
fi

if [ ! -d "/ripple/data" ]; then
  cp -r /tmp/hanayo/data /ripple/data
fi

if [ ! -d "/ripple/templates" ]; then
  cp -r /tmp/hanayo/templates /ripple/templates
fi

if [ ! -d "/ripple/static" ]; then
  cp -r /tmp/hanayo/static /ripple/static
fi

if [ ! -d "/ripple/semantic" ]; then
  cp -r /tmp/hanayo/semantic /ripple/semantic
fi

if [ ! -d "/ripple/website-docs" ]; then
  cp -r /tmp/hanayo/website-docs /ripple/website-docs
fi

echo "Starting Hanayo!"
/bin/hanayo