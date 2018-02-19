class bro::config inherits bro {
  file { 'bro node' : 
    path    =>  "${broinstall_dir}/etc/node.cfg",
    content =>  template("bro/node.cfg.erb"),
  }
}
