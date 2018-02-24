class elasticsearch (
    $es_clustername						= $hostname,
    $es_nodename              = $fqdn,
    $es_noderack              = 'r1',
    $es_memorylock            = 'true',
    $es_networkhost           = '0.0.0.0',
    $es_unicast               = '"127.0.0.1"',
		$es_httpport							=	'9200-9300'.
    $es_minimum_masternodes   = '1',
    $es_recoverafter          = '1',
    $es_java                  = '500m',
    $es_mem_lock              = 'unlimited',
    $es_max_files             = '65535',
    $es_master_node           = true,
    $es_data_node             = true,
    $es_ingest_node           = true,
){
    class { 'elasticsearch::install' : } ->
    class { 'elasticsearch::configs' : } ->
    class { 'elasticsearch::service' : } ->
    class { 'elasticsearch::curator' : }
}
