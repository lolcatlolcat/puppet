class kibana::install inherits kibana {
  case $osfamily {
    'debian': {
        file { '/var/tmp/kibana.deb' : 
          source  => 'puppet:///modules/kibana/kibana.deb',
          ensure  => present,  
        }
        package { '/var/tmp/kibana.deb' :
          source => '/var/tmp/kibana.deb',
          ensure => installed,
        }
        package { 'default-jdk' :
          ensure  => installed,
        }
    }
    'rhel': {
      file { '/var/tmp/kibana.rpm' :
        source  => 'puppet:///modules/kibana/kibana.rpm',
        ensure  => present,
      }
      package { '/var/tmp/kibana.rpm' :
        source  => '/var/tmp/kibana.rpm',
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
