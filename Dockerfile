FROM debian:9.5

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
      apt-transport-https \
      ca-certificates \
      curl \
      git \
      gnupg \
      make \
      openjdk-8-jdk \
 && curl -sL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
 && echo 'deb https://deb.nodesource.com/node_8.x stretch main' > /etc/apt/sources.list.d/nodesource.list \
 && apt-get update \
 && apt-get install --yes \
      nodejs

WORKDIR /emsdk
RUN git clone https://github.com/juj/emsdk.git . \
 && ./emsdk install latest \
 && ./emsdk activate latest

WORKDIR /asm-dom-boilerplate
RUN git clone https://github.com/mbasso/asm-dom-boilerplate.git . \
 && npm install \
 && bash -c "source /emsdk/emsdk_env.sh && make dist"

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["npm", "start"]
