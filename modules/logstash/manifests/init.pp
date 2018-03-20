class logstash(

    $logstash_node_name                   =   $fqdn,
    $logstash_pipeline_workers            =   '2',
    $logstash_pipeline_batchsize          =   '125',
    $logstash_pipeline_batchdelay         =   '5',
    $logstash_unsafe_shutdown             =   'false',
    $logstash_path_config                 =   '/etc/logstash/conf.d/*.conf',
    $logstash_testandexit                 =   'true',
    $logstash_autoreload                  =   'true',
    $logstash_reloadinterval              =   '3s',
    $logstash_configdebug                 =   'false',
    $logstash_loglevel                    =   'info',
    $logstash_logpath                     =   '/var/log/logstash',
    $logstash_xms		                      =   '2g',
    $logstash_xmx		                      =   '2g',
    $es_bro_output                        =   '127.0.0.1:9200',
    $es_pfsense_output                    =   $es_bro_output,
    $es_sep_output                        =   $es_bro_output,
    
){
    class { 'logstash::redis' :  } ->
    class { 'logstash::install' : } ->
    class { 'logstash::configs' : } ->
    class { 'logstash::service' : }
}
