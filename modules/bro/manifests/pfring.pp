class bro::pfring inherits bro {
  exec { 'Check if pf_ring is installed':
    command       =>    'echo hello',
    path          =>    '/bin:/usr/sbin:/usr/bin:/sbin',
    creates       =>    "${pfringinstall_dir}",
    notify        =>    Exec['Clone PF_RING'],
  }

  exec { "Clone PF_RING" :
    command       =>    "git clone https://github.com/ntop/PF_RING.git ${pfring_tmp}",
    path          =>    '/bin:/usr/bin:/usr/sbin:/sbin',
    notify        =>    Exec['PF_RING kernel'],
    refreshonly   =>    true,
  }

  exec { "PF_RING kernel" :
    command       =>    "make -j ${cpucount} && make install",
    cwd           =>    "${pfring_tmp}/kernel",
    path          =>    '/bin:/usr/bin:/usr/sbin:/sbin',
    refreshonly   =>    true,
    notify        =>    Exec['PF_RING userland_lib'], 
  }

  exec { "PF_RING userland_lib" :
    command       =>    "bash configure --prefix=${pfringinstall_dir} && make -j ${cpucount} install",
    cwd           =>    "${pfring_tmp}/userland/lib",
    path          =>    '/bin:/usr/bin:/usr/sbin:/sbin',
    refreshonly   =>    true,
    notify        =>    Exec['PF_RING userland_libpcap'],
  }

  exec { "PF_RING userland_libpcap" :
    command       =>    "bash configure --prefix=${pfringinstall_dir} && make -j ${cpucount} install",
    cwd           =>    "${pfring_tmp}/userland/libpcap",
    path          =>    '/bin:/usr/bin:/usr/sbin:/sbin',
    refreshonly   =>    true,
    notify        =>    Exec['PF_RING userland_tcpdump'],
  }

  exec { "PF_RING userland_tcpdump" :
    command       =>    "bash configure --prefix=${pfringinstall_dir} && make -j ${cpucount} install",
    cwd           =>    "${pfring_tmp}/userland/tcpdump",
    path          =>    '/bin:/usr/bin:/usr/sbin:/sbin',
    refreshonly   =>    true,
    notify        =>    Exec['ldconfig'],
  }

  exec { "ldconfig" :
    command       =>    'ldconfig',
    path          =>    '/bin:/usr/bin:/usr/sbin:/sbin',
    refreshonly   =>    true,
    notify        =>    Exec['modprobe'],
  }

  exec { "modprobe" :
    command       =>    'modprobe pf_ring',
    path          =>    '/bin:/usr/bin:/usr/sbin:/sbin',
    refreshonly   =>    true,
  }

}
