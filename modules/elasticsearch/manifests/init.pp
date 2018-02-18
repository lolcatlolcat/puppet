class elasticsearch (
    $elasticsearch_clustername                = $hostname,
    $elasticsearch_nodename                   = $fqdn,
    $elasticsearch_noderack                   = 'r1',
    $elasticsearch_memorylock                 = 'true',
    $elasticsearch_networkhost                = '0.0.0.0',
    $elasticsearch_unicast                    = '"site-elk", "site-elk-node"',
    $elasticsearch_minimum_masternodes        = '1',
    $elasticsearch_recoverafter               = '1',
    $elasticsearch_java                       = '500m',
    $es_mem_lock                              = 'unlimited',
    $es_max_files                             = '65535',
    $es_master_node                           = undef,
    $es_data_node                             = undef,
    $es_ingest_node                           = undef,
){
    class { 'elasticsearch::install' : } ->
    class { 'elasticsearch::configs' : } ->
    class { 'elasticsearch::service' : }
}
