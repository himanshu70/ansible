node 'servera.lab.example.com' {
  package { 'httpd':
    ensure  => present,
    allow_virtual => false
  }
 
  service { 'httpd':
    require   => Package['httpd'],
    enable    => true,
    ensure    => running,
  }
}


node 'dev.lab.example.com' {
  package { 'httpd':
    ensure  => present,
    allow_virtual => false
  }
 
  service { 'httpd':
    require   => Package['httpd'],
    enable    => true,
    ensure    => running,
  }
}

node default {}
