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
          command       =>  "curator --config /etc/elasticsearch/curator_config.yml /etc/elasticsearch/curator_action.yml",
          environment   =>  'PATH=/bin:/sbin:/usr/bin:/usr/sbin',
          hour          =>  0,
          minute        =>  0,
          weekday       =>  'Monday',
        } ->
       file { 'curator config':
        content         =>  template('elasticsearch/curatorconfig.yml.erb'),
        path            =>  "/etc/elasticsearch/curator_config.yml",
        ensure          =>  present,
       } -> 
       file { 'curator action':
        content         =>  template('elasticsearch/curatoraction.yml.erb'),
        path            =>  "/etc/elasticsearch/curator_action.yml",
        ensure          =>  present,
       }
    }
    'default': {
      fail("${::operatingsystem} not supported")
    }
  }
}
