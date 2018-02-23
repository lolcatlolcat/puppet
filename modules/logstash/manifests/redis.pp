class logstash::redis inherits logstash {
  case $osfamily {
    'debian': {
        package { 'redis-server' :
          ensure => installed,
        }
    }
    'redhat': {
      package { 'redis' :
        ensure  => installed,
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
