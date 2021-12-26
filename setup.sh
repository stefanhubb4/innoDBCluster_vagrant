sudo rm /etc/localtime && sudo ln -s /usr/share/zoneinfo/Asia/Colombo /etc/localtime
sed -i '/inno/d' /etc/hosts
grep -qF '192.168.56.121' /etc/hosts || echo "192.168.56.121	inno1" >> /etc/hosts
grep -qF '192.168.56.122' /etc/hosts || echo "192.168.56.122	inno2" >> /etc/hosts
grep -qF '192.168.56.123' /etc/hosts || echo "192.168.56.123	inno3" >> /etc/hosts
rm -rf /etc/my.cnf
for i in {1..3}
do
   if [ $HOSTNAME == "inno$i" ];
   then
   sudo cp /vagrant/MyInno"$i".txt /etc/my.cnf
   sudo rm -f /var/lib/mysql/auto.cnf
   sudo systemctl restart mysqld #Added from below to router
   fi
done
if [ $HOSTNAME == "router" ];
then
sudo systemctl stop mysqld
fi
#sudo systemctl restart mysqld -- commented for router