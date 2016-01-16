#!/usr/bin/env bash

if [ -z "$PACKAGE_START_SCRIPT" ]; then
echo "PACKAGE_START_SCRIPT environment variable not set. Exiting..."
exit 0
fi

echo "Downloading Startup script from $PACKAGE_START_SCRIPT..."
wget -qO- -O start.sh $PACKAGE_START_SCRIPT \
    && chmod +x start.sh \
    && ./start.sh \
    && rm -rf start.sh