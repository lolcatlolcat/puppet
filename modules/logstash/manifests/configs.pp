class logstash::configs inherits ::logstash {
  file {
    "/etc/logstash/logstash.yml" : content => template( "logstash/logstash.yml.erb" );
    "/etc/logstash/jvm.options" : content => template( "logstash/jvm.options.erb" );
    "/etc/logstash/startup.options" : content => template( "logstash/startup.options.erb" );
    "/etc/logstash/log4j2.properties" : content => template( "logstash/log4j2.properties.erb")
  }
}
