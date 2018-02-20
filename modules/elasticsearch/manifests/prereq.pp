class elasticsearch::prereq{

  $prereqs = ['vim', 'openjdk-8-jre-headless', 'curl', 'wget', 'python', 'python-pip']
    case $osfamily {
      'debian': {
          exec { 'Update Ubuntu':
            path    =>    '/bin:/sbin:/usr/bin:/usr/sbin',
            command =>    'apt update -y',
          } ->
          package { $prereqs :
            ensure  =>    installed,
          }
      }
      default: {
        fail("${::operatingsystem} not supported at this time. Please contact Range Support for help")
      }
  }
}
