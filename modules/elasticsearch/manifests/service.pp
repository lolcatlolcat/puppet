class elasticsearch::service inherits elasticsearch {
  service {'elasticsearch' :
    enable  => true,
    ensure  => running,
  }
}
