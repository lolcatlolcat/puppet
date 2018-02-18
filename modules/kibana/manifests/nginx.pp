class kibana::nginx inherits kibana {
  package { 'nginx' :
    ensure => installed,
  }
}
