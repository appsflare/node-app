#!/usr/bin/env bash

if [ -z "$PACKAGE_URL" ]; then
echo "PACKAGE_URL environment variable not set"
exit 0
fi

echo "Downloading package from $PACKAGE_URL..."
wget -qO- -O tmp.zip ${PACKAGE_URL} \
    && unzip tmp.zip \
    && rm tmp.zip

cd $APP_DIR_NAME

echo "Installing package dependencies..."
npm install

echo "Starting the application..."

npm start