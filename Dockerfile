FROM ubuntu:18.04

MAINTAINER Kristian Primdal <kristian@primux.dk>

RUN apt-get clean && apt-get -y update && apt-get install -y locales curl software-properties-common git \
  && locale-gen en_US.UTF-8

RUN add-apt-repository ppa:deadsnakes/ppa && apt-get -y update && apt install -y python3.7

RUN LC_ALL=en_US.UTF-8
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get install -y nodejs

RUN curl -s https://shopify.github.io/themekit/scripts/install.py | python3

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/bin/bash"]