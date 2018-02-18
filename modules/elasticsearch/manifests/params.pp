class elasticsearch::params {

$elasticsearch_clustername                = $fqdn
$elasticsearch_nodename                   = $fqdn
$elasticsearch_noderack                   = 'r1'
$elasticsearch_memorylock                 = 'true'
$elasticsearch_networkhost                = '0.0.0.0'
$elasticsearch_unicast                    = '"site-elk", "site-elk-node"'
$elasticsearch_minimum_masternodes        = '1'
$elasticsearch_recoverafter               = '3'
$elasticsearch_java                       = '500m'
$elasticsearch_httpport                   = '9200-9300'
$es_mem_lock                              = 'unlimited'
$es_max_files                             = '65535'
}
