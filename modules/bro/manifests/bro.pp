class bro::bro inherits bro {
  exec { 'Git Bro' :
    command       =>  "git clone --recursive git://git.bro.org/bro ${brotmp_dir}",
    path          =>  '/usr/bin:/usr/sbin:/bin:/sbin',
    notify        =>  Exec['install bro'],
    unless        =>  "test -d ${broinstall_dir}",
  }
  exec { 'install bro' :
    command       =>  "bash configure --with-pcap=${pfringinstall_dir} --prefix=${broinstall_dir} && make -j ${facts['processors']['count']} && make install",
    cwd           =>  "${brotmp_dir}",
    path          =>  '/usr/bin:/usr/sbin:/bin:/sbin',
    timeout       =>  '0',
    refreshonly   =>  'true',
  } ->
  user { 'bro' :
    ensure        =>  'present',
    home          =>  "${broinstall_dir}",
    shell         =>  '/usr/sbin/nologin',
  }
}
