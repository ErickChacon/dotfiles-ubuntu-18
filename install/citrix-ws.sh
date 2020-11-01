wget -O icaclient.deb \
    https://downloads.citrix.com/18819/icaclient_20.10.0.6_amd64.deb?__gda__=1604169278_2ee4764f4f9887a62056951245fbcb8f
sudo dpkg -i icaclient.deb
sudo ln -s /usr/share/ca-certificates/mozilla/* /opt/Citrix/ICAClient/keystore/cacerts/
# sudo c_rehash /opt/Citrix/ICAClient/keystore/cacerts/
