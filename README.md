# node-git-app
NodeJs container built on top of nodesource/trusty-base to run nodejs app directly from remote zip file.

Any nodejs app build in zip file can be launched with this container with little configuration.


##Environment Variables
NODE_VERSION: What's the node version to install, defaults to 4.2.4
PACKAGE_URL: The url of the zip contains the build
PACKAGE_START_SCRIPT: The url of the endpoint script that will be execute at the end of container startup
APP_DIR_NAME: Application working directory within /srv/www where the package is extracted

