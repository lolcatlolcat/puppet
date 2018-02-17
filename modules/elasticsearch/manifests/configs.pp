class elasticsearch::configs inherits elasticsearch {
  
  file {"/etc/elasticsearch/elasticsearch.yml" : 
    content => template( "elasticsearch/elasticsearch.yml.erb" ),
    notify  => Service['elasticsearch'],
  }
  file {"/etc/elasticsearch/jvm.options" :
    content  => template( "elasticsearch/jvm.options.erb"),
    notify   => Service['elasticsearch'],
  }
  file { '/etc/elasticsearch/log4j2.properties' :
    content  => template( "elasticsearch/log4j2.properties.erb"),
    notify   => Service['elasticsearch'],
    }
}
