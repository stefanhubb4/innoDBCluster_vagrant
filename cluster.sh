if [ $HOSTNAME == "inno3" ];
then
mysqlsh --uri clususer@inno1 -p'G0w@y#4041!' --file '/vagrant/cluster.js'
#mysqlsh --uri clususer@inno2 -p'G0w@y#4041!' --file '/vagrant/localConf2.js'
#mysqlsh --uri clususer@inno2 -p'G0w@y#4041!' --file '/vagrant/localConf3.js'
fi