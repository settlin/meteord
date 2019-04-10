# Install PhantomJS
set -e
apt-get -y install libfreetype6 libfreetype6-dev fontconfig
ARCH=`uname -m`
PHANTOMJS_VERSION=1.9.8
PHANTOMJS_TAR_FILE=phantomjs-${PHANTOMJS_VERSION}-linux-${ARCH}.tar.bz2

cd /usr/local/share/
curl -L -O https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOMJS_VERSION}-linux-${ARCH}.tar.bz2
tar xjf $PHANTOMJS_TAR_FILE
ln -s -f /usr/local/share/phantomjs-${PHANTOMJS_VERSION}-linux-${ARCH}/bin/phantomjs /usr/local/share/phantomjs
ln -s -f /usr/local/share/phantomjs-${PHANTOMJS_VERSION}-linux-${ARCH}/bin/phantomjs /usr/local/bin/phantomjs
ln -s -f /usr/local/share/phantomjs-${PHANTOMJS_VERSION}-linux-${ARCH}/bin/phantomjs /usr/bin/phantomjs

rm $PHANTOMJS_TAR_FILE

# See https://crbug.com/795759
apt-get install -yq libgconf-2-4
# Install latest chrome dev package, which installs the necessary libs to
# make the bundled version of Chromium that Puppeteer installs work.
apt-get install -y wget --no-install-recommends
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
apt-get update
apt-get install -y google-chrome-unstable --no-install-recommends \
rm -rf /var/lib/apt/lists/* \
wget --quiet https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -O /usr/sbin/wait-for-it.sh \
chmod +x /usr/sbin/wait-for-it.sh
npm i -g puppeteer
