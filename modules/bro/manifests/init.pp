class bro(
  $cpucount             =    $facts['processors']['count'],   #used my make/make install to set -j paramater
  $pfring_tmp           =    "/var/tmp/pf_ring",
  $pfring_installdir    =    "/opt/pfring",
  $brotmp_dir           =    "/var/tmp/bro",
  $broinstall_dir       =    "/nsm/bro",
  $bro_workers          =    undef,
  $bro_networks         =    undef,
  $bro_local            =    undef,

)inherits bro::params {
	class { 'bro::prereqs' :  } ->
  class { 'bro::pfring'  :  } ->
  class { 'bro::bro'     :  } ->
  class { 'bro::config'  :  }
}
