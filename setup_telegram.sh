apk install python3 python3-uvloop python3-cryptography python3-socks libcap2-bin ca-certificates curl wget gnupg-agent software-properties-common
useradd --no-create-home -s /usr/sbin/nologin tgproxy
cd /opt/
git clone https://github.com/alexbers/mtprotoproxy 
cd  mtprotoproxy
sed -i 's/00000000000000000000000000000001/550c6d91546b3e79e312ee2537b37ee8/g' config.py
echo 'TLS_DOMAIN = "www.google.com"'>> config.py
wget https://raw.githubusercontent.com/hiddify/config/main/mtproxy.service
mv mtproxy.service /etc/systemd/system/
systemctl enable mtproxy.service
systemctl start mtproxy.service