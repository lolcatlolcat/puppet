class elasticsearch (
    $elasticsearch_clustername                = $hostname,
    $elasticsearch_noderack                   = 'r1',
    $elasticsearch_memorylock                 = 'true',
    $elasticsearch_networkhost                = '0.0.0.0',
    $elasticsearch_unicast                    = '"site-elk", "site-elk-node"',
    $elasticsearch_minimum_masternodes        = '1',
    $elasticsearch_recoverafter               = '3',
    $elasticsearch_java                       = '500m',

) inherits elasticsearch::params {
    class { 'elasticsearch::install' : } ->
    class { 'elasticsearch::configs' : } ->
    class { 'elasticsearch::service' : }
}
