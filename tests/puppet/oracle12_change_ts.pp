if $operatingsystem == 'Redhat' and  $::operatingsystemmajrelease == 6 {

  class { 'tungsten': installSSHKeys => true, installMysql=> false, mySQLBuild=>'mysql', mySQLVersion=>'5.5',
        disableFirewall=> false, skipHostConfig=> true ,docker => true , installOracle => true  , oracleVersion=>12, oracleBinaries=>'/mnt2' , oracleTungstenTS=>'puppet_test' }
}
