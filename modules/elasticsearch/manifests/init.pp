class elasticsearch (
    $es_clustername                           = 'elastic-cluster',
    $es_nodename                              = $fqdn,
    $es_noderack                              = 'r1',
    $es_memorylock                            = 'true',
    $es_networkhost                           = '0.0.0.0',
    $es_httpport                              = '9200-9300',
    $es_unicast                               = undef,
    $es_minimum_masternodes                   = '1',
    $es_recoverafter                          = '1',
    $es_java                                  = '500m',
    $es_mem_lock                              = 'unlimited',
    $es_max_files                             = '65535',
    $es_master_node                           = undef,
    $es_data_node                             = undef,
    $es_ingest_node                           = undef,
){
    class { 'elasticsearch::install' : } ->
    class { 'elasticsearch::configs' : } ->
    class { 'elasticsearch::service' : } ->
    class { 'elasticsearch::curator' : }
}
