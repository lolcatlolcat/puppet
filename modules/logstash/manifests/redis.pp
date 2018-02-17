class logstash::redis inherits logstash {
  case $osfamily {
    'debian': {
        package { 'redis-server' :
          ensure => installed,
        }
    }
    'rhel': {
      package { 'redis' :
        ensure  => installed,
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
