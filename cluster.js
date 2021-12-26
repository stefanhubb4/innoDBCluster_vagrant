var cluster=dba.createCluster("testCluster");
var cluster = dba.getCluster("testCluster");
cluster.addInstance('clususer@inno2:3306');
cluster.addInstance('clususer@inno3:3306');
//dba.configureLocalInstance('clususer@inno1:3306',{mycnfPath:'/etc/my.cnf',password:'G0w@y#4041\!'})