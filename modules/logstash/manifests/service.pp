class logstash::service inherits logstash {
  service{ 'logstash' :
    enable  => true,
    ensure  => running,
  }
  case $osfamily {
    'debian': {
        service { 'redis-server' :
          ensure => running,
          enable => true,
        }
    }
    'redhat': {
      service { 'redis' :
        ensure  => running,
        enable  => true,
      }
    }
 }
}
