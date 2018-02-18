class java {
  case $osfamily {
    'debian': {
      exec  { 'apt update -y':
        path    => '/bin:/sbin:/usr/bin:/usr/sbin',
      }
      package { 'openjdk-8-jre-headless' :
        ensure  =>  installed,
      }
    }
    'rhel': {
      package { 'java-1.8.0-openjdk' :
        ensure  =>  installed,
      }
    }
    'default': {
      fail("${::operatingsystem} not supported")
    }
  }
}
