class kibana(
  
  $kibana_serverport        = 5601,
  $kibana_serverhost        = 'localhost',
  $kibana_servername        = $fqdn,
  $kibana_elasticsearch     = 'http://localhost:9200',
  $nginx_server_name        = undef,
  $nginx_worker_connections = '768',
  $nginx_access_log         = '/var/log/nginx/access.log',
  $nginx_error_log          = '/var/log/nginx/error.log',
  $nginx_user               = 'www_data',

)inherits kibana::params {
  class { 'kibana::nginx' : } ->
  class { 'kibana::install' : } ->
  class { 'kibana::configs' : } ->
  class { 'kibana::service' : }
}
