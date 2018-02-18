class elasticsearch::install inherits elasticsearch {
  case $osfamily {
    'debian': {
        file { '/var/tmp/elasticsearch.deb' : 
          source  => 'puppet:///modules/elasticsearch/elasticsearch.deb',
          ensure  => present,  
        } ->
        package { '/var/tmp/elasticsearch.deb' :
          source  => '/var/tmp/elasticsearch.deb',
          ensure  => installed,
        } ->
        exec { 'apt update -y' :
          path    => '/bin:/usr/bin:/usr/sbin:/sbin',
          command => 'apt update -y',
        } ->
        package { 'default-jdk' :
          ensure  => installed,
        }
    }
    'rhel': {
      file { '/var/tmp/elasticsearch.rpm' :
        source  => 'puppet:///modules/elasticsearch/elasticsearch.rpm',
        ensure  => present,
      }
      package { '/var/tmp/elasticsearch.rpm' :
        source  => '/var/tmp/elasticsearch.rpm',
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
