class kibana::nginx inherits kibana {
  package { 'ngix' :
    ensure => installed,
  }
}
