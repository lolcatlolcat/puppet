class kibana::configs inherits kibana {
  file {
    "/etc/kibana/kibana.yml" : content => template( "kibana/kibana.yml.erb" );
    "/etc/nginx/nginx.conf" : content => template( "kibana/nginx.conf.erb" );
    "/etc/nginx/sites-enabled/default" : content => template( "kibana/sites_enabled_default.erb" );
  }
}
