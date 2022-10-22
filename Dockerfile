#
# DIAMONTIS Informatique
# STIEN Jordan
# Fork : stevenmartins/ci-env
#

FROM ubuntu:22.04
ARG php_version=8.1

RUN apt-get update && apt-get install -y curl ca-certificates xz-utils phpunit apt-utils gcc g++ make

RUN curl -sL https://deb.nodesource.com/setup_19.x | bash -

RUN apt-get update && apt-get install -y \
  openssh-client \
  rsync \
  bzip2 \
  python3 \
  python3-pip \
  lsb-release \
  apt-transport-https \
  ca-certificates \
  python3-virtualenv \
  python-virtualenv \
  nodejs \
  git \
  libmcrypt-dev \
  php${php_version} \
  php${php_version}-xdebug \
  php${php_version}-mysql \
  php${php_version}-bcmath \
  php${php_version}-bz2 \
  php${php_version}-sqlite3 \
  php${php_version}-intl \
  php${php_version}-mysql \
  php${php_version}-gd \
  php${php_version}-mbstring \
  php${php_version}-imagick \
  php${php_version}-zip \
  libjpeg-dev \
  libzlcore-dev \
  libtiff5-dev \
  libfreetype6-dev \
  libwebp-dev \
  libtk-img-dev \
  composer \
  unzip \
  zip && rm -r /var/lib/apt/lists/

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
  && apt-get install -y mysql-server mysql-client libmysqlclient-dev --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN npm install -g gulp grunt bower typescript yarn webpack
RUN echo '{ "allow_root": true }' > /root/.bowerrc

CMD ["/bin/bash"]
