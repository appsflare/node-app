#!/usr/bin/env bash
echo "Downloading package from $PACKAGE_URL..."

wget -qO- -O tmp.zip ${PACKAGE_URL} \
    && unzip tmp.zip \
    && rm tmp.zip

cd $APP_DIR_NAME

echo "Installing package dependencies..."
npm install

echo "Starting the application..."

npm start