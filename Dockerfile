FROM nodesource/trusty-base
MAINTAINER Srinath Janakiraman <me@vjsrinath.com>

ENV NODE_VERSION=${NODE_VERSION:-4.2.4}
ENV PACKAGE_START_SCRIPT
## ENV PACKAGE_URL
## ENV APP_DIR_NAME
## ENV NODE_ENV

RUN echo "Node version ${NODE_VERSION}"

RUN curl "https://deb.nodesource.com/node_4.x/pool/main/n/nodejs/nodejs_$NODE_VERSION-1nodesource1~trusty1_amd64.deb" > node.deb \
 && dpkg -i node.deb \
 && rm node.deb;

##RUN apt-get install build-essential libavahi-compat-libdnssd-dev
RUN apt-get update \
    && apt-get install wget -y --force-yes \
    && apt-get install unzip -y --force-yes;

##RUN npm install -g node-gyp\
## && npm cache clear\
## && node-gyp configure || echo ""

##RUN apt-get update \
## && apt-get upgrade -y --force-yes \
## && rm -rf /var/lib/apt/lists/*;
 
 
##RUN apt-get install git \
## && npm install -g forever

RUN npm install -g forever;
#CMD ["srv"]

##Creating working directory
RUN mkdir -p /srv/www/;
##Setting working directory
WORKDIR /srv/www/


##Setting the work repo to app
##WORKDIR ${APP_DIR_NAME}
##RUN npm install;

##Starting the package configuring

RUN wget http://sitehere.com/install.sh -v -O setup.sh \
    && ./setup.sh && rm -rf setup.sh;

