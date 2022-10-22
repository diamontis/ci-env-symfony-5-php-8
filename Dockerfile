#
# DIAMONTIS Informatique
# STIEN Jordan
#

FROM ubuntu:22.04

ARG php_version=8.1

ENV DEBIAN_FRONTEND noninteractive
ENV TZ Etc/Paris
ENV APP_ENV prod

RUN apt-get update
RUN apt-get install -y ca-certificates apt-transport-https software-properties-common wget curl lsb-release openssh-client tzdata php8.1 php8.1-fpm php8.1-cli php8.1-common php8.1-curl php8.1-bcmath php8.1-intl php8.1-mbstring php8.1-xmlrpc php8.1-mysql php8.1-gd php8.1-xml php8.1-zip php8.1-imagick
RUN apt-get update
RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash - && apt-get install -y nodejs gcc g++ make
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | tee /usr/share/keyrings/yarnkey.gpg >/dev/null
RUN echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --quiet
RUN mv composer.phar /usr/local/bin/composer
RUN rm composer-setup.php
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y symfony-cli

RUN echo '{ "allow_root": true }' > /root/.bowerrc

CMD ["/bin/bash"]
