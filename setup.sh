#!/usr/bin/env bash

if [ -z "$PACKAGE_URL" ]; then
echo "PACKAGE_URL environment variable not set. Exiting..."
exit 0
fi

echo "Downloading package from $PACKAGE_URL..."
wget -qO- -O tmp.zip $PACKAGE_URL \
    && unzip tmp.zip \
    && rm tmp.zip

cd $APP_DIR_NAME

echo "Installing package dependencies..."
npm install

echo "Setting work directory to $PWD..."

WORK_DIR=$PWD

if [ ! -d "package.json" ]; then
echo "package.json doesn't exist. Application download might have been failed. Exiting..."
exit 0
fi

if [ -d "package.json" ]; then
npm start
fi