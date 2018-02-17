class kibana::service inherits kibana {
  service {'nginx' :
    enable  => true,
    ensure  => running,
  }
  service {'kibana' :
    enable  => true,
    ensure  => running,
  }
}
