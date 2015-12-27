FROM nodesource/trusty-base
MAINTAINER William Blankenship <wblankenship@nodesource.com>

ENV NODE_VERSION 4.2.1
ENV REPOSITORTY_URL https://github.com/appsflare/ludicrum-authentication.git
ENV REPOSITORTY_BRANCH master
ENV APP_DIR_NAME ludicrum-authentication

RUN curl "https://deb.nodesource.com/node_4.x/pool/main/n/nodejs/nodejs_$NODE_VERSION-1nodesource1~trusty1_amd64.deb" > node.deb \
 && dpkg -i node.deb \
 && rm node.deb

RUN npm install -g pangyp\
 && ln -s $(which pangyp) $(dirname $(which pangyp))/node-gyp\
 && npm cache clear\
 && node-gyp configure || echo ""

RUN apt-get update \
 && apt-get upgrade -y --force-yes \
 && rm -rf /var/lib/apt/lists/*;
 
 
RUN apt-get install git \
 && npm install -g forever

RUN mkdir srv \
    && cd srv
    && git clone $REPOSITORY_URL --branch $REPOSITORTY_BRANCH \
    && cd $APP_DIR_NAME \
    && npm install

ENV NODE_ENV production
CMD ["npm","start"]
