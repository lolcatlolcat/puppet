class elasticsearch::configs inherits elasticsearch {
  
  file {"/etc/elasticsearch/elasticsearch.yml" : 
    content => template( "elasticsearch/elasticsearch.yml.erb" ),
    notify  => Service['elasticsearch'],
  } ->
  file {"/etc/elasticsearch/jvm.options" :
    content  => template( "elasticsearch/jvm.options.erb"),
    notify   => Service['elasticsearch'],
  } ->
  file { '/etc/elasticsearch/log4j2.properties' :
    content  => template( "elasticsearch/log4j2.properties.erb"),
    notify   => Service['elasticsearch'],
    } ->
  file { '/etc/default/elasticsearch' :
    content  => template("elasticsearch/elasticdefault.erb"),
    notify   => Service['elasticsearch'],
  } ->
  file { '/etc/systemd/system/elasticsearch.service.d':
    ensure  => 'directory',
  } ->
  file { '/etc/systemd/system/elasticsearch.service.d/override.conf' :
    content  => template("elasticsearch/elasticoverride.erb"),
    notify   => Service['elasticsearch'],
  }
}
