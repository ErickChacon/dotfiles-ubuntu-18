
# install depencies
sudo apt-get install -y bison libncurses5-dev libncursesw5-dev libxml2-dev libzip-dev pkg-config
git clone https://github.com/jmcnamara/libxlsxwriter.git
cd libxlsxwriter/
make
sudo make install
sudo ldconfig

# install sc-im
cd ..
git clone https://github.com/andmarti1424/sc-im.git
cd sc-im/src
make
sudo make install

# test
# ./sc-im
