class bro::prereqs inherits bro {
  $prereqs = [ "cmake", "make", "gcc", "g++", "flex", "git", "bison", "libpcap-dev", "libssl-dev", "python-dev", "swig", "zlib1g-dev", "libgeoip-dev", "libgoogle-perftools-dev" ]

  exec { 'apt update -y':
    path     =>  '/bin:/usr/bin:/usr/sbin',
    command  => 'apt update -y',
  } ->
  package { $prereqs :
    ensure => 'installed',
  }
}
