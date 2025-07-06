# 2-puppet_custom_http_response_header.pp
# Puppet manifest to install nginx and add a custom header: X-Served-By

exec { 'update_apt':
  command => '/usr/bin/apt-get update',
  path    => ['/usr/bin', '/usr/sbin'],
}

package { 'nginx':
  ensure  => installed,
  require => Exec['update_apt'],
}

file { '/etc/nginx/sites-available/default':
  ensure  => file,
  require => Package['nginx'],
  content => template('nginx/custom_default.erb'),
  notify  => Service['nginx'],
}

file { '/etc/hostname':
  ensure => file,
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  hasrestart => true,
  require    => Package['nginx'],
}
