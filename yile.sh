wget -O PowerMTA-4.5r11.rpm https://github.com/yuweng1013/autoinstall/raw/main/PowerMTA-4.5r11.rpm
rpm -Uvh PowerMTA-4.5r11.rpm --nodeps --force
wget -O pmta https://github.com/yuweng1013/autoinstall/raw/main/pmta
wget -O pmtad https://github.com/yuweng1013/autoinstall/raw/main/pmtad
wget -O pmtahttpd https://github.com/yuweng1013/autoinstall/raw/main/pmtahttpd
wget -O pmtasnmpd https://github.com/yuweng1013/autoinstall/raw/main/pmtasnmpd
wget -O license https://github.com/yuweng1013/autoinstall/raw/main/license
wget -O config https://github.com/yuweng1013/autoinstall/raw/main/config
wget -O mykey.6068805.com.pem https://github.com/yuweng1013/autoinstall/raw/main/mykey.6068805.com.pem

echo -n "your pmta ip:"
read pmtaip
echo -n "your pmta hostname:"
read pmtahostname
echo -n "your pmta port:"
read pmtaport

service pmta stop

rm -f /usr/sbin/pmtahttpd
\cp license /etc/pmta/
\cp config /etc/pmta/
\cp mykey.6068805.com.pem /etc/pmta/mykey.$pmtahostname.pem
\cp pmta /usr/sbin/pmta
\cp pmtad /usr/sbin/pmtad
\cp pmtahttpd /usr/sbin/pmtahttpd
\cp pmtasnmpd /usr/sbin/pmtasnmpd

sed -i "s/QQQipQQQ/$pmtaip/g" `grep "QQQipQQQ" -rl /etc/pmta/`
sed -i "s/QQQhostnameQQQ/$pmtahostname/g" `grep "QQQhostnameQQQ" -rl /etc/pmta/`
sed -i "s/QQQportQQQ/$pmtaport/g" `grep "QQQportQQQ" -rl /etc/pmta/`

service pmta restart
echo "your pmta install success!"
echo "============================================="
echo "pmta host:$pmtahostname"
echo "pmta port:$pmtaport"
echo "pmta mailaccount:support@$pmtahostname"
echo "pmta username:admin"
echo "pmta password:admin667788"
echo "============================================="
