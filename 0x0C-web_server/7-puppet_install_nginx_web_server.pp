# 7-puppet_install_nginx_web_server.pp

class nginx_setup {
  package { 'nginx':
    ensure => installed,
  }

  service { 'nginx':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => Package['nginx'],
  }

  file { '/var/www/html/index.html':
    ensure  => file,
    content => "Hello World!\n",
    require => Package['nginx'],
  }

  # Custom nginx config for redirect and root page
  file { '/etc/nginx/sites-available/default':
    ensure  => file,
    content => template('nginx/default.erb'),
    notify  => Service['nginx'],
    require => Package['nginx'],
  }
}

include nginx_setup
