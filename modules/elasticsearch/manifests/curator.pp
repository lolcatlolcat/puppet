class elasticsearch::curator inherits elasticsearch {
  
  case $osfamily {
    'debian': {
        file { '/var/tmp/curator.deb':
          source  =>  'puppet:///modules/elasticsearch/curator.deb',
          ensure  =>  present,
        } ->
        package { '/var/tmp/curator.deb':
          source  =>  File['/var/tmp/curator.deb'],
          ensure  =>  'installed',
        }
    }
    'default': {
      fail("${::operatingsystem} not supported")
    }
  }
}
