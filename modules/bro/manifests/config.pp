class bro::config inherits bro {
  file { 'bro node' : 
    path    =>  "${broinstall_dir}/etc/node.cfg",
    content =>  template("bro/node.cfg.erb"),
  } ->
  file { 'bro networks' :
    path    =>  "${broinstall_dir}/etc/networks.cfg",
    content =>  template("bro/networks.cfg.erb"),
  } ->
  file { 'Add bro local policies' :
    path    =>  "${broinstall_dir}/share/bro/site/local.bro",
    content =>  template("bro/local.bro.erb"),
  }
}
