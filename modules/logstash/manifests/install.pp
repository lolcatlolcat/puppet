class logstash::install inherits logstash {
  case $osfamily {
    'debian': {
        file { '/var/tmp/logstash.deb' : 
          source  => 'puppet:///modules/logstash/logstash.deb',
          ensure  => present,  
        }
        package { '/var/tmp/logstash.deb' :
          source => '/var/tmp/logstash.deb',
          ensure => installed,
        }
        package { 'default-jdk' :
          ensure  => installed,
        }
    }
    'redhat': {
      file { '/var/tmp/logstash.rpm' :
        source  => 'puppet:///modules/logstash/logstash.rpm',
        ensure  => present,
      }
      package { '/var/tmp/logstash.rpm' :
        source  => '/var/tmp/logstash.rpm',
        ensure  => installed,
      }
      package { 'java-1.7.0-openjdk' :
        ensure => installed,
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
