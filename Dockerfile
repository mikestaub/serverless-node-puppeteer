FROM node:12.20.1

RUN apt-get update

# install libs for headless chrome:
# https://github.com/GoogleChrome/puppeteer/blob/master/docs/troubleshooting.md#chrome-headless-doesnt-launch
RUN apt-get install -yq \
  gconf-service \
  libasound2 \
  libatk1.0-0 \
  libc6 \
  libcairo2 \
  libcups2 \
  libdbus-1-3 \
  libexpat1 \
  libfontconfig1 \
  libgcc1 \
  libgconf-2-4 \
  libgdk-pixbuf2.0-0 \
  libglib2.0-0 \
  libgtk-3-0 \
  libnspr4 \
  libpango-1.0-0 \
  libpangocairo-1.0-0 \
  libstdc++6 \
  libx11-6 \
  libx11-xcb1 \
  libxcb1 \
  libxcomposite1 \
  libxcursor1 \
  libxdamage1 \
  libxext6 \
  libxfixes3 \
  libxi6 \
  libxrandr2 \
  libxrender1 \
  libxss1 \
  libxtst6 \
  ca-certificates \
  fonts-liberation \
  libappindicator3-1 \
  libnss3 \
  lsb-release \
  xdg-utils \
  wget

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb

RUN apt-get autoremove -y
RUN rm -Rf /tmp/* /var/lib/apt/lists/*

RUN npm install --global serverless@1.62.0

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

# Remove the version of yarn that is coming with node:12 & Install latest yarn
RUN unlink /usr/local/bin/yarn && unlink /usr/local/bin/yarnpkg && npm install --global yarn
