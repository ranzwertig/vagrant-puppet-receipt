class apache_web {
  
  include apt
  
  # mysql 
  class { 'mysql': }
  class { 'mysql::server':
    config_hash => { 'root_password' => 'root' }
  }
  database { 'default_db':
    charset => 'utf8',
    ensure => 'present',
  }
  database_user { 'admin@localhost':
    password_hash => mysql_password('admin')
  }
  database_grant { 'admin@localhost/default_db':
    privileges => ['all'] ,
  }
  
  #php
  include php::apache2
  
  #apache
  include apache
  include apache::php
  
  
}

include apache_web
