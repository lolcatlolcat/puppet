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
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }  
}
