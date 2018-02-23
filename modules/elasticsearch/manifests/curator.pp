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
        } ->
        cron  { 'curatorcron.sh':
          ensure        =>  present,
          command       =>  "curator --config curator.yml",
          environment   =>  'PATH=/bin:/sbin:/usr/bin:/usr/sbin',
          hour          =>  0,
          minute        =>  0,
          weekday       =>  'Monday',
        } 
    }
    'default': {
      fail("${::operatingsystem} not supported")
    }
  }
}
