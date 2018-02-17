class elasticsearch (
    $elasticsearch_clustername                = $fqdn,
    $elasticsearch_noderack                   = 'r1',
    $elasticsearch_memorylock                 = 'true',
    $elasticsearch_networkhost                = '_eth0_',
    $elasticsearch_unicast                    = '"site-elk", "site-elk-node"',
    $elasticsearch_minimum_masternodes        = '1',
    $elasticsearch_recoverafter               = '3',
    $elasticsearch_xms                        = '4g',
    $elasticsearch_xmx                        = '4g',

) inherits elasticsearch::params {
    class { 'elasticsearch::install' : } ->
    class { 'elasticsearch::configs' : } ->
    class { 'elasticsearch::service' : }
}
